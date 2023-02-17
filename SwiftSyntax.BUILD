load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@com_github_keith_swift_syntax_bazel//:opt_wrapper.bzl", "opt_wrapper")

swift_library(
    name = "SwiftSyntax_lib",
    srcs = glob(
        ["Sources/SwiftSyntax/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
    module_name = "SwiftSyntax",
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
    srcs = glob(
        ["Sources/SwiftBasicFormat/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
    module_name = "SwiftBasicFormat",
    deps = [":SwiftSyntax_lib"],
)

swift_library(
    name = "SwiftDiagnostics",
    srcs = glob(
        ["Sources/SwiftDiagnostics/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
    module_name = "SwiftDiagnostics",
    deps = [":SwiftSyntax_lib"],
)

swift_library(
    name = "SwiftParser_lib",
    srcs = glob(
        ["Sources/SwiftParser/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
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
    srcs = glob(
        ["Sources/SwiftSyntaxBuilder/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
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
        ":SwiftSyntaxBuilder_lib",
    ],
)

swift_library(
    name = "SwiftOperators_lib",
    srcs = glob(
        ["Sources/SwiftOperators/**/*.swift"],
        exclude = ["**/*.docc/**"],
    ),
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
