
SB_PATCHDIR=${CWD}/patches

zcat ${SB_PATCHDIR}/control-center-2.19.3-no-gnome-common.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/make-default.patch.gz | patch -p1 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=545075 
zcat ${SB_PATCHDIR}/slab-icon-names.patch.gz | patch -p0 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=555591
zcat ${SB_PATCHDIR}/default-layout-toggle.patch.gz | patch -p1 -E --backup --verbose || exit 1

zcat ${SB_PATCHDIR}/display-no-help.patch.gz | patch -p1 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=546036
zcat ${SB_PATCHDIR}/notification-theme.patch.gz | patch -p1 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=574973
zcat ${SB_PATCHDIR}/gcc-new-fingerprint-icons.patch.gz | patch -p0 -E --backup --verbose || exit 1
( cd capplets/about-me
  mv *png icons/
)

# call the Fedora/RHEL graphical passwd changing apps
# zcat ${SB_PATCHDIR}/control-center-2.25.2-passwd.patch.gz | patch -p1 -E --backup --verbose || exit 1
# zcat ${SB_PATCHDIR}/control-center-2.25.2-gecos.patch.gz | patch -p1 -E --backup --verbose || exit 1
# change default preferred apps to programs we ship
zcat ${SB_PATCHDIR}/default-applications.patch.gz | patch -p1 -E --backup --verbose || exit 1

zcat ${SB_PATCHDIR}/${NAME}-2.26.0-libxklavier4.patch.gz | patch -p1 -E --backup --verbose || exit 1
