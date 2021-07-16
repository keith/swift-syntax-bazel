load("@build_bazel_rules_swift//swift:swift.bzl", "swift_binary", "swift_library", "swift_test")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_command_line_application", "macos_unit_test")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")

genrule(
    name = "foo",
    outs = ["foo.swift"],
    cmd = "DYLD_PRINT_LIBRARIES=1 $(location :swift_binary) > $(OUTS)",
    tools = ["swift_binary"],
)

swift_library(
    name = "ios_lib",
    srcs = ["foo"],
)

ios_unit_test(
    name = "ios_unit_test",
    minimum_os_version = "11.0",
    deps = ["ios_lib"],
)

swift_test(
    name = "swift_test",
    size = "small",
    srcs = ["swift_test.swift"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntax"],
)

swift_binary(
    name = "swift_binary",
    srcs = ["main.swift"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntax"],
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
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntax"],
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
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntax"],
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
    tags = ["manual"],  # TODO: Currently broken
    target_compatible_with = ["@platforms//os:macos"],
)
