# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib

DESCRIPTION="lightweight low-dependency web interface to mpd"
HOMEPAGE="http://ion0.com/davemp/"
SRC_URI="http://ion0.com/davemp/downloads/files/${P}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-2.5"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/JSON-XS
	dev-perl/HTTP-Server-Simple
	dev-perl/Class-Accessor
	media-sound/mpd"

RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}/${P}"
	sed -i 's_themeroot = ./themes_themeroot=/usr/share/davemp/themes_' "davemp.conf"
	sed -i "s_use lib './lib'_use lib '/usr/lib/davemp/'_" "davempd.pl"
}

src_install() {
	doinitd "${FILESDIR}"/davemp
	insinto /usr/share/${PN}
	doins -r themes
	insinto /usr/$(get_libdir)/${PN}
	doins -r lib/*
	insinto /etc
	doins davemp.conf
	dobin davempd.pl
	dodoc README Changelog
}
