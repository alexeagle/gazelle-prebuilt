# Prebuilt Gazelle

[Gazelle](https://github.com/bazelbuild/bazel-gazelle) is a tool for generating BUILD files for Bazel or compatible build systems.

## Why prebuild?

Gazelle is commonly built from source on developer's machines, using a Go toolchain.
However this doesn't always work well.

Here's a representative take:

https://plaid.com/blog/hello-bazel/

> A week later, reports started coming in from users complaining that running the tool was taking too long, sometimes multiple minutes. This took us by surprise – the team had not encountered any slowness in the 6 months leading up to that moment, and the generation was only taking a handful of seconds in CI. Once we added instrumentation to our tooling, we were surprised to find a median duration of about 20 seconds and a p95 duration extending to several minutes.

Not only can it be slow, it can often be broken. That's because Gazelle extensions don't have to be written in pure Go.

For example see this issue, where the Python extension depends on a C library called TreeSitter, which forces projects to setup a functional and hermetic cc toolchain:

https://github.com/bazel-contrib/rules_python/issues/1913

## Install

1. Configure Bazel to fetch the binary you need from our GitHub release. There are a few ways:
  - We recommend using [rules_multitool](https://github.com/theoremlp/rules_multitool) for this; see the release notes on the release you choose.
  - Simplest: `http_file` with a `native_binary#select`
  - https://dotslash-cli.com/

2. Verify that you can run that binary from the command-line, based on the label.

For example with rules_multitool:

```sh
$ bazel run @multitool//tools/gazelle
```

3. Add a `gazelle` target to your `BUILD` file, referencing the label from the previous step.

```starlark
load("@gazelle//:def.bzl", "gazelle")

gazelle(name = "gazelle", gazelle = "@multitool//tools/gazelle")
```

4. Continue as normal from the [gazelle](https://github.com/bazelbuild/bazel-gazelle) setup docs.

5. When you want to update to a new version, use [multitool](https://github.com/theoremlp/multitool): `multitool update tools.lock.json` to update the lockfile.

## Language extensions

Gazelle has to be built with a list of supported language extensions.
See [BUILD](BUILD) for the list currently built-in.

The language extension you need isn't already built-in?

1. Add it to this repo and turn on for everyone. See [CONTRIBUTING.md](CONTRIBUTING.md)
2. Or, you can build your own binary and use it in your org. Fork this repo to your own GitHub org and add dependencies on your gazelle extensions, or just write them directly in the fork repo.
