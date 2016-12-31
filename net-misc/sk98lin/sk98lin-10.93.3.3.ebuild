# Copyright 2015 GT
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils linux-info linux-mod

DESCRIPTION="Patched sk98lin driver for Marvell Yukon (2) network cards."
HOMEPAGE="https://github.com/kinumi/sk98lin"
SRC_URI="mirror://github/../kinumi/${PN}/archive/${PV}.tar.gz"
LICENSE="Marvell"
KEYWORDS="-* ~amd64 ~x86"

RESTRICT="mirror"

DEPEND="virtual/linux-sources"
RDEPEND=""

S="${WORKDIR}/${P}/src"

MODULE_NAMES="sk98lin(net/misc)"

src_unpack() {
  unpack ${A}
  cd ${WORKDIR}/${P}/${PN}
	einfo "We are in: ${S}"
  tar cvfj ../${PN}.tar.bz2 *
  cd ..
  export IGNORE_SKAVAIL_CHECK=1
  ./install.sh -m
}

pkg_setup() {
	CONFIG_CHECK="~!SKGE ~!SKY2"
	ERROR_SKGE="SKGE: If you insist on building this, you must blacklist it!"
	ERROR_SKGE="SKY2: If you insist on building this, you must blacklist it!"

	linux-mod_pkg_setup

	BUILD_PARAMS="-C ${KV_DIR} M=${S} KBUILD_OUTPUT=${S} SUBDIRS=${S}"
	BUILD_TARGETS="sk98lin.ko"
}

src_prepare() {
#	epatch \
#		"${FILESDIR}/${PN}-xxx-yyyy.patch"

	epatch_user
  export CONFIG_SK98LIN=m
}

src_install() {
	linux-mod_src_install

	dodoc "${DISTDIR}/README.md" "${DISTDIR}/README.org"
}
