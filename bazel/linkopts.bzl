"""
This file contains flags for the C++ linker, referred to by Bazel as linkopts.

For similar reasons as //bazel/copts.bzl, we define "global" flags we want to pass to the linker
here. We do allow subpackages to conditionally set linkopts because that is likely to be more
readable than trying to express with select statements whether a library should be linked against
because the relevant Skia source file was compiled in.

"""

OPT_LEVEL = select({
    "//bazel/common_config_settings:debug_build": [],
    "//bazel/common_config_settings:release_build": [
        "-dead_strip",
        "-Wl,--gc-sections",
        "-Wl,--strip-all",
    ],
    "//bazel/common_config_settings:fast_build": [
        "-Wl,--strip-debug",
    ],
})

DEFAULT_LINKOPTS = OPT_LEVEL