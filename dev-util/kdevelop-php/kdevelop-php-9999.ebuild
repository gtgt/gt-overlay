# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kdevelop"
KDE_SCM="git"
EGIT_REPONAME="kdev-php"
inherit kde4-base

DESCRIPTION="PHP plugin for KDevelop 4"

KEYWORDS=""
LICENSE="GPL-2 LGPL-2"
IUSE="debug +doc quanta kdevelop"

DEPEND="
	>=dev-util/kdevelop-pg-qt-0.9.0
"
#	quanta? ( dev-util/quanta )

RDEPEND="
	kdevelop? ( dev-util/kdevelop )
	doc? ( >=dev-util/kdevelop-php-docs-${PV}:${SLOT} )
"
