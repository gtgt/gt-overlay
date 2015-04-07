# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit kde4-base

DESCRIPTION="CalDAV support for KDE Kontact"
HOMEPAGE="http://code.google.com/p/kcaldav/"
SRC_URI="http://kcaldav.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libcaldav
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-unbundle.patch" )

S=${WORKDIR}/${P}/src

src_configure() {
	mycmakeargs=( -DKCALDAV_VERSION=${PV} )
	kde4-base_src_configure
}
