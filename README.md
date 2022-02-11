# swift-syntax-bazel

This repo provides a bazel target for
[`SwiftSyntax`](https://github.com/apple/swift-syntax). Most importantly
it handles vendoring `lib_InternalSwiftSyntaxParser` as a static library
so your tool doesn't depend on a specific Xcode.app path or version.

## Usage

1. Make sure you've setup
   [`rules_apple`](https://github.com/bazelbuild/rules_apple)
2. Go to the [releases
   page](https://github.com/keith/swift-syntax-bazel/releases) to grab
   the WORKSPACE snippet for the Xcode version you're using
3. Add this target to your `deps`:

```bzl
    deps = [
        "@com_github_keith_swift_syntax//:SwiftSyntax",
    ]
```

## Details

Previously if you built `SwiftSyntax` in your bazel build, the final
binary would end up with a `rpath` like this:

```
/Applications/Xcode-12.4.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx
```

This meant if you used a remote bazel cache in your builds, everyone's
Xcode path would have to match for this to work correctly. This repo
links [a static
binary](https://github.com/keith/StaticInternalSwiftSyntaxParser) for
`lib_InternalSwiftSyntaxParser` instead.
