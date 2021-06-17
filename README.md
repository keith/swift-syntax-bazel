# swift-syntax-bazel

This repo provides a bazel target for
[`SwiftSyntax`](https://github.com/apple/swift-syntax). Most importantly
it handles vendoring `lib_InternalSwiftSyntaxParser` so your tool
doesn't depend on the specific Xcode path (or version) of your users.

## Usage

First make sure you've setup
[`rules_swift`](https://github.com/bazelbuild/rules_swift). Then add
this to your `WORKSPACE` (see the [releases
page](https://github.com/keith/swift-syntax-bazel/releases) for older
version support):

```bzl
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_keith_swift_syntax_bazel",
    sha256 = "TODO",
    url = "TODO",
)

load("@com_github_keith_swift_syntax_bazel//:deps.bzl", "swift_syntax_deps")

swift_syntax_deps()
```

Then for your target that depends on `SwiftSyntax` add this to its deps:

```bzl
...
    deps = [
        "@com_github_keith_swift_syntax//:SwiftSyntax",
    ]
...
```
