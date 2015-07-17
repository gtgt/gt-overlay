# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_MINIMAL="4.7"
KDE_SCM="git"
KMNAME="scratch/theoc/${PN}"

inherit kde4-base

DESCRIPTION="KDE app to set up a KDE Development environment"
HOMEPAGE="http://github.com/terietor/kdemerge"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS=""
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
    $(add_kdebase_dep kcmshell)
"

#src_install() {
#	exeinto /usr/local/bin
#	newexe ${FILESDIR}/git-wrapper git

#	exeinto /usr/local/bin
#	doexe ${FILESDIR}/create_repolinks

#	kde4-base_src_install
#}
