# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_apple"):
        fail("error: this depends on rules_apple but that wasn't setup")

    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    if not native.existing_rule("build_bazel_rules_apple"):
        fail("error: this depends on rules_apple but that wasn't setup")

    http_archive(
        name = "StaticInternalSwiftSyntaxParser",
        url = "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.7.1/lib_InternalSwiftSyntaxParser.xcframework.zip",
        sha256 = "feb332ba0a027812b1ee7f552321d6069a46207e5cd0f64fa9bb78e2a261b366",
        build_file_content = """
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")

apple_static_framework_import(
    name = "lib_InternalSwiftSyntaxParser",
    framework_imports = glob(
        ["lib_InternalSwiftSyntaxParser.xcframework/macos-arm64_x86_64/lib_InternalSwiftSyntaxParser.framework/**"],
        allow_empty = False,
    ),
    visibility = ["//visibility:public"],
)
""",
    )

    http_archive(
        name = "com_github_keith_swift_syntax",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        sha256 = "ea96dcd129ed4a05ea0efd7dbe39d929d47c55b1b5b8c2c7a8fce5c7de0bc4d8",
        strip_prefix = "swift-syntax-0.50700.1",
        url = "https://github.com/apple/swift-syntax/archive/refs/tags/0.50700.1.tar.gz",
    )
