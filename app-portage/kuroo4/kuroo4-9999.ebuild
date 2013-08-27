# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit subversion kde4-base eutils

DESCRIPTION="Kuroo is a Qt 4 based portage GUI"
HOMEPAGE="http://kuroo.sourceforge.net/"
SRC_URI=""
KDE_SCM="svn"
ESVN_REPO_URI="http://kuroo.svn.sourceforge.net/svnroot/kuroo/kuroo4/trunk"
ESVN_PROJECT="kuroo4"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+debug"

DEPEND="kde-base/kdesu
		dev-db/sqlite
		app-portage/gentoolkit
		kde-base/kompare"
RDEPEND="${DEPEND}"

pkg_setup() {
	kde4-base_pkg_setup
}

src_prepare() {
	kde4-base_src_prepare
}
