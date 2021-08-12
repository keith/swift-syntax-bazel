# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_lib_internalswiftsyntaxparser",
        sha256 = "5f7bdaa05fe3f6da62de5e21dbe849d4619ea268aa4a7c0ad2cde3360f555dbd",
        url = "https://github.com/keith/lib_InternalSwiftSyntaxParser/releases/download/13.0.13A5212g/lib_InternalSwiftSyntaxParser.dylib.zip",
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
        sha256 = "d766397f890a9b9a439bf850f4294d64a979085fa29c07a19e56ff833c9ec07a",
        strip_prefix = "swift-syntax-593d01f4017cf8b71ec28689629f7b9a6739df0b",
        # Point in time from the release/5.5 branch, should be updated to the tag once it exists
        url = "https://github.com/apple/swift-syntax/archive/593d01f4017cf8b71ec28689629f7b9a6739df0b.tar.gz",
    )
