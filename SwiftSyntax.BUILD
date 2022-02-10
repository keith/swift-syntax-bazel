load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

cc_library(
    name = "_CSwiftSyntax",
    srcs = glob(["Sources/_CSwiftSyntax/src/*.c"]),
    hdrs = glob(["Sources/_CSwiftSyntax/include/*.h"]),
    copts = ["-Iexternal/com_github_keith_swift_syntax/Sources/_CSwiftSyntax/include"],
    linkstatic = True,
    tags = ["swift_module"],
)

swift_library(
    name = "SwiftSyntax",
    srcs = glob(["Sources/SwiftSyntax/**/*.swift"]),
    module_name = "SwiftSyntax",
    private_deps = ["_CSwiftSyntax"] + select({
        "@platforms//os:macos": [
            "@StaticInternalSwiftSyntaxParser//:lib_InternalSwiftSyntaxParser",
        ],
        "//conditions:default": [],
    }),
    visibility = ["//visibility:public"],
)
