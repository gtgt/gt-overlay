# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 subversion

DESCRIPTION="This is another CD/DVD/Media cataloging software. This one can import WhereIsIt xml files, and has also other extras."
HOMEPAGE="http://kde-apps.org/content/show.php/QCat?content=62522"
SRC_URI=""

ESVN_REPO_URI="https://qcat.svn.sourceforge.net/svnroot/qcat"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"
DEPEND="dev-db/sqlite:3"

src_install() {
    # do normal installation
    qt4-r2_src_install
		einfo "Copy ${WORKDIR}/${P}/bin/* to ${D}/bin/"
		cp -r ${WORKDIR}/${P}/bin ${D}
}
