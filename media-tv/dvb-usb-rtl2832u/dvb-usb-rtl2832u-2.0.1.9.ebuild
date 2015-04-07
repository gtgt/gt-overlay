# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: gt-overlay/media-video/dvb-usb-rtl2832u.ebuild,v 1.0 2011/09/22 19:01:45 gt Exp $

EAPI="5"

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

MY_LIBDIR="kernel/drivers/media/dvb/dvb-usb"

S=${WORKDIR}/${PN}

MODULE_NAMES="dvb-usb-rtl2832u(${MY_LIBDIR}:${S}:${S})"
BUILD_TARGETS="modules"

pkg_setup() {
	CONFIG_CHECK="~DVB_USB"
	check_extra_config
	export INSTALL_MOD_PATH="/"
	export INSTALL_MOD_DIR="${MY_LIBDIR}"
	export KBUILD_SRC="${KERNEL_DIR}"
	BUILD_PARAMS="-C ${KERNEL_DIR} M=${S}"
	linux-mod_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/compat-2.6.38.patch
}
