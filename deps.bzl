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
        url = "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.6/lib_InternalSwiftSyntaxParser.xcframework.zip",
        sha256 = "88d748f76ec45880a8250438bd68e5d6ba716c8042f520998a438db87083ae9d",
        build_file_content = """
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")

apple_static_framework_import(
    name = "lib_InternalSwiftSyntaxParser",
    framework_imports = ["lib_InternalSwiftSyntaxParser.xcframework/macos-arm64_x86_64/lib_InternalSwiftSyntaxParser.framework/lib_InternalSwiftSyntaxParser"],
    visibility = ["//visibility:public"],
)
""",
    )

    http_archive(
        name = "com_github_keith_swift_syntax",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        sha256 = "1326d193f78251e85153550e0383f2c85bd7a5a7b1bc1b789be4399596c8e3f5",
        strip_prefix = "swift-syntax-0.50600.0",
        url = "https://github.com/apple/swift-syntax/archive/refs/tags/0.50600.0.tar.gz",
    )
