load("@gazelle//:def.bzl", "gazelle_binary")

gazelle_binary(
    name = "gazelle",
    languages = [
        "@bazel_skylib_gazelle_plugin//bzl",
        "@gazelle//language/proto:go_default_library",
        "@gazelle//language/go:go_default_library",
    ],
)
