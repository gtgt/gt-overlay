# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit kde4-base eutils subversion

HOMEPAGE="http://kde-apps.org/content/show.php/KitchenSync?content=132538"
#SRC_URI="http://kde-apps.org/CONTENT/content-files/132538-${P}.tar.gz"
ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/playground/pim/kitchensync"
DESCRIPTION="Synchronize Data with KDE"
LICENSE="GPL-3"

SLOT=4
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=app-pda/libopensync-0.40_pre06162
	$(add_kdebase_dep kontact)
"
RDEPEND="${DEPEND}"
