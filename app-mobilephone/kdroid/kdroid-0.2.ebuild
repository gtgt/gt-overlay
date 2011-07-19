# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit kde4-base

DESCRIPTION="KDroid allows you to view text messages from your Android phone. It is also possible to send messages, however it only sends them to the phone where you have to hit send to actually send them."
HOMEPAGE="http://kde-apps.org/content/show.php/KDroid?content=141506"
SRC_URI="http://kde-apps.org/CONTENT/content-files/141506-${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=kde-base/kdelibs-4.4.0
		dev-util/android-sdk-update-manager"

S="${WORKDIR}/${P}"
