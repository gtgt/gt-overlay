# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2 subversion

DESCRIPTION="Qt based Software Defined Radio Interface"
HOMEPAGE="http://cutesdr.sourceforge.net/"
ESVN_REPO_URI="http://cutesdr.svn.sourceforge.net/svnroot/cutesdr/trunk"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtmultimedia"
DEPEND="${RDEPEND}
	dev-vcs/subversion[webdav-neon]"

src_install() {
	dobin CuteSdr
	doicon cutesdr1.ico
	make_desktop_entry CuteSdr CuteSdr cutesdr1
}
