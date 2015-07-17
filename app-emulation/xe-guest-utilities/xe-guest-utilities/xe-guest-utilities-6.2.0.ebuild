# Copyright 2011 Pandu E Poluan
# Distributed under the terms of the GNU General Public License v3 or a newer version
# $Header: $

# xe-guest-utilities-5.6.100.ebuild

EAPI="4"
inherit eutils rpm

MERGE_TYPE="binary"

DESCRIPTION="Installs Citrix XenTools binaries to enhance performance of Gentoo VMs on XenServer"
HOMEPAGE="http://www.citrix.com/English/ps2/products/product.asp?contentID=683148&ntref=prod_cat"
KEYWORDS="~x86 ~amd64 -*"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RESTRICT="fetch"

DEPEND=""
RDEPEND=""

##############################################################################

pkg_setup () {
	export mntdir=/tmp/xs-tools

	ebegin "Trying to find xs-tools.iso in the existing block devices"
	
	# Temporary dir for mounting
	mkdir -p ${mntdir}
	
	blkdevs="$(ls -l /sys/block/*/device | sed -r 's|.+/sys/block/([a-z]+)/device.+|/dev/\1|')"
	for d in $blkdevs; do
		mount $d ${mntdir} &> /dev/null || continue
		if [[ -e ${mntdir}/Linux ]] ; then
			if [[ -e ${mntdir}/installwizard.msi ]] ; then
				export xsiso=$d
				break
			fi
		fi
		umount $d &> /dev/null
	done

	if [[ -z "$xsiso" ]] ; then
		eend 1
		eerror "Can't find xs-tools.iso in any block devices."
		eerror "If you've mounted the device containing xs-tools.iso,"
		eerror "please unmount if first!"
		die " "
	else
		eend 0
		einfo "Found xs-tools.iso in $xsiso"
	fi

	# If found, the device is still mounted at this moment

	arch=`uname -m`
	ebegin "Copying files from ${mntdir}/Linux/${PN}-*.${arch}.rpm to ${DISTDIR}/ (arch: ${arch})"
	[[ $arch != "x86_64" ]] && arch=i386
 	if ! cp ${mntdir}/Linux/${PN}-*.${arch}.rpm "${DISTDIR}/" ; then
		eend 1
		eerror "Failed copying sources from ${xsiso} (mounted at ${mntdir})"
		die	"Please check for errors on media"
	else
		eend 0
	fi

	ebegin "Unmounting ${xsiso}"
	if ! umount ${xsiso} ; then
		eend 1
		ewarn " "
		ewarn "WARNING! Failed unmounting ${xsiso} from ${mntdir}"
		ewarn "emerge will continue, but you must unmount ${xsiso} yourself."
		ewarn " "
	else
		rm -rf ${mntdir}
		eend 0
	fi

}

##############################################################################

src_unpack () {
	einfo "Unpacking .rpm files"
	mkdir -p "${S}"
	cd "${S}"
	rpm_unpack ${DISTDIR}/*.rpm
}

##############################################################################

src_prepare() {
	cd "${S}/usr/sbin"
	epatch "${FILESDIR}/${PV}/${PN}-xe-linux-distribution.patch"

	einfo "Replacing incompatible files with Gentoo OpenRC-compatible fiels"
	rm -f ${S}/etc/init.d/xe-linux-distribution
	cp  ${FILESDIR}/xe-daemon.initscript ${S}/etc/init.d/xe-daemon
	cp  ${FILESDIR}/xe-daemon.conf ${S}/etc/conf.d/xe-daemon
	
	chmod a+x ${S}/etc/init.d/xe-daemon
	
	einfo "Remaking symlinks"
	cd "${S}/usr/bin"
	for f in xenstore-*; do
		rm -f $f
		ln -s xenstore $f
	done
}

##############################################################################

src_compile() {
	true;
}

##############################################################################

src_test() {
	true;
}

##############################################################################

src_install() {
	cp -R "${S}/etc" "${D}/" || die "Failed copying 'etc'!"
	cp -R "${S}/usr" "${D}/" || die "Failed copying 'usr'!"
}

##############################################################################

pkg_postinst() {
	einfo "Installation done."
	einfo " "
	einfo "To start the Citrix XenTools xe-daemon, enter:"
	einfo " "
	einfo "        /etc/init.d/xe-daemon start"
	einfo " "
	einfo "If you want xe-daemon to run at startup, enter:"
	einfo " "
	einfo "        rc-update add xe-daemon default"
	einfo " "
}

##############################################################################

pkg_prerm() {
	if /etc/init.d/xe-daemon status | grep "status: started" &> /dev/null; then
		einfo "Detected xe-daemon still running. Attempting to stop:"
		/etc/init.d/xe-daemon stop
		assert "Cannot stop xe-daemon! Aborting."
	fi
	einfo "Removing xenstore cache"
	rm -rf /var/cache/xenstore
	einfo "Removing xe-linux-distribution cache"
	rm -rf /var/cache/xe-linux-distribution
}
