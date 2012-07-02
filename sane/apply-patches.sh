
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313038
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-pkgconfig.patch
# Fedora-specific, not generally applicable:
if [ "${SB_UACL}" = "YES" ] ;then
  patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-udev.patch
fi
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313039
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-man-encoding.patch
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313040
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.21-epson-expression800.patch
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313041
zcat ${SB_PATCHDIR}/sane-backends-1.0.20-lockdir.patch.gz | patch -p1 -E --backup --verbose
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313042
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-docs-utf8.patch
# Upstreamed at: https://alioth.debian.org/tracker/index.php?func=detail&aid=313043
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.21-SCX4500W.patch
# backported from upstream c5ca46c2d1be78c651afb843cc834cf2b5b24953
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-v4l.patch
# may need rebuilding if one of the above changes:
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-automake.patch
# submitted upstream: c648a4411e5eacf19da2de726dac06ec07dae302
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-av220-gray-modes.patch
# backported from upstream: cef28b4d46a0faa4d4acb60d815ac9a49036ba85
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-Lexmark-X1100.patch
# backported from upstream: 33bb529c5f8ca013fb499addc14c7fb229203ea8
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/sane-backends-1.0.22-avision-init-devices.patch

set +e +o pipefail
