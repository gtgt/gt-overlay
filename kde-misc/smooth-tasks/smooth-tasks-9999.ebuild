# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/smooth-tasks/smooth-tasks-20101106.ebuild,v 1.4 2011/10/29 00:07:54 abcd Exp $

EAPI="4"

KDE_LINGUAS="cs de fr hu pl ru zh_CN"
KDE_MINIMAL="4.5"
inherit kde4-base mercurial

DESCRIPTION="Alternate taskbar KDE plasmoid, similar to Windows 7"
HOMEPAGE="http://www.kde-look.org/content/show.php/Smooth+Tasks?content=101586"

EHG_REPO_URI="https://bitbucket.org/panzi/smooth-tasks"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libtaskmanager)
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep plasma-workspace)
"

#S="${WORKDIR}/${PN}-src-wip-${MY_PV}"
