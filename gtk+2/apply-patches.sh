# The set of patches from hell :)

SB_PATCHDIR=${CWD}/patches

# There's been this long standing debate about PNG and -lz
# and this patch is the workaround.  ;-)
zcat ${SB_PATCHDIR}/gtk.pnglz.diff.gz | patch -p1 -E --backup --verbose || exit 1

# Fix for x86_64 (does not hurt the other archs but note that we will start
# using /etc/gtk-2.0/$host instead of /etc/gtk-2.0/ now):
zcat ${SB_PATCHDIR}/gtk.etc.host.location.diff.gz | patch -p1 --verbose || exit 1

# http://bugzilla.redhat.com/show_bug.cgi?id=478400
zcat ${SB_PATCHDIR}/default_printer.patch.gz | patch -p0 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=384940
zcat ${SB_PATCHDIR}/print_authentication.patch.gz | patch -p0 -E --backup --verbose || exit 1
