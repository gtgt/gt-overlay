# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils qt4-r2 cmake-utils subversion

DESCRIPTION="A graphical user interface for QEMU written in Qt4"
HOMEPAGE="http://qtemu.sourceforge.net/"
ESVN_REPO_URI="http://qtemu.svn.sourceforge.net/svnroot/qtemu/trunk/qtemu"

LICENSE="GPL-2 LGPL-2.1 CCPL-Attribution-3.0"
SLOT="0"
KEYWORDS=""
IUSE="kvm"

DEPEND="net-libs/libvncserver
	dev-qt/qtgui:4
	dev-qt/qtwebkit:4"
RDEPEND="${DEPEND}
	!kvm? ( app-emulation/qemu )
	kvm? ( app-emulation/qemu-kvm )"

DOCS=(CHANGELOG README TODO)
