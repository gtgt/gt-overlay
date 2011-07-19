# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
inherit kde4-base git

DESCRIPTION="KDE Web editor/IDE"
KEYWORDS=""
IUSE="debug"
SLOT="4"

EGIT_REPO_URI="git://anongit.kde.org/quanta"

S="${WORKDIR}/${P}"
