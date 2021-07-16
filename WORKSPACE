workspace(name = "com_github_keith_swift_syntax_bazel")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "c84962b64d9ae4472adfb01ec2cf1aa73cb2ee8308242add55fa7cc38602d882",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.31.2/rules_apple.0.31.2.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load("//:deps.bzl", "swift_syntax_deps")

swift_syntax_deps()

http_archive(
    name = "foo",
    sha256 = "c84962b64d9ae4472adfb01ec2cf1aa73cb2ee8308242add55fa7cc38602d882",
    build_file = "@//:FakeExternal.BUILD",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.31.2/rules_apple.0.31.2.tar.gz",
)
