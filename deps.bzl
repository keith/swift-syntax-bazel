# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_lib_internalswiftsyntaxparser",
        sha256 = "65566d949ecefa8156d0097a24b8213fff3bc6c0e26f2ee299b655357682613e",
        urls = ["https://github.com/keith/lib_InternalSwiftSyntaxParser/releases/download/12.5.12E262/lib_InternalSwiftSyntaxParser.dylib.zip"],
        build_file_content = """
filegroup(
    name = "library",
    srcs = ["lib_InternalSwiftSyntaxParser.dylib"],
    visibility = ["@com_github_keith_swift_syntax//:__pkg__"],
)
""",
    )

    http_archive(
        name = "com_github_keith_swift_syntax",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        sha256 = "a1ad87076794f2fd3edb016ffcb9f49de5a0cf1323809c60400753279ef510ba",
        strip_prefix = "swift-syntax-0.50400.0",
        url = "https://github.com/apple/swift-syntax/archive/0.50400.0.tar.gz",
    )
