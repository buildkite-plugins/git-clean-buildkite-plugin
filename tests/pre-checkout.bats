#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Exports BUILDKITE_GIT_CLEAN_FLAGS" {
  export BUILDKITE_PLUGIN_GIT_CLEAN_FLAGS='-fdqx --exclude=node_modules'

  run "$PWD"/hooks/pre-checkout

  assert_success
  assert_output --partial "git clean flags set to: -fdqx --exclude=node_modules"
}