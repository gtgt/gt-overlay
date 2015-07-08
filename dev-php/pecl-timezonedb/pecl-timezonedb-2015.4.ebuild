# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-timezonedb/pecl-timezonedb-2012.1.ebuild,v 1.1 2012/03/01 17:04:42 olemarkus Exp $

EAPI=5

PHP_EXT_NAME="timezonedb"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
USE_PHP="php5-3 php5-4 php5-5 php5-6 php7-0"
inherit php-ext-pecl-r2

DESCRIPTION="Timezone Database to be used with PHP's date and time functions"
LICENSE="PHP-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""
