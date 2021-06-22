"""
"""

load("@build_bazel_rules_apple//apple:providers.bzl", "AppleFrameworkImportInfo")
load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")

def _cc_import_workaround_impl(ctx):
    framework_name = ctx.file.library.basename.split(".")[0][3:]
    output = ctx.actions.declare_file(
        "{0}.framework/{0}".format(framework_name),
    )

    ctx.actions.run_shell(
        inputs = [ctx.file.library],
        outputs = [output],
        arguments = [ctx.file.library.path, output.path, framework_name],
        command = """
mkdir -p "$(dirname $2)"
cp "$1" "$2"
codesign --remove-signature "$2"
install_name_tool -id @rpath/$3.framework/$3 "$2"
""",
    )

    framework_imports = [output]

    cc_toolchain = find_cpp_toolchain(ctx)
    cc_feature_configuration = cc_common.configure_features(
        ctx = ctx,
        cc_toolchain = cc_toolchain,
        requested_features = ctx.features,
        unsupported_features = ctx.disabled_features,
    )
    library_to_link = cc_common.create_library_to_link(
        actions = ctx.actions,
        cc_toolchain = cc_toolchain,
        feature_configuration = cc_feature_configuration,
        dynamic_library = ctx.file.library,
    )
    linker_input = cc_common.create_linker_input(
        owner = ctx.label,
        libraries = depset([library_to_link]),
        # Required for linking with cc_common.link, but ignored at runtime, also ignored by Apple binaries
        user_link_flags = depset(["-Wl,-weak_framework,{}".format(framework_name)]),
        additional_inputs = depset(framework_imports),
    )
    return [
        # For binaries linked with bazel's Apple infra, which ignores CcInfo
        apple_common.new_objc_provider(
            dynamic_framework_file = depset(framework_imports),
        ),
        # FIXME: derive archs?
        AppleFrameworkImportInfo(framework_imports = depset(framework_imports), build_archs = depset(["x86_64"])),
        # For cc_common.link binaries
        CcInfo(
            linking_context = cc_common.create_linking_context(
                linker_inputs = depset([linker_input]),
            ),
        ),
    ]

cc_import_workaround = rule(
    implementation = _cc_import_workaround_impl,
    attrs = dict(
        library = attr.label(allow_single_file = [".dylib"]),
        _cc_toolchain = attr.label(
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain"),
        ),
    ),
    toolchains = ["@bazel_tools//tools/cpp:toolchain_type"],
    fragments = ["cpp"],
)
