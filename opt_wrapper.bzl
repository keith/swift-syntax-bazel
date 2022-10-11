"""
A rule for forcing all dependent targets to be built in the opt configuration

This is useful when you're using 'bazel run' with a target, but still want the
benefits of compiler optimizations.
"""

load("@build_bazel_rules_swift//swift:swift.bzl", "SwiftInfo", "swift_common")

def _force_opt_impl(settings, _attr):
    return {
        "//command_line_option:compilation_mode": "opt",
        "//command_line_option:features": settings["//command_line_option:features"] + [
            "-swift.opt_uses_osize",
            "swift.opt_uses_wmo",
        ],
    }

_force_opt = transition(
    implementation = _force_opt_impl,
    inputs = [
        "//command_line_option:features",
    ],
    outputs = [
        "//command_line_option:compilation_mode",
        "//command_line_option:features",
    ],
)

def _impl(ctx):
    ccinfos = []
    swiftinfos = []

    for dep in ctx.attr.deps:
        ccinfos.append(dep[CcInfo])
        swiftinfos.append(dep[SwiftInfo])

    return [
        cc_common.merge_cc_infos(direct_cc_infos = ccinfos),
        swift_common.create_swift_info(swift_infos = swiftinfos),
    ]

opt_wrapper = rule(
    implementation = _impl,
    attrs = {
        "deps": attr.label_list(
            cfg = _force_opt,
        ),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
)
