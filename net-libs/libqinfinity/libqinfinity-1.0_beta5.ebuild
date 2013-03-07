# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils kde4-base

DESCRIPTION="QT-style Interface for libinfinity"
HOMEPAGE="http://kobby.greghaynes.net/wiki/libqinfinity"
SRC_URI="http://kobby.greghaynes.net/file-cabinet/${P/_beta/b}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

DEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	>=net-libs/libinfinity-0.4.1
	dev-qt/qtcore
	>=virtual/gsasl-1.4.0
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P/_beta/b}

src_configure() {
  cmake "${S}" \
	-DLIBINFINITY_INCLUDES="/usr/include/libinfinity-0.5" -DLIBINFINITY_LIBRARY="/usr/lib/infinity-0.5" \
	-DLIBINFTEXT_INCLUDES="/usr/include/libinftext-0.5" -DLIBINFTEXT_LIBRARY="/usr/lib/inftext-0.5"
	ln -s ${S} `realpath ${S}/..`/libqinfinity-1.0_beta5_build

}

