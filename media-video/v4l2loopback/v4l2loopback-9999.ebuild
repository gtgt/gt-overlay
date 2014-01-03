# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/v4l2loopback/v4l2loopback-0.6.3-r1.ebuild,v 1.1 2013/05/15 22:57:45 naota Exp $

EAPI=4

inherit linux-mod vcs-snapshot git-2

DESCRIPTION="v4l2 loopback device which output is it's own input"
HOMEPAGE="https://github.com/umlaeute/v4l2loopback"
EGIT_REPO_URI="https://github.com/umlaeute/v4l2loopback.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="examples"

CONFIG_CHECK="VIDEO_DEV"
MODULE_NAMES="v4l2loopback(video:)"
BUILD_TARGETS="all"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	linux-mod_src_compile
	if use examples; then
		cd "${S}"/examples
		emake
	fi
}

src_install() {
	linux-mod_src_install
	dosbin utils/v4l2loopback-ctl
	dodoc doc/kernel_debugging.txt
	dohtml doc/v4l2.html
	if use examples; then
		dosbin examples/yuv4mpeg_to_v4l2
		docinto examples
		dodoc examples/{*.sh,*.c,Makefile}
	fi
}
