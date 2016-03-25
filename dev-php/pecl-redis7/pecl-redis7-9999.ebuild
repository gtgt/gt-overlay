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

src_configure() {
	my_conf="--enable-redis
		$(use_enable igbinary redis-igbinary)"

	php-ext-source-r2_src_configure
}
