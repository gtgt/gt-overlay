# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PHP_EXT_NAME="pinba"
PHP_EXT_INI="yes"
PHPSAPILIST="apache2 cgi cli fpm"
USE_PHP="php5-3 php5-4 php5-5 php5-6 php7-0"

inherit php-ext-source-r2 git-2 autotools

DESCRIPTION="Pinba is a realtime monitoring/statistics server for PHP using
MySQL as a read-only interface."
HOMEPAGE="http://pinba.org/"
EGIT_REPO_URI="git://github.com/tony2001/pinba_extension.git"
SRC_URI=""
LICENSE="PHP-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="threads"

DEPEND="
	dev-lang/php[threads=]
	dev-libs/protobuf"
RDEPEND="${DEPEND}"

src_prepare() {
	php-ext-source-r2_src_prepare
	eautoreconf
	epatch ${FILESDIR}/threads.patch
}

src_install() {
	php-ext-source-r2_src_install
	php-ext-source-r2_addtoinifiles "pinba.enabled" "1"
	dodoc NEWS README CREDITS
}
