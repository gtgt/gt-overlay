# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit kde4-base git-2

KMNAME="kregexpeditor"
KMMODULE="${PN}"
EGIT_REPO_URI="git://gitorious.org/kregexpeditor/kregexpeditor.git"

DESCRIPTION="KDE: Editor for Regular Expressions"
HOMEPAGE="http://www.kde.org"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"
