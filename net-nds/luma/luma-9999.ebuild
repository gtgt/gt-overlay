# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit kde4-base subversion

DESCRIPTION="LDAP admin"
HOMEPAGE="http://luma.sourceforge.net/"
ESVN_REPO_URI="https://luma.svn.sourceforge.net/svnroot/luma/branches/qt4/luma"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="debug samba"

DEPEND="
	>=dev-lang/python-2.4.0
	>=dev-python/python-ldap-2.3.0
	>=dev-python/PyQt4-4.8.0
	samba? ( net-fs/samba )
"
RDEPEND="${DEPEND}"
