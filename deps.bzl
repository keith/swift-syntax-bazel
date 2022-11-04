# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_swift_syntax",
        sha256 = "c1447afe703924ac26a86510140a8bde9b6ce1d10594c2e07f49c52a01562476",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        strip_prefix = "swift-syntax-e1f771ea8ad8bc172de766e0963a76aeb7b08cef",
        url = "https://github.com/apple/swift-syntax/archive/e1f771ea8ad8bc172de766e0963a76aeb7b08cef.tar.gz",
    )
