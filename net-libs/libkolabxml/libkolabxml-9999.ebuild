# Copyright 2014 Awesome Information Technology
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

PHP_EXT_NAME="kolabformat"
USE_PHP="php5-6 php7-0 php7-1 php7-2 php7-3 php7-4"

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit cmake-utils multilib git-r3 python-r1 php-ext-source-r2 eutils

EGIT_REPO_URI="https://git.kolab.org/diffusion/LKX/libkolabxml.git"
[[ ${PV} == "9999" ]] || EGIT_COMMIT="${P}"

DESCRIPTION="Kolab XML format schema definitions library"
HOMEPAGE="http://www.kolab.org"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"

SLOT="0"

LICENSE="Apache-2.0 ZLIB LGPL-3+ public-domain"
IUSE="csharp java +python +php test"

RDEPEND="
	>=dev-libs/boost-1.42.0
	dev-libs/xerces-c
	net-misc/curl"

DEPEND="${RDEPEND}
	dev-cpp/xsd
	csharp? ( >=dev-lang/swig-2.0.7 dev-lang/mono )
	java? ( >=dev-lang/swig-2.0.7 virtual/jre )
	php? ( >=dev-lang/swig-2.0.7 dev-lang/php )
	python? ( >=dev-lang/swig-2.0.7 dev-lang/python )
	test? ( dev-qt/qttest:4 )
"

# Dependency on any version of Python.
PYTHON_DEPEND="*"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	cmake-utils_src_prepare

    # Apply patches
    for kolab_patch in $(ls ${FILESDIR}/${P}-*.patch) ; do
		epatch "${kolab_patch}"
	done

	if use php ; then
		S_=${S}
		for slot in $(php_get_slots); do
			S=${WORKDIR}/${slot}
			mkdir ${S}
			cmake-utils_src_prepare
			S=${S_}
		done
	fi
}

src_configure() {
	mycmakeargs=(
		-DLIB_INSTALL_DIR=$(get_libdir)
		$(cmake-utils_use csharp CSHARP_BINDINGS)
		$(cmake-utils_use java JAVA_BINDINGS)
		$(cmake-utils_use python PYTHON_BINDINGS)
		$(cmake-utils_use_build test TESTS)
	)

	use java && mycmakeargs+=(-DJAVA_INSTALL_DIR="$(get_libdir)/kolabxml/java")
	use python && mycmakeargs+=(-DPYTHON_INSTALL_DIR=$(python_get_libdir))

	cmake-utils_src_configure

	if use php ; then
		BUILD_DIR_=${BUILD_DIR}
		for slot in $(php_get_slots); do
			BUILD_DIR="${WORKDIR}/${slot}"
			mkdir $BUILD_DIR

			mycmakeargs=(
				$(cmake-utils_use php PHP_BINDINGS)
				-DPHP_INCLUDE_DIR="/usr/$(get_libdir)/${slot}/include/php"
				-DCMAKE_SKIP_RPATH="TRUE"
			)

			cmake-utils_src_configure

			BUILD_DIR=${BUILD_DIR_}
		done
	fi
}

src_compile() {
	cmake-utils_src_compile

	if use php ; then
		BUILD_DIR_=${BUILD_DIR}
		for slot in $(php_get_slots); do
			BUILD_DIR="${WORKDIR}/${slot}"

			cmake-utils_src_compile

			BUILD_DIR=${BUILD_DIR_}
		done
	fi
}

src_install() {
	cmake-utils_src_install

	if use php ; then
		BUILD_DIR_=${BUILD_DIR}
	    for slot in $(php_get_slots); do
			BUILD_DIR="${WORKDIR}/${slot}"
	        php_init_slot_env ${slot}
	        insinto "${EXT_DIR}"
	        newins "src/php/${PHP_EXT_NAME}.so" "${PHP_EXT_NAME}.so"
	    done

	    insinto "/usr/share/php"
	    doins "src/php/${PHP_EXT_NAME}.php"

		BUILD_DIR=${BUILD_DIR_}
	    php-ext-source-r2_createinifiles
	fi
}
