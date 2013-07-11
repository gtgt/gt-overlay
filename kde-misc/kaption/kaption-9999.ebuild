# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit kde4-base mercurial

DESCRIPTION="A KDE utility similar to Jing or Skitch not yet as powerful as them."
HOMEPAGE="http://kde-apps.org/content/show.php/Kaption?content=139302"
SRC_URI=""

KDE_SCM="-"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=">=kde-base/kdelibs-4.4.0"

EHG_REPO_URI="https://kaption.googlecode.com/hg/"

S="${WORKDIR}/hg"
