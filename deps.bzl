# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    http_archive(
        name = "com_github_keith_swift_syntax",
        sha256 = "5f1a0c90e60c79b3d23cd1d052003286bc81c9bea8790211f216c677f2db8ac7",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        strip_prefix = "swift-syntax-8b8eb44a583e13ab32791595c118c346b1678c2d",
        url = "https://github.com/apple/swift-syntax/archive/8b8eb44a583e13ab32791595c118c346b1678c2d.tar.gz",
    )
