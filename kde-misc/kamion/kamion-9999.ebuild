# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#LANGS="ar br cs de es fr gl it lt nl pl pt ru si tr zh zh_CN"

KDE_SCM="svn"

inherit kde4-base subversion

ESVN_REPO_URI="svn://svn.code.sf.net/p/kamion2/code/trunk/"
#EGIT_REPO_URI="git://gitorious.org/kfilebox/kfilebox.git"

DESCRIPTION="Kamion is a user-friendly user state migration and backup tool created for KDE 4."
HOMEPAGE="http://http://kamion2.sourceforge.net"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="4"
IUSE="debug "

S=${S}/trunk

#for name in ${LANGS} ; do IUSE+="linguas_$name " ; done
#unset name

DEPEND="kde-base/kdelibs"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/001-locale.patch" )

src_prepare() {
  epatch "${FILESDIR}/001-locale.patch"
}


#src_install() {
#  dobin bin/kfilebox
#  MAKEOPTS="${MAKEOPTS} -j1" qt4-r2_src_install
#
#  for lang in ${LANGS}; do
#    if ! has ${lang} ${LINGUAS}; then
#      rm -rf "${D}"/usr/share/locale/${lang} || die
#    fi
#  done
#}

