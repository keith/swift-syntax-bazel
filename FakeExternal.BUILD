
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_binary", "swift_library", "swift_test")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_command_line_application", "macos_unit_test")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")

genrule(
name = "bla",
cmd = """echo '
import SwiftSyntax

_ = try! SyntaxParser.parse(source: "/dev/null")
' > $(OUTS)""",
outs = ["main.swift"],)

swift_binary(
    name = "swift_binary",
    srcs = ["bla"],
    visibility = ["//visibility:public"],
    deps = ["@com_github_keith_swift_syntax//:SwiftSyntax"],
)

genrule(
    name = "foo",
    outs = ["foo.swift"],
    cmd = "DYLD_PRINT_LIBRARIES=1 $(location :swift_binary) > $(OUTS)",
    exec_tools = [":swift_binary"],
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

