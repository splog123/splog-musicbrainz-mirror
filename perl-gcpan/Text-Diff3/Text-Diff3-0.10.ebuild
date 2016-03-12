# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="TOCIYUKI"
MODULE_VERSION="0.10"


inherit perl-module

DESCRIPTION="Three way text comparison and merging"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/perl
	dev-perl/Module-Build
"
