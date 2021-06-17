# swift-syntax-bazel

This repo provides a bazel target for
[`SwiftSyntax`](https://github.com/apple/swift-syntax). Most importantly
it handles vendoring `lib_InternalSwiftSyntaxParser` so your tool
doesn't depend on the specific Xcode path (or version) of your users.

## Usage

1. Make sure you've setup
   [`rules_swift`](https://github.com/bazelbuild/rules_swift). Then add
   this to your `WORKSPACE`
2. Go to the [releases
   page](https://github.com/keith/swift-syntax-bazel/releases) to grab
   the snippet for the Xcode version you want
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
otool -L path/to/binary
/Applications/Xcode-12.4.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx
/usr/lib/swift
```

This meant if you used a remote bazel cache in your builds, everyone's
Xcode path would have to match for this to work correctly. With this
repo, and using bazel's
[`cc_import`](https://docs.bazel.build/versions/main/be/c-cpp.html#cc_import)
to depend on the library, you end up with a `rpath` that is relative,
and points into bazel's execroot:

```
otool -L path/to/binary
@loader_path/../../_solib_darwin_x86_64/_U@com_Ugithub_Ukeith_Uswift_Usyntax_S_S_Clibrary___U
/usr/lib/swift
```

Meaning it will be portable across machines.
