# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/qt-meta/qt-meta-4.7.ebuild,v 1.1 2011/04/06 21:01:35 wired Exp $

EAPI=2
DESCRIPTION="Silly dependency for QT. It allows to use qt above 4.7.2 with those ebuilds where devs was lazy."
HOMEPAGE="http://qt.nokia.com/"

LICENSE="|| ( LGPL-2.1 GPL-3 )"
SLOT="4"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="
	=x11-libs/qt-meta-4.7
"
pkg_postinst() {
	echo
	elog "Please note that this meta package is only provided for convenience."
	elog "No packages should depend directly on this meta package, but on the"
	elog "specific split Qt packages needed."
	echo
}
