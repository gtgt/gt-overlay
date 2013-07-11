# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit kde4-base

DESCRIPTION="A KDE utility similar to Jing or Skitch not yet as powerful as them."
HOMEPAGE="http://kde-apps.org/content/show.php/Kaption?content=139302"
SRC_URI="http://kde-apps.org/CONTENT/content-files/139302-${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=kde-base/kdelibs-4.4.0
		>=dev-qt/qtcore-4.6.2"

S="${WORKDIR}/${P}"
