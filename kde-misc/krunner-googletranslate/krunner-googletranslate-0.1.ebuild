# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/krunner-kopete-contacts/krunner-kopete-contacts-0.4.ebuild,v 1.1 2011/01/15 15:31:36 tampakrap Exp $

EAPI=4
inherit kde4-base

DESCRIPTION="A krunner plug-in that translates words using google."
HOMEPAGE="http://gt.kani.hu/kde/krunner"
SRC_URI="http://gt.kani.hu/kde/krunner/${P}.tbz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libkworkspace)
	$(add_kdebase_dep krunner)
"
RDEPEND="${DEPEND}"

DOCS="README"

S="${WORKDIR}/${PN}"
