# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_swift_syntax",
        sha256 = "6a748d2118a5865116ccd1b099b566f6754514d7ecb83413e1cc2c46b5faa619",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        strip_prefix = "swift-syntax-1bf320abf560142ce29967328033ae04d447774f",
        url = "https://github.com/apple/swift-syntax/archive/1bf320abf560142ce29967328033ae04d447774f.tar.gz",
    )
