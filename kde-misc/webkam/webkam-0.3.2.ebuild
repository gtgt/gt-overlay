# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DECLARATIVE_REQUIRED="optional"
USE_RUBY="ruby18"

inherit kde4-base ruby-ng

DESCRIPTION="This is simple webcam application."
HOMEPAGE="http://kde-apps.org/content/show.php?content=76902"
SRC_URI="http://webkam-kde4.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/ruby:1.8
	kde-base/kdebindings-ruby
	dev-ruby/ruby-gstreamer
	media-plugins/gst-plugins-meta[ffmpeg]
	media-plugins/gst-plugins-ximagesrc
	dev-ruby/ruby-glib2
"
RDEPEND=">=kde-base/kdelibs-4.4.0"

#S="${WORKDIR}/${PN}"

pkg_setup() {
  ruby-ng_pkg_setup
  kde4-base_pkg_setup
}

each_ruby_configure() {
  CMAKE_USE_DIR=${S}
  mycmakeargs=(
    -DRUBY_LIBRARY=$(ruby_get_libruby)
    -DRUBY_INCLUDE_PATH=$(ruby_get_hdrdir)
    -DRUBY_EXECUTABLE=${RUBY}
  )
  kde4-base_src_configure
}


each_ruby_compile() {
  CMAKE_USE_DIR=${S}
  kde4-base_src_compile
}

each_ruby_install() {
  CMAKE_USE_DIR=${S}
  kde4-base_src_install
}

