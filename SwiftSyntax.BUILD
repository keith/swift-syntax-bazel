load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@com_github_keith_swift_syntax_bazel//:opt_wrapper.bzl", "opt_wrapper")

cc_library(
    name = "_CSwiftSyntax",
    srcs = glob(["Sources/_CSwiftSyntax/src/*.c"]),
    hdrs = glob(["Sources/_CSwiftSyntax/include/*.h"]),
    linkstatic = True,
    tags = ["swift_module"],
)

swift_library(
    name = "SwiftSyntax_lib",
    srcs = glob(["Sources/SwiftSyntax/**/*.swift"]),
    module_name = "SwiftSyntax",
    private_deps = ["_CSwiftSyntax"],
)

opt_wrapper(
    name = "SwiftSyntax",
    visibility = ["//visibility:public"],
    deps = [
        ":SwiftSyntax_lib",
    ],
)

swift_library(
    name = "SwiftBasicFormat",
    srcs = glob(["Sources/SwiftBasicFormat/**/*.swift"]),
    module_name = "SwiftBasicFormat",
    deps = [":SwiftSyntax_lib"],
)

swift_library(
    name = "SwiftDiagnostics",
    srcs = glob(["Sources/SwiftDiagnostics/**/*.swift"]),
    module_name = "SwiftDiagnostics",
    deps = [":SwiftSyntax_lib"],
)

swift_library(
    name = "SwiftParser_lib",
    srcs = glob(["Sources/SwiftParser/**/*.swift"]),
    module_name = "SwiftParser",
    deps = [
        ":SwiftBasicFormat",
        ":SwiftDiagnostics",
        ":SwiftSyntax_lib",
    ],
)

opt_wrapper(
    name = "SwiftParser",
    visibility = ["//visibility:public"],
    deps = [
        ":SwiftParser_lib",
    ],
)

swift_library(
    name = "SwiftSyntaxBuilder_lib",
    srcs = glob(["Sources/SwiftSyntaxBuilder/**/*.swift"]),
    module_name = "SwiftSyntaxBuilder",
    deps = [
        ":SwiftBasicFormat",
        ":SwiftParser_lib",
        ":SwiftSyntax_lib",
    ],
)

opt_wrapper(
    name = "SwiftSyntaxBuilder",
    visibility = ["//visibility:public"],
    deps = [
        ":SwiftSyntaxBuilder_libSwiftParser_lib",
    ],
)

swift_library(
    name = "SwiftOperators_lib",
    srcs = glob(["Sources/SwiftOperators/**/*.swift"]),
    module_name = "SwiftOperators",
    deps = [
        ":SwiftDiagnostics",
        ":SwiftParser_lib",
        ":SwiftSyntax_lib",
    ],
)

opt_wrapper(
    name = "SwiftOperators",
    visibility = ["//visibility:public"],
    deps = [
        ":SwiftOperators_lib",
    ],
)
