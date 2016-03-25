# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PHP_EXT_NAME="redis"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php7-0"

DOCS="arrays.markdown README.markdown"

inherit php-ext-source-r2 git-r3

KEYWORDS="amd64"

DESCRIPTION="PHP 7.0 compatible extension for interfacing with Redis"
LICENSE="PHP-3.01"
SLOT="0"
IUSE="igbinary"

EGIT_REPO_URI="https://github.com/phpredis/phpredis.git"

DEPEND="igbinary? (
	php_targets_php7-0? ( dev-php/igbinary7[php_targets_php7-0] )
	)"
RDEPEND="${DEPEND}"

src_unpack() {
  export S="${WORKDIR}/${P}"
  git-r3_src_unpack

  for slot in $(php_get_slots); do
    cp -r "${S}" "${WORKDIR}/${slot}"
  done
}

src_prepare() {
  local slot orig_s="${S}"
  for slot in $(php_get_slots); do
    export S="${WORKDIR}/${slot}"
    echo "SLOT: ${slot}; S:${S}"
    cd "${S}"
    base_src_prepare
  done
  export S="${orig_s}"
  cd "${S}"
  php-ext-source-r2_src_prepare
}

src_configure() {
	my_conf="--enable-redis
		$(use_enable igbinary redis-igbinary)"

	php-ext-source-r2_src_configure
}


