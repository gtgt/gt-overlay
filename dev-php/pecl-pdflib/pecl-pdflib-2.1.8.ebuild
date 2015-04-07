# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/pecl-pdflib/pecl-pdflib-2.1.8.ebuild,v 1.2 2011/01/30 16:39:27 armin76 Exp $

EAPI="5"

PHP_EXT_NAME="pdf"
PHP_EXT_PECL_PKG="pdflib"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-3 php5-4"

inherit php-ext-source-r2

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x64-macos"

DESCRIPTION="PHP extension for creating PDF files."
LICENSE="PHP-2.02 PHP-3"
SLOT="0"
IUSE=""

DEPEND="media-libs/pdflib"
RDEPEND="${DEPEND}"
