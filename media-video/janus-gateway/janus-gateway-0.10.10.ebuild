# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Janus is an open source, general purpose, WebRTC gateway"
HOMEPAGE="https://github.com/meetecho/janus-gateway"
SRC_URI="https://github.com/meetecho/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs +postproc rabbitmq mqtt +rest +turn +websockets +unix-sockets data-channels nanomsg"

RDEPEND="dev-libs/libconfig
    dev-libs/jansson
		net-libs/libnice
		>=dev-libs/openssl-1.0.1e
		>=net-libs/libsrtp-2
		dev-util/gengetopt
		postproc? ( media-video/ffmpeg
					media-libs/libogg )
		docs? ( app-doc/doxygen )
		rabbitmq? ( net-libs/rabbitmq-c )
    mqtt? ( net-libs/paho-mqtt-c )
		rest? ( net-libs/libmicrohttpd )
		turn? ( net-misc/curl )
		websockets? ( net-libs/libwebsockets )
    data-channels? ( net-libs/usrsctp )
    nanomsg? ( dev-libs/nanomsg )"
DEPEND="${DEPEND}
		websockets? ( dev-util/cmake )"

src_prepare() {
	eautoreconf
	elibtoolize

	default_src_prepare
}

src_configure() {
	econf --enable-libsrtp2 \
		$(use_enable docs) \
		$(use_enable postproc post-processing) \
		$(use_enable rabbitmq) \
		$(use_enable mqtt) \
		$(use_enable rest) \
		$(use_enable turn turn-rest-api) \
		$(use_enable websockets) \
		$(use_enable data-channels) \
		$(use_enable nanomsg) \
		$(use_enable unix-sockets) || die "Failed to configure"
}

src_compile() {
	gengetopt --set-package="janus" --set-version="${PN}" < janus.ggo
	emake || die "Failed to compile"
}

src_install() {
	default_src_install
	cd "${S}/conf"
	for i in *.sample; do
		cp "${i}" "${D}/etc/janus/${i/.sample}"
	done
  newinitd "${FILESDIR}/janus-gateway.initd" janus-gateway
  newconfd "${FILESDIR}/janus-gateway.confd" janus-gateway
}
