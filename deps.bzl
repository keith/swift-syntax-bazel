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
        url = "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.7-beta5/lib_InternalSwiftSyntaxParser.xcframework.zip",
        sha256 = "52f6eb8af2519e7d42298bb874670d788b95f599ff023c449a34cfe20d04c702",
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
        sha256 = "bb9b5bb3a169f1fd6a3a025ac19b22c88060ef3bfe3d41aa349f330f5cb5f310",
        strip_prefix = "swift-syntax-swift-5.7-DEVELOPMENT-SNAPSHOT-2022-08-02-a",
        url = "https://github.com/apple/swift-syntax/archive/refs/tags/swift-5.7-DEVELOPMENT-SNAPSHOT-2022-08-02-a.tar.gz",
    )
