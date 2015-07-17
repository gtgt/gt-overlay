# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

inherit autotools eutils

DESCRIPTION="Apple Filing Protocol client and library implemented in FUSE"
HOMEPAGE="http://sourceforge.net/projects/afpfs-ng/"
SRC_URI="mirror://sourceforge/afpfs-ng/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+fuse static-libs"

RDEPEND="sys-libs/readline
	dev-libs/gmp
	dev-libs/libgcrypt
	fuse? ( sys-fs/fuse )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/*
#	mv -v ${P}/lib/identify.c lib || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable fuse fuse) \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS Bugs.txt ChangeLog FUTURE NEWS \
		docs/{FEATURES.txt,README,REPORTING-BUGS.txt,performance}
	use static-libs || find "${ED}" -name '*.la' -delete
}
