# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM=svn
KMNAME="playground/network"
inherit kde4-base

DESCRIPTION="This application is a network sniffing application for KDE. It needs a lot of features I'm working on, of course it's not yet complete but you can use it because it's in a stable state."
KEYWORDS="~amd64"
LICENSE="GPL"
IUSE="debug"
SLOT="4"

DEPEND="
	net-libs/libpcap
	dev-libs/libxml2
  $(add_kdebase_dep solid)
"
RDEPEND="${DEPEND}"

RESTRICT="test"
