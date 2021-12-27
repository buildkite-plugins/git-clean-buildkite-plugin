# Git Clean Buildkite Plugin [![Build status](https://badge.buildkite.com/a900662bffe4351f5e779b68520cfd2bd3e38e3ffc612d67de.svg?branch=master)](https://buildkite.com/buildkite/plugins-git-clean)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for customizing the git clean flags. Helpful if you want to exlude directories from being removed between job runs on the same agent and pipeline.

See the [git clean](https://git-scm.com/docs/git-clean) documentation for detailed information about all the flags available, and the `git-clean-flags` [buildkite-agent configuration](https://buildkite.com/docs/agent/v3/configuration) option.

## Example

The following will clean all files between running the job (including those in `.gitignore`), except for the `node_modules` directory:

```yml
steps:
  - commands:
    - npm install
    - npm test
    plugins:
      - git-clean#v1.0.0:
          flags: "-fdqx --exclude=node_modules"
```

## Configuration

### `flags` (required)

The command line arguments to pass to `git clean`.

Example: `"-fdqx --exclude=node_modules"`

## License

MIT (see [LICENSE](LICENSE))
