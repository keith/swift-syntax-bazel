load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@com_github_keith_swift_syntax_bazel//:cc_import_workaround.bzl", "cc_import_workaround")

cc_library(
    name = "_CSwiftSyntax",
    srcs = glob(["Sources/_CSwiftSyntax/src/*.c"]),
    hdrs = glob(["Sources/_CSwiftSyntax/include/*.h"]),
    copts = ["-Iexternal/com_github_keith_swift_syntax/Sources/_CSwiftSyntax/include"],
    linkstatic = True,
    tags = ["swift_module"],
)

cc_import_workaround(
    name = "library",
    library = "@com_github_keith_lib_internalswiftsyntaxparser//:library",
)

swift_library(
    name = "SwiftSyntax",
    srcs = glob(["Sources/SwiftSyntax/**/*.swift"]),
    module_name = "SwiftSyntax",
    private_deps = ["_CSwiftSyntax"] + select({
        "@platforms//os:macos": ["library"],
        "//conditions:default": [],
    }),
    visibility = ["//visibility:public"],
)
