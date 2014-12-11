# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-imagick/pecl-imagick-3.1.0_rc1.ebuild,v 1.1 2012/04/06 18:51:44 olemarkus Exp $

EAPI="4"

PHP_EXT_NAME="pdf"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="CREDITS"

MY_PV="${PV/_/}"
MY_PV="${MY_PV/rc/RC}"
#PECL_PKG_V="${PECL_PKG}-${MY_PV}"
#FILENAME="${PECL_PKG_V}.tgz"
#S="${WORKDIR}/${PECL_PKG_V}"

S="${WORKDIR}/${P}"
PHP_EXT_S=${S}

USE_PHP="php5-3 php5-4 php5-5 php5-6"

#inherit php-ext-pecl-r2 subversion
inherit php-ext-source-r2 subversion

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP wrapper for the PDFLib library."
LICENSE="PHP-3.01"
SLOT="0"
IUSE=""

DEPEND="media-libs/pdflib"
RDEPEND="${DEPEND}"

#SRC_URI="http://pecl.php.net/get/${FILENAME}"
ESVN_REPO_URI="http://svn.php.net/repository/pecl/pdf/trunk"

my_conf="--with-pdflib=/usr"

src_unpack() {
  subversion_src_unpack
  # create the default modules directory to be able
  # to use the php-ext-source-r2 eclass to install
  #ln -s ${PHP_EXT_S} "${S}/modules"
	mkdir "${S}/modules"

  for slot in $(php_get_slots); do
    cp -r "${S}" "${WORKDIR}/${slot}"
  done
}

src_prepare() {
	php-ext-source-r2_src_prepare
}

src_install() {
  php-ext-source-r2_src_install
}

