# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_lib_internalswiftsyntaxparser",
        sha256 = "085083c1c2a2d1f9f5e46c827aaf1f3e46dfb92dd4d9c298c7255dcb6a573ab9",
        url = "https://github.com/keith/lib_InternalSwiftSyntaxParser/releases/download/13.0.13A233/lib_InternalSwiftSyntaxParser.dylib.zip",
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
        sha256 = "ad7ba9d6647d2155c597144545cb7d6f7089ffbe50c467c31bbb946a27df4b6b",
        strip_prefix = "swift-syntax-cf40be70deaf4ce7d44eb1a7e14299c391e2363f",
        # Point in time from the release/5.5 branch, should be updated to the tag once it exists
        url = "https://github.com/apple/swift-syntax/archive/cf40be70deaf4ce7d44eb1a7e14299c391e2363f.tar.gz",
    )
