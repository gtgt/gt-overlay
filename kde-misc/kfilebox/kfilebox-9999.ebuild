# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

LANGS="ar br cs de es fr gl it lt nl pl pt ru si tr zh zh_CN"

KDE_SCM="git"

inherit qt4-r2 git-2

#ESVN_REPO_URI="https://kdropbox.svn.sourceforge.net/svnroot/kdropbox"
EGIT_REPO_URI="git://gitorious.org/kfilebox/kfilebox.git"

DESCRIPTION="KDE Dropbox client"
HOMEPAGE="http://kdropbox.deuteros.es"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="4"
IUSE="debug "

for name in ${LANGS} ; do IUSE+="linguas_$name " ; done
unset name

DEPEND="kde-base/kdelibs"
RDEPEND="${DEPEND}"

#PATCHES=( "${FILESDIR}/kfilebox-${PV}-installroot.patch" )

src_install() {
  dobin bin/kfilebox
  MAKEOPTS="${MAKEOPTS} -j1" qt4-r2_src_install

  for lang in ${LANGS}; do
    if ! has ${lang} ${LINGUAS}; then
      rm -rf "${D}"/usr/share/locale/${lang} || die
    fi
  done
}

