# Git Clean Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for customizing the git clean flags. Helpful if you want to exlude directories from being removed between job runs on the same agent and pipeline.

See the [git clean](https://git-scm.com/docs/git-clean) documentation for detailed information about all the flags available, and the `git-clean-flags` [buildkite-agent configuration](https://buildkite.com/docs/agent/v3/configuration) option.

## Example

The following will clean all files between running the job (including those in `.gitignore`), except for the `node_modules` directory:

```yml
steps:
  - commands:
    - node install
    - node test
    plugins:
      git-clean-flags#v1.0.0:
        flags: "-fdqx --exclude=node_modules"
```

## Configuration

### `flags` (required)

The command line arguments to pass to `git clean`.

Example: `"-fdqx --exclude=node_modules"`

## License

MIT (see [LICENSE](LICENSE))
