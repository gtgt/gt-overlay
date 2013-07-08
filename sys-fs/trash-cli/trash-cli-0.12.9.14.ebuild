# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MY_PV="${PVR/_pre/.dev-r}"
MY_PF="${PN}-${MY_PV}"
DESCRIPTION="Manipulate trash cans via the command line"
HOMEPAGE="http://pypi.python.org/pypi/trash-cli/"
SRC_URI="http://pypi.python.org/packages/source/t/trash-cli/${MY_PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/unipath"

inherit distutils

S="${WORKDIR}/andreafrancia-trash-cli-c9ef553"

#DOCS="AUTHORS HISTORY.txt README.txt THANKS"
