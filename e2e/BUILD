load("@bazel_gazelle//:def.bzl", "gazelle")
load("@rules_go//go:def.bzl")

# gazelle:prefix e2e
gazelle(
    name = "gazelle",
    binary = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@gazelle_prebuilt_linux_amd64//file",
        "@bazel_tools//src/conditions:darwin_arm64": "@gazelle_prebuilt_darwin_arm64//file",
    }),
)
