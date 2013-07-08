# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SLOT="0"
HOMEPAGE="none"
DESCRIPTION="Metapackage for appmenu"
LICENSE="GPL-2"
KEYWORDS="-alpha ~amd64 -ppc64 -sparc ~x86"
IUSE="gtk qt4 kde gnome"
DEPEND="gtk? ( x11-misc/appmenu-gtk )
		qt4?  ( x11-misc/appmenu-qt )
		kde? (
		  || (
		  kde-misc/plasma-widget-menubar
		  kde-misc/plasma-widget-kappmenubar
		  kde-misc/kded-appmenu
		  ) )
		gnome? ( x11-misc/indicator-appmenu )"
RDEPEND="${DEPEND}"
