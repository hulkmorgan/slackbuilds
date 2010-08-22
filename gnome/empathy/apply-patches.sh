
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
# http://bugzilla.gnome.org/show_bug.cgi?id=592853
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/presence-icons.patch

set +e +o pipefail