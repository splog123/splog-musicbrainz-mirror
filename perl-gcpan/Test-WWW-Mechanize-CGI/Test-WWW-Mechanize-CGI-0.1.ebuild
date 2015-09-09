# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.6

EAPI=5

MODULE_AUTHOR="MRAMBERG"
MODULE_VERSION="0.1"


inherit perl-module

DESCRIPTION="Test CGI applications with Test::WWW::Mechanize"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-WWW-Mechanize
	>=perl-gcpan/WWW-Mechanize-CGI-0.3
	dev-lang/perl"
