
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/vlc-1.1.10-default_font.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/0001-Default-libv4l2-to-true.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/020_all_check_headers_regexps.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/100_all_glx_swap_interval.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/110_all_switcher.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/300_all_pic.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/320_all_cachegen.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/400_all_automake112.patch
sed -i.dmo_pic -e 's/fno-PIC/fPIC/' modules/codec/loader/Makefile.in
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/vlc-1.1.8-bugfix.opencv22.patch

set +e +o pipefail
