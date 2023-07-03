setup() {
  set -eu -o pipefail
  source .env
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=/tmp/test-ddev-n8n
  mkdir -p $TESTDIR
  export PROJNAME=test-ddev-n8n
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null
}

health_checks() {
  ddev describe
  AUTH=$(echo -ne "$N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD" | base64 --wrap 0)
  curl -v --fail -H "Authorization: Basic ${AUTH}" http://127.0.0.1:5678
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev stop >/dev/null
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && sudo rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart
  health_checks
}

@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get bwilliamson55/ddev-n8n with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get bwilliamson55/ddev-n8n
  ddev restart >/dev/null
  health_checks
}

