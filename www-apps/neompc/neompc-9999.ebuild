# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion webapp eutils

DESCRIPTION="neompc is a php client specifically geared toward small screens"
HOMEPAGE="http://www.pixelhum.com/neompc/"
ESVN_REPO_URI="http://neompc.googlecode.com/svn/trunk/"
LICENSE="GPL-2"

KEYWORDS=""
IUSE=""

DEPEND="virtual/httpd-php"
RDEPEND="${DEPEND}"

src_install() {
	webapp_src_preinst

	cp -r . "${D}/${MY_HTDOCSDIR}"

	webapp_serverowned -R "${MY_HTDOCSDIR}/smarty/templates_c"

	webapp_src_install
}
