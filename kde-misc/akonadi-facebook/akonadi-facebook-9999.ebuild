# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="Facebook plugin for akonadi which supports contacts, events, notebook (notes)."
HOMEPAGE="https://projects.kde.org/projects/playground/pim/akonadi-facebook/repository"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"

DEPEND="
	>=dev-libs/qjson-0.7
"
RDEPEND="${DEPEND}"
