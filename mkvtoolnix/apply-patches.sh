
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-use-system-boost.patch
patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-fix-without-curl.patch

set +e +o pipefail
