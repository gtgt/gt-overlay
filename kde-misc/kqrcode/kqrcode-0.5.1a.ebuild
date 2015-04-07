# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="This is a little program that is meant to encode/decode data to/from QR codes. Supported methods of QR code decoding are regular file loading, drag-n-drop and clipboard image data."
HOMEPAGE="http://sourceforge.net/p/kqrcode/wiki/Home/"
SRC_URI="mirror://sourceforge/${PN}/KQRCode/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
				media-gfx/zbar
"
