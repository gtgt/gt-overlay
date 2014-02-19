# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/xdebug-client/xdebug-client-2.1.3.ebuild,v 1.1 2012/01/27 13:38:12 olemarkus Exp $

KEYWORDS=""

MY_PV="${PV/_/}"
MY_PV="${MY_PV/rc/RC}"

inherit git-2

DESCRIPTION="Xdebug client for the Common Debugger Protocol (DBGP)."
HOMEPAGE="http://www.xdebug.org/"
EGIT_REPO_URI="git://github.com/derickr/xdebug.git"

LICENSE="Xdebug"
SLOT="0"
IUSE="libedit"

#S="${WORKDIR}/xdebug-${MY_PV}/debugclient"

DEPEND="libedit? ( dev-libs/libedit )"
RDEPEND="${DEPEND}"

#src_unpack() {
#	chmod +x "${S}"/configure
#}

src_compile() {
	S="${WORKDIR}/xdebug-client-${MY_PV}/debugclient"
	cd ${S}
	./buildconf
	econf $(use_with libedit) --disable-dependency-tracking
	emake || die "Build of debug client failed!"
}

src_install() {
	newbin debugclient xdebug
}
