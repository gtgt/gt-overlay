# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_authnz_external/mod_authnz_external-3.2.6.ebuild,v 1.3 2011/10/18 10:14:53 chainsaw Exp $

EAPI="3"
inherit eutils apache-module

DESCRIPTION="An Apache2 authentication DSO using external programs"
HOMEPAGE="http://code.google.com/p/mod-auth-external/"
SRC_URI="http://mod-auth-external.googlecode.com/files/${P}.tar.gz"

LICENSE="Apache-1.1"
SLOT="3"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCFILES="AUTHENTICATORS CHANGES INSTALL INSTALL.HARDCODE README TODO UPGRADE"

APACHE2_MOD_CONF="10_${PN}"
APACHE2_MOD_DEFINE="AUTHNZ_EXTERNAL"

APXS2_ARGS="-o ${PN}.so -c *.c"

need_apache2_4

src_prepare() {
	epatch "${FILESDIR}"/0001-Apache-2.4-compatibility.patch
}
