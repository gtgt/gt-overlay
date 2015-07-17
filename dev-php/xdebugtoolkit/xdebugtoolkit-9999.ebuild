# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/elogviewer/elogviewer-0.6.2-r2.ebuild,v 1.1 2013/02/17 10:05:36 zmedico Exp $

EAPI="5"
PYTHON_DEPEND=2

inherit eutils python subversion

DESCRIPTION="GTK+ based utility to parse the contents of elogs created by Portage"
HOMEPAGE="http://code.google.com/p/${PN}/"

ESVN_REPO_URI="http://${PN}.googlecode.com/svn/trunk/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=">=sys-apps/portage-2.1
	>=dev-python/pygtk-2.0
	>=media-gfx/graphviz-2.26.3"

#src_prepare() {
	# Apply patch from Bug 349071 to restore missing newline
#	epatch "${FILESDIR}/${P}-missing_newline.patch"
	# Fix bug #453016
#	sed -e 's|is not ""|!= ""|' -i elogviewer || die
#}

src_install() {
	dobin "${WORKDIR}"/${P}/xdot-pygoocanvas.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/cg2dot.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/cgsplit.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/dot.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/reader.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/ubigraph.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/cgparser.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/cgparsermx.py || die "dobin failed"
	dobin "${WORKDIR}"/${P}/stylers/default.py || die "dobin failed"
	#dodoc "${WORKDIR}"/${PN}/CHANGELOG
	#doman "${WORKDIR}"/elogviewer.1
	#make_desktop_entry elogviewer Elogviewer "" "System" ||
	#	die "Couldn't make desktop entry"
	python_convert_shebangs -r 2 "${ED}"
}

pkg_postinst() {
	elog
	elog "cg2dot - converter from Xdebug cachegrind files to the dot format."
	elog "cgsplit - splitter for appended cachegrind files."
	elog
}
