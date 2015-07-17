# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/q4wine/q4wine-0.112-r1.ebuild,v 1.2 2010/06/10 21:10:57 maekke Exp $

EAPI="5"

inherit git-2 cmake-utils

LANGS="cs de en es he it ru uk pl pt"
DESCRIPTION="Qt4 utility for Wine applications and prefixes management."
HOMEPAGE="http://q4wine.brezblock.org.ua/"
EGIT_REPO_URI="git://github.com/brezerk/q4wine.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug +icoutils +wineappdb +dbus gnome kde"

for x in ${LANGS}; do
        IUSE+=" linguas_${x}"
done

DEPEND="dev-qt/qtdbus:4
        dev-qt/qtsql:4[sqlite]
        dev-util/cmake"

RDEPEND="dev-qt/qtgui:4
        dev-qt/qtsql:4[sqlite]
        app-admin/sudo
        app-emulation/wine
        >=sys-apps/which-2.19
        icoutils? ( >=media-gfx/icoutils-0.26.0 )
        sys-fs/fuseiso
        kde? ( kde-base/kdesu )
        gnome? ( x11-libs/gksu )
        dbus? ( dev-qt/qtdbus:4 )"

DOCS=(AUTHORS ChangeLog README)

src_unpack() {
	git_src_unpack
}

src_configure() {
        mycmakeargs="${mycmakeargs} \
                $(cmake-utils_use debug DEBUG) \
                $(cmake-utils_use_with icoutils ICOUTILS) \
                $(cmake-utils_use_with wineappdb WINEAPPDB) \
                $(cmake-utils_use_with dbus DBUS)"

        cmake-utils_src_configure
}

src_install() {
        cmake-utils_src_install
        for x in ${LANGS}; do
                if ! has ${x} ${LINGUAS}; then
                        find "${D}" -name "${PN}_${x}*.qm" -exec rm {} \;
                fi
        done
}
