# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/bpmdetect/bpmdetect-0.6.1.ebuild,v 1.2 2009/06/03 19:37:07 ssuominen Exp $

EAPI=2
inherit eutils multilib subversion

DESCRIPTION="Automatic BPM detection utility"
HOMEPAGE="http://sourceforge.net/projects/bpmdetect"
ESVN_REPO_URI="https://bpmdetect.svn.sourceforge.net/svnroot/bpmdetect/trunk/bpmdetect"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug realtime"

RDEPEND="media-libs/taglib
	media-libs/id3lib
	>=media-libs/fmod-4.25.07-r1:1
	x11-libs/qt-gui:4"
DEPEND="${RDEPEND}
	sys-apps/sed
	dev-util/scons
	dev-util/pkgconfig"

S=${WORKDIR}/${PN}

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc44_and_fmodex_path.patch
	sed -i -e "s:-O2:${CXXFLAGS}:" src/SConscript || die "sed failed"
}

src_configure() { :; }

src_compile() {
	export QTDIR="/usr/$(get_libdir)"
	einfo "QTDIR: ${QTDIR}"
  #extraincludes=dir:dir...
	#scons configure mad=1 vorbis=1 flac=1 taglib=1 fmod=1 realtime=1 debug=1 extraincludes=/opt/fmodex/api/inc prefix=/usr || die "scons failed"
	FLAGS="prefix=/usr "
	if use debug; then
		einfo "Setting debug flag"
		FLAGS="${FLAGS} debug=1"
	fi
	if use realtime; then
		einfo "Setting realtime mode (experimental)"
		FLAGS="${FLAGS} realtime=1"
	fi
	scons $FLAGS || die "scons failed"
}

src_install() {
	dobin build/${PN} || die "dobin failed"
	doicon src/${PN}-icon.png
	domenu src/${PN}.desktop
	dodoc authors readme todo
}
