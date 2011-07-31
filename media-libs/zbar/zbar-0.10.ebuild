# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils flag-o-matic autotools libtool

DESCRIPTION="ZBar is an open source software suite for reading bar codes from various sources, such as video streams, image files and raw intensity sensors. It supports many popular symbologies (types of bar codes) including EAN-13/UPC-A, UPC-E, EAN-8, Code 128, Code 39, Interleaved 2 of 5 and QR Code."
HOMEPAGE="http://gstreamer.freedesktop.org/wiki/QtGStreamer"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X +jpeg imagemagick python threads gtk qt4 v4l"

RDEPEND="
	x11-libs/gtk+
	x11-libs/pango
	dev-libs/atk
	sys-devel/automake
	sys-devel/autoconf
"
DEPEND="
	${RDEPEND}
"
src_prepare() {
  eautoreconf
  epunt_cxx
}

src_configure() {
  econf \
    --disable-dependency-tracking \
    $(use_with X x) \
    $(use_enable v4l video) \
    $(use_with jpeg) \
    $(use_with imagemagick) \
    $(use_with python) \
    $(use_enable threads pthreads) \
    $(use_with gtk) \
    $(use_with qt4 qt)
}

src_install() {
  emake DESTDIR="${D}" install || die
  dodoc HACKING ChangeLog NEWS README TODO
  #dohtml docs/*.html
  #insinto /usr/share/doc/${PN}/pdf
  #doins docs/doc.pdf
  find "${D}" -name '*.la' -exec rm -f '{}' +
}

