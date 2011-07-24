# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_LINGUAS=""
VIRTUALX_REQUIRED=test
KDE_HANDBOOK="optional"
KDE_SCM=git
inherit kde4-base

DESCRIPTION="Powerful markup and script language editor for KDE4"
KEYWORDS=""
LICENSE="GPL-2 LGPL-2"
IUSE="debug +php"
SLOT="4"

DEPEND="
	sys-devel/flex
	dev-libs/qjson
  dev-util/kdevplatform[subversion]
	dev-util/kdevelop-pg-qt
	php? ( dev-util/kdevelop-php[quanta] )
  $(add_kdebase_dep ksysguard)
  $(add_kdebase_dep libkworkspace)
"
RDEPEND="${DEPEND}"

RESTRICT="test"
