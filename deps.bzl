# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    http_archive(
        name = "com_github_keith_swift_syntax",
        sha256 = "357af36cc593ac17822f31c7a035dd5b9cb8b90f310a5be48e19effafe86988b",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        strip_prefix = "swift-syntax-ef12dea8cb06b2d649d8602d15d2e956a86bf24b",
        url = "https://github.com/apple/swift-syntax/archive/ef12dea8cb06b2d649d8602d15d2e956a86bf24b.tar.gz",
    )
