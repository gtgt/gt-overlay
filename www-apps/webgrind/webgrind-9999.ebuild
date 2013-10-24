# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit webapp git-2

KEYWORDS="~amd64 ~x86"

HOMEPAGE="https://github.com/jokkedk/webgrind"
DESCRIPTION="Webgrind for reading Xdebug profiler data.."
LICENSE="BSD"
IUSE=""

EGIT_REPO_URI="git://github.com/jokkedk/${PN}.git"

DEPEND="dev-php/xdebug"
RDEPEND="${DEPEND}
dev-lang/php
"
S="${WORKDIR}/${PN}"

src_install() {
  webapp_src_preinst
	mv * "${D}/${MY_HTDOCSDIR}/"
  webapp_src_install
}

