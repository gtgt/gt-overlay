# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base git

DESCRIPTION="KMobiletools"
HOMEPAGE="http://kde-apps.org/content/show.php/Kaption?content=139302"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+gammu"

DEPEND="
gammu? (
	app-mobilephone/gammu
)
"
RDEPEND=">=kde-base/kdelibs-4.4.0"

EGIT_REPO_URI="git://gitorious.org/kmobiletools/kmobiletools.git"

S="${WORKDIR}/${PN}"
