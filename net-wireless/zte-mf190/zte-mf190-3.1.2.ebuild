# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: gt-overlay/media-video/dvb-usb-rtl2832u.ebuild,v 1.0 2011/09/22 19:01:45 gt Exp $

EAPI="4"

inherit linux-mod eutils

DESCRIPTION="Onda (manufacturer) driver for ZTE-MF190 GSM USB modem"
HOMEPAGE=""
SRC_URI="http://gt.kani.hu/distfiles/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/linux-sources"
RDEPEND=""

MY_LIBDIR="kernel/drivers/usb/serial"

#S=${WORKDIR}/${PN}

MODULE_NAMES="onda(${MY_LIBDIR}:${S}:${S})"
BUILD_TARGETS=" "

src_compile() {
	ln -s ${KERNEL_DIR}/drivers/usb/serial/usb-wwan.h ${S}/usb-wwan.h
	linux-mod_src_compile
}

#    /sbin/udevadm control reload_rules >/dev/null 2>&1
#    /sbin/udevadm control --reload-rules >/dev/null 2>&1
#    /sbin/udevadm trigger --subsystem-match=block