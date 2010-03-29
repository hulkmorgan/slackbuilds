#!/bin/bash

set -e

module=$(basename $0 -snapshot.sh)
snaproot="lp:${module}"

tmp=$(mktemp -d)

trap cleanup EXIT
cleanup() {
  set +e
  [ -z "${tmp}" -o ! -d "${tmp}" ] || rm -rf "${tmp}"
}

unset CDPATH
pwd=$(pwd)
snap=${snap:-$(date +%Y%m%d)}

gitdate="$(echo -n ${snap} | head -c -4)-$(echo -n ${snap} | tail -c -4|head -c -2)-$(echo -n ${snap} | tail -c -2)"
[ "${snap}" = "$(date +%Y%m%d)" ] || SNAP_COOPTS="-r date:${gitdate}"

pushd "${tmp}"
  mkdir ${module}-${snap}
  bzr checkout --lightweight ${SNAP_COOPTS} ${snaproot} ${module}-${snap}/src
  pushd ${module}-${snap}/src
    [ -d release ] && rm -rf release
    echo "${snap}bzr" | python preparerelease.py
    find . -type d -name .bzr -print0 | xargs -0r rm -rf
  popd
  tar -Jcf "${pwd}"/${module}-${snap}.tar.xz ${module}-${snap}
popd >/dev/null