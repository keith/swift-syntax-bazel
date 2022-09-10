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
        url = "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.7/lib_InternalSwiftSyntaxParser.xcframework.zip",
        sha256 = "99803975d10b2664fc37cc223a39b4e37fe3c79d3d6a2c44432007206d49db15",
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
        sha256 = "d652af27b8a986d8fe4967292839374e06e3a962382318eaf00e0278746b6a41",
        strip_prefix = "swift-syntax-swift-5.7-DEVELOPMENT-SNAPSHOT-2022-08-30-a",
        url = "https://github.com/apple/swift-syntax/archive/refs/tags/swift-5.7-DEVELOPMENT-SNAPSHOT-2022-08-30-a.tar.gz",
    )
