# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="kregexpeditor"
KMMODULE="${PN}"
KDE_SCM="git"
EGIT_MIRROR="http://anongit.kde.org"
inherit kde4-base

DESCRIPTION="KDE: Editor for Regular Expressions"
HOMEPAGE="http://www.kde.org"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"
