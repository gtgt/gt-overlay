# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit kde4-base waf-utils

DESCRIPTION="Mindmapping-like tool for document generation."
HOMEPAGE="http://freehackers.org/~tnagy/semantik.html"
SRC_URI="http://freehackers.org/~tnagy/${P}.tar.bz2"

LICENSE="QPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-lang/ocaml
	dev-lang/python
"
RDEPEND="
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtxmlpatterns
	dev-lang/python[xml]
"

PATCHES=( "${FILESDIR}/${P}"-wscript_ldconfig.patch )

src_configure() {
	CCFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" "${S}"/waf \
		--prefix=/usr \
		configure || die "configure failed"
}
