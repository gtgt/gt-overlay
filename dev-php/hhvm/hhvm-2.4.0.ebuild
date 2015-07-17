# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit eutils git-2

EGIT_REPO_URI="git://github.com/facebook/hhvm.git"
EGIT_COMMIT="HHVM-${PV}"

IUSE="+jemalloc devel debug"

CURL_P="curl-7.31.0"
LIBEVENT_P="libevent-1.4.14b-stable"

SRC_URI="http://curl.haxx.se/download/${CURL_P}.tar.bz2
         https://github.com/downloads/libevent/libevent/${LIBEVENT_P}.tar.gz"

DESCRIPTION="Virtual Machine, Runtime, and JIT for PHP"
HOMEPAGE="https://github.com/facebook/hhvm"

RDEPEND="
	>=dev-libs/boost-1.48
	sys-devel/flex
	sys-devel/bison
	dev-util/re2c
	virtual/mysql
	dev-libs/libxml2
	dev-libs/libmcrypt
	dev-libs/icu
	dev-libs/openssl
	sys-libs/libcap
	media-libs/gd
	sys-libs/zlib
	dev-cpp/tbb
	dev-libs/oniguruma
	dev-libs/libpcre
	dev-libs/expat
	sys-libs/readline
	sys-libs/ncurses
	dev-libs/libmemcached
	net-nds/openldap
	net-libs/c-client[kerberos]
	dev-util/google-perftools
	dev-libs/cloog
	dev-libs/elfutils
	dev-libs/libdwarf
	app-arch/bzip2
	sys-devel/binutils
	>=sys-devel/gcc-4.7
	dev-cpp/glog
	jemalloc? ( >=dev-libs/jemalloc-3.0.0[stats] )
	media-libs/libvpx
"

DEPEND="
	${RDEPEND}
	>=dev-util/cmake-2.8.7
"

SLOT="0"
LICENSE="PHP-3"
KEYWORDS="amd64"

src_prepare()
{
	git submodule init
	git submodule update

	epatch "${FILESDIR}/support-curl-7.31.0.patch"

	export CMAKE_PREFIX_PATH="${D}/usr/lib/hhvm"

	einfo "Building custom libevent"
	export EPATCH_SOURCE="${S}/hphp/third_party"
	EPATCH_OPTS="-d ""${WORKDIR}/${LIBEVENT_P}" epatch libevent-1.4.14.fb-changes.diff
	pushd "${WORKDIR}/${LIBEVENT_P}" > /dev/null
	./autogen.sh
	./configure --prefix="${CMAKE_PREFIX_PATH}"
	emake
	emake -j1 install
	popd > /dev/null

	einfo "Building custom curl"
	EPATCH_OPTS="-d ""${WORKDIR}/${CURL_P} -p1" epatch libcurl.fb-changes.diff
	pushd "${WORKDIR}/${CURL_P}" > /dev/null
	./buildconf
	./configure --prefix="${CMAKE_PREFIX_PATH}"
	emake
	emake -j1 install
	popd > /dev/null

	CMAKE_BUILD_TYPE="Release"
	if use debug; then
		CMAKE_BUILD_TYPE="Debug"
	fi
	export CMAKE_BUILD_TYPE
}

src_configure()
{
	export HPHP_HOME="${S}"
	econf -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE"
}

src_install()
{
	pushd "${WORKDIR}/${LIBEVENT_P}" > /dev/null
	emake -j1 install
	popd > /dev/null

	pushd "${WORKDIR}/${CURL_P}" > /dev/null
	emake -j1 install
	popd > /dev/null

	rm -rf "${D}/usr/lib/hhvm/"{bin,include,share}
	rm -rf "${D}/usr/lib/hhvm/lib/pkgconfig"
	rm -f "${D}/usr/lib/hhvm/lib/"*.{a,la}

	exeinto "/usr/lib/hhvm/bin"
	doexe hphp/hhvm/hhvm

	if use devel; then
		cp -a "${S}/hphp/test" "${D}/usr/lib/hhvm/"
	fi

	dobin "${FILESDIR}/hhvm"
	newinitd "${FILESDIR}"/hhvm.rc hhvm
	dodir "/etc/hhvm"
	insinto /etc/hhvm
	newins "${FILESDIR}"/config.hdf.dist config.hdf.dist
}
