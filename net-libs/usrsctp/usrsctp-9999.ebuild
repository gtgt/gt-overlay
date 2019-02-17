EAPI=5

inherit autotools eutils git-r3

DESCRIPTION="This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
HOMEPAGE="https://github.com/sctplab/usrsctp"
EGIT_REPO_URI="https://github.com/sctplab/usrsctp.git"
EGIT_BRANCH="master"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE="static"

src_prepare() {
	epatch_user

	elibtoolize
	eaclocal
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static )
}
