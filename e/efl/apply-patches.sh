
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/efl-1.9.1-systemd209.patch

### Arch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/efl-1.10.0-giflib-5.1.0.patch

# Set to YES if autogen is needed
SB_AUTOGEN=YES

set +e +o pipefail
