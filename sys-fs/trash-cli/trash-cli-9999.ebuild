# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MY_PV="${PVR/_pre/.dev-r}"
MY_PF="${PN}-${MY_PV}"
DESCRIPTION="Manipulate trash cans via the command line"
HOMEPAGE="http://pypi.python.org/pypi/trash-cli/"
EGIT_REPO_URI="git://github.com/andreafrancia/trash-cli.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/unipath"

inherit distutils git-2

#S="${WORKDIR}/${MY_PF}"

DOCS="CREDITS.txt HISTORY.txt README.txt TEST.txt TODO.txt COPYING"
