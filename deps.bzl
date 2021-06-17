# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_lib_internalswiftsyntaxparser",
        sha256 = "be41244b42a90d8d75a568c1067138d86ea70e3e679513288d0bb51f4bc3d435",
        urls = ["https://github.com/keith/lib_InternalSwiftSyntaxParser/releases/download/12.4.12D4e/lib_InternalSwiftSyntaxParser.dylib.zip"],
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
        sha256 = "976d31aad280ca299cc328a20bb2b94b68abd43378bb09319b906ca71bbae85e",
        strip_prefix = "swift-syntax-0.50300.0",
        url = "https://github.com/apple/swift-syntax/archive/0.50300.0.tar.gz",
    )
