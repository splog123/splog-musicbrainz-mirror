# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.6

EAPI=5

MODULE_AUTHOR="MIYAGAWA"
MODULE_VERSION="0.16"


inherit perl-module

DESCRIPTION="display information about the current request/response"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/File-ShareDir-1.30.0
	dev-perl/Data-Dump
	>=dev-perl/Module-Build-Tiny-0.37.0
	>=perl-gcpan/Text-MicroTemplate-0.24
	dev-perl/Plack
	>=dev-perl/Class-Method-Modifiers-2.30.0
	dev-lang/perl"
