load("@build_bazel_rules_swift//swift:swift.bzl", "swift_binary", "swift_library", "swift_test")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_command_line_application", "macos_unit_test")

swift_test(
    name = "swift_test",
    size = "small",
    srcs = ["swift_test.swift"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntaxParser"],
)

swift_binary(
    name = "swift_binary",
    srcs = ["main.swift"],
    visibility = ["//visibility:public"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntaxParser"],
)

sh_test(
    name = "swift_binary_test",
    size = "small",
    srcs = ["swift-binary-test.sh"],
    data = ["swift_binary"],
)

swift_library(
    name = "macos_test_library",
    srcs = ["macos_test_library.swift"],
    tags = ["manual"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntaxParser"],
)

macos_unit_test(
    name = "macos_unit_test",
    minimum_os_version = "10.15",
    target_compatible_with = ["@platforms//os:macos"],
    deps = ["macos_test_library"],
)

swift_library(
    name = "macos_binary_main",
    srcs = ["main.swift"],
    tags = ["manual"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntaxParser"],
)

macos_command_line_application(
    name = "macos_binary",
    minimum_os_version = "10.15",
    deps = ["macos_binary_main"],
)

sh_test(
    name = "macos_binary_test",
    size = "small",
    srcs = ["macos-binary-test.sh"],
    data = ["macos_binary"],
    target_compatible_with = ["@platforms//os:macos"],
)
