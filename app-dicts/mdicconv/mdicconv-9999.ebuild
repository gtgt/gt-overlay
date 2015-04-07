# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_SCM="git"

inherit kde4-base subversion

ESVN_REPO_URI="https://mdic.svn.sourceforge.net/svnroot/mdic/mdicconv"

DESCRIPTION="Dictionary converter for MDic."
HOMEPAGE="http://mdic.sourceforge.net"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

QT4_BUILT_WITH_USE_CHECK="sqlite3"

IUSE="debug "

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	epatch "${FILESDIR}/${PN}-stdio-include.patch"
	cp "${FILESDIR}/FindSqlite.cmake" "${S}/cmake/modules"
  #mycmakeargs=( -DKCALDAV_VERSION=${PV} )
  kde4-base_src_configure
}

