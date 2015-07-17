# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

inherit toolchain-funcs autotools eutils git-2

DESCRIPTION="Apple Filing Protocol client and library implemented in FUSE"
HOMEPAGE="http://code.belo.io/bnbd/"
EGIT_REPO_URI="https://bitbucket.org/belczyk/bnbd.git"

LICENSE="LGPL-2"
SLOT="0"
IUSE="debug zlib"

RDEPEND=">=dev-libs/glib-2.0
        zlib? ( sys-libs/zlib )"
        DEPEND="${RDEPEND}
                virtual/pkgconfig"
