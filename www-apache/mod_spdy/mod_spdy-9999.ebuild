# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_diagnostics/mod_diagnostics-0.0.1.ebuild,v 1.6 2007/01/15 16:58:56 chtekk Exp $

inherit apache-module subversion

KEYWORDS=""

DESCRIPTION="An Apache2 module for Google's SPDY project."
HOMEPAGE="http://code.google.com/p/mod-spdy/"
ESVN_REPO_URI="http://mod-spdy.googlecode.com/svn/trunk/src/mod_spdy/"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

APACHE2_MOD_CONF="20_${PN}"
APACHE2_MOD_DEFINE="SPDY"

need_apache2

#src_unpack() {
#	mkdir -p "${S}" || die "mkdir S failed"
#	cp -f "${DISTDIR}/${P}.c" "${S}/${PN}.c" || die "source copy failed"
#}
