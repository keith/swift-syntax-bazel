# swift-syntax-bazel

This repo provides a bazel target for
[`SwiftSyntax`](https://github.com/apple/swift-syntax).

## Usage

1. Make sure you've setup
   [`rules_swift`](https://github.com/bazelbuild/rules_swift)
2. Go to the [releases
   page](https://github.com/keith/swift-syntax-bazel/releases) to grab
   the WORKSPACE snippet for the Xcode version you're using
3. Add this target to your `deps`:

```bzl
    deps = [
        "@com_github_keith_swift_syntax//:SwiftSyntax",
    ]
```
