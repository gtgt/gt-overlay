# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

#LANGS="ar br cs de es fr gl it lt nl pl pt ru si tr zh zh_CN"

KDE_SCM="git"

inherit kde4-base subversion

ESVN_REPO_URI="https://mdic.svn.sourceforge.net/svnroot/mdic/trunk"

DESCRIPTION="MDic is a multilingual dictionary for GNU/Linux operating system. Much like lightweight version of GoldenDict."
HOMEPAGE="http://mdic.sourceforge.net"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug +mdicconv "

#for name in ${LANGS} ; do IUSE+="linguas_$name " ; done
#unset name

DEPEND="
	kde-base/kdelibs
	mdicconv? ( app-dicts/mdicconv )
"
RDEPEND="${DEPEND}"

#PATCHES=( "${FILESDIR}/${P}-installroot.patch" )
