workspace(name = "com_github_keith_swift_syntax_bazel")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# TODO: Remove after next rules_apple release
http_archive(
    name = "xctestrunner",
    sha256 = "a2c048c6cc8b8ee7a9f7b130ce114cb11de9e3a860d6bae30aed82adcd7aa30b",
    strip_prefix = "xctestrunner-db0fce198e07d1df34f09c69cfe1eb9692c61a44",
    url = "https://github.com/google/xctestrunner/archive/db0fce198e07d1df34f09c69cfe1eb9692c61a44.tar.gz",
)

# TODO: Remove once rules_apple requires 0.26.0 or newer
http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "3e52a508cdc47a7adbad36a3d2b712e282cc39cc211b0d63efcaf608961eb36b",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.26.0/rules_swift.0.26.0.tar.gz",
)

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "a5f00fd89eff67291f6cd3efdc8fad30f4727e6ebb90718f3f05bbf3c3dd5ed7",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.33.0/rules_apple.0.33.0.tar.gz",
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
    build_file = "@//:FakeExternal.BUILD",
    sha256 = "c84962b64d9ae4472adfb01ec2cf1aa73cb2ee8308242add55fa7cc38602d882",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.31.2/rules_apple.0.31.2.tar.gz",
)
