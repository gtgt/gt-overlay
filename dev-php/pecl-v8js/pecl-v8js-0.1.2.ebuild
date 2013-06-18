# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: gt-overlay/dev-v8js/pecl-http/pecl-v8js-0.1.2.ebuild,v 1.0 2011/09/14 13:19:30 gt Exp $

EAPI="4"

PHP_EXT_NAME="v8js"
PHP_EXT_PECL_PKG="pecl_v8js"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
#PHP_EXT_S=""
DOCS="CREDITS"

inherit php-ext-pecl-r2 php-ext-source-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="This extension embeds the Google's V8 Javascript Engine into PHP."
LICENSE="PHP"
SLOT="0"
IUSE=""

SRC_URI="http://pecl.php.net/get/v8js"

DEPEND=">=dev-lang/php-5.3.3
"
RDEPEND="${DEPEND}"

my_conf=""

src_install() {
	php-ext-pecl-r2_src_install

	php-ext-source-r2_addtoinifiles "v8js.max_disposed_contexts" "25"
	php-ext-source-r2_addtoinifiles "v8js.flags" ""
}
