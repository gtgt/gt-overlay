# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/vhba/vhba-20101015-r1.ebuild,v 1.2 2011/04/28 19:01:45 ulm Exp $

EAPI="3"

inherit linux-mod eutils

DESCRIPTION="Builds V4L and DVB kernel module for Realtek rtl2832u and compatible devices."
HOMEPAGE="http://linuxtv.org"
SRC_URI="http://gt.kani.hu/distfiles/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/linux-sources"
RDEPEND="!media-tv/v4l-dvb-hg"

#S=${WORKDIR}/${MY_P}
MODULE_NAMES="dvb_usb_rtl2832u"
BUILD_TARGETS=all

pkg_setup() {
	CONFIG_CHECK="~DVB_USB"
	check_extra_config
	BUILD_PARAMS="KDIR=${KV_DIR}"
	linux-mod_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/compat-2.6.38.patch
}
