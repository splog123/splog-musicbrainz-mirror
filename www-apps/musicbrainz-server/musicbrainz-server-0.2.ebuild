EAPI=5

EGIT_REPO_URI="git://github.com/metabrainz/musicbrainz-server.git"

inherit user git-r3

DESCRIPTION="Meta package to install a MusicBrainz mirror server"
HOMEPAGE="https://github.com/metabrainz/musicbrainz-server"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

user="musicbrainz"
groups="musicbrainz"

# This list of perl deps comes from the project Makefile.PL
# https://github.com/metabrainz/musicbrainz-server/blob/master/Makefile.PL
# As a way to double check, run in ${S}:
#   emerge dev-perl/App-cpanminus dev-perl/local-lib
#   PERL_MB_OPT="--install_base \"${S}/perl5\"" \
#   PERL_MM_OPT="INSTALL_BASE=${S}/perl5" \
#   cpanm --installdeps --notest .

# Catalyst::Plugin::Unicode::Encoding is part of Catalyst::Runtime
# Class::MOP is part of Moose
# Cwd is part of perl core
# Digest::HMAC_SHA1 is part of Digest::HMAC
# Email::MIME::Creator is part of Email::MIME
# Sys::Hostname is part of perl-core
# XML::RSS::Parser::Lite is part of RSS::Parser::Lite
MAKEFILE_MANDATORY="
	dev-perl/Algorithm-Diff
	dev-perl/Algorithm-Merge
	dev-perl/Authen-Passphrase
	dev-perl/Cache-Memcached
	dev-perl/Captcha-reCAPTCHA
	dev-perl/Catalyst-Action-RenderView
	dev-perl/Catalyst-Plugin-Authentication
	dev-perl/Catalyst-Authentication-Credential-HTTP
	dev-perl/Catalyst-Plugin-I18N
	dev-perl/Catalyst-Plugin-Cache

	dev-perl/Catalyst-Runtime
	dev-perl/Catalyst-View-TT
	perl-gcpan/CGI-Expand

	dev-perl/Class-Load
	dev-perl/Clone

	dev-perl/Data-Compare
	dev-perl/Data-Dumper-Concise
	dev-perl/Data-OptList
	dev-perl/Data-Page
	dev-perl/Date-Calc
	perl-gcpan/Data-UUID-MT
	dev-perl/DateTime-TimeZone
	dev-perl/DateTime-Format-Pg
	dev-perl/DateTime-Format-Natural
	dev-perl/DateTime-Format-ISO8601
	dev-perl/DBIx-Connector
	dev-perl/DBD-Pg
	dev-perl/DBI

	dev-perl/Digest-HMAC
	virtual/perl-Digest-MD5
	virtual/perl-Digest-SHA
	dev-perl/Email-Address
	dev-perl/Email-MIME

	dev-perl/Email-Sender
	dev-perl/Email-Valid
	dev-perl/Encode-Detect
	dev-perl/Exception-Class
	virtual/perl-File-Spec
	perl-gcpan/GnuPG
	dev-perl/Hash-Merge
	dev-perl/HTML-FormHandler
	dev-perl/HTML-Tiny
	dev-perl/HTML-TreeBuilder-XPath
	dev-perl/HTTP-Date
	dev-perl/IO-All
	dev-perl/JSON
	dev-perl/JSON-XS
	dev-perl/List-AllUtils
	dev-perl/List-MoreUtils
	dev-perl/List-UtilsBy
	dev-perl/LWP-Protocol-https
	dev-perl/Log-Dispatch
	dev-perl/Math-Random-Secure
	dev-perl/Method-Signatures-Simple
	virtual/perl-MIME-Base64
	dev-perl/Module-Pluggable
	dev-perl/Moose
	perl-gcpan/MooseX-ABC
	dev-perl/MooseX-Clone
	dev-perl/MooseX-Getopt
	dev-perl/MooseX-MethodAttributes
	>=dev-perl/MooseX-Role-Parameterized-1.03.0
	perl-gcpan/MooseX-Runnable
	dev-perl/MooseX-Singleton
	dev-perl/MooseX-Types
	dev-perl/MooseX-Types-Structured
	dev-perl/MooseX-Types-URI
	dev-perl/MRO-Compat
	perl-gcpan/Net-Amazon-AWSSign
	perl-gcpan/Unicode-ICU-Collator
	perl-gcpan/REST-Utils
	dev-perl/Readonly
	dev-perl/Redis
	dev-perl/set-scalar
	perl-gcpan/Statistics-Basic
	dev-perl/String-CamelCase
	dev-perl/String-ShellQuote
	perl-gcpan/String-TT

	dev-perl/Template-Plugin-Class
	dev-perl/Template-Plugin-JavaScript
	perl-gcpan/Template-Plugin-JSON-Escape
	dev-perl/Text-Markdown
	>=dev-perl/Text-WikiFormat-0.810.0
	dev-perl/Text-Unaccent
	perl-gcpan/Text-Trim
	dev-perl/Throwable
	dev-perl/URI
	dev-perl/XML-Parser-Lite

	perl-gcpan/RSS-Parser-Lite
	perl-gcpan/XML-SemanticDiff
	dev-perl/XML-Simple
	dev-perl/XML-XPath
"

MAKEFILE_ETAG_CACHING="
	perl-gcpan/Catalyst-Plugin-Cache-HTTP
"

# Cache::Memory is part of Cache
MAKEFILE_DEFAULT_CACHING_SETUP="

	dev-perl/Cache

	dev-perl/Cache-Memcached-Fast
"

MAKEFILE_DEFAULT_SESSION_STORE_STATE_MANAGEMENT="
	dev-perl/Catalyst-Plugin-Session-State-Cookie
	dev-perl/Catalyst-Plugin-Session-Store-FastMmap
"

MAKEFILE_DEVELOPER_FEATURES="
	dev-perl/Catalyst-Plugin-StackTrace
	dev-perl/Catalyst-Devel
	dev-perl/Plack
	perl-gcpan/Plack-Middleware-Debug
"

MAKEFILE_PRODUCTION_SERVER="
	dev-perl/Digest-MD5-File
	>=dev-perl/Catalyst-Plugin-AutoRestart-0.960.0
	dev-perl/Catalyst-Plugin-ErrorCatcher
	dev-perl/Catalyst-Plugin-Session-Store-Memcached
	dev-perl/FCGI
	dev-perl/FCGI-ProcManager
"

# Locale::Messages is part of dev-perl/libintl-perl
MAKEFILE_I18N="
	dev-perl/Locale-PO
"

# There is no ebuild for Test::NoTabs
MAKEFILE_AUTHOR="
	dev-perl/Test-EOL
"

MAKEFILE_TEST="
	dev-perl/Env-Path
	perl-gcpan/HTML-HTML5-Parser
	perl-gcpan/HTML-HTML5-Sanity
	dev-perl/HTML-Selector-XPath
	perl-gcpan/LWP-UserAgent-Mockable
	dev-perl/Test-Aggregate
	dev-perl/Test-Differences
	dev-perl/Test-Fatal
	dev-perl/Test-JSON
	dev-perl/Test-LongString
	perl-gcpan/Test-Magpie
	dev-perl/Test-Memory-Cycle
	perl-gcpan/Test-Mock-Class
	perl-gcpan/Test-Routine
	dev-perl/Test-WWW-Mechanize-Catalyst
	perl-gcpan/Test-XPath
	dev-perl/XML-Parser
	dev-perl/TAP-Parser-SourceHandler-pgTAP
"

RDEPEND="
	>=dev-lang/perl-5.10.1
	dev-db/postgresql:9.1[server]
	net-misc/memcached
	dev-db/redis
	net-libs/nodejs[npm,icu]

	dev-libs/libxml2
	dev-libs/expat
	dev-libs/icu

	${MAKEFILE_MANDATORY}
	${MAKEFILE_ETAG_CACHING}
	${MAKEFILE_DEFAULT_CACHING_SETUP}
	${MAKEFILE_DEFAULT_SESSION_STORE_STATE_MANAGEMENT}
	${MAKEFILE_PRODUCTION_SERVER}
	${MAKEFILE_DEVELOPER_FEATURES}
	${MAKEFILE_I18N}
	${MAKEFILE_AUTHOR}
	${MAKEFILE_TEST}
"

DEPEND="${RDEPEND}"

pkg_setup() {
	# Move this later, somewhere near postinst
	# Create musicbrainz group
	enewgroup "${groups}"
	# Create musicbrainz user, put in musicbrainz group
	enewuser "${user}" -1 -1 -1 "${groups}"
}

src_prepare() {
	# Install Node.js dependencies
	# Circa 20150910 "npm install" with default shrinkwrap method started
	# failing - all packages would install, but npm would not exit and hang
	npm install --no-shrinkwrap || die

	# MusicBrainz JavaScript/CSS build system
	./node_modules/.bin/gulp || die
}

src_compile() {
	cd "${S}/postgresql-musicbrainz-unaccent"
	make || die
	cd "${S}/postgresql-musicbrainz-collate"
	make || die
}

src_install() {
	cd "${S}/postgresql-musicbrainz-unaccent"
	make DESTDIR="${D}" install || die
	cd "${S}/postgresql-musicbrainz-collate"
	make DESTDIR="${D}" install || die

	newconfd "${FILESDIR}/${PN}.conf" ${PN}
	newinitd "${FILESDIR}/${PN}.init" ${PN}

	# Location of log and data files
	keepdir "/var/${PN}"
	fowners -R "${user}:${groups}" "/var/${PN}"

	# Rotation of log files
	insinto "/etc/logrotate.d"
	insopts -m0644 -o root -g root
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	cd "${S}"
	insinto "/usr/share/${PN}"
	doins -r *
}

pkg_postinst() {
	elog "Musicbrainz-server has been installed."
	elog
	elog "A Unix user/group musicbrianz:musicbrainz has been created."
	elog
	elog "To complete the installation you must do the following:"
	elog
	elog "  1. Edit REPLICATION_TYPE in /usr/share/musicbrainz-server/lib/DBDefs.pm"
	elog "  2. Make any other desired changes in DBDefs.pm"
	elog "  3. Set PostgreSQL access permissions"
	elog "  4. Create a database and if required import data dumps"
	elog
	elog "  A full description of these steps can be found here:"
	elog "  https://github.com/metabrainz/musicbrainz-server/blob/master/INSTALL.md"
	elog
	elog "To update a slave hourly from the musicbrainz master, add this cron:"
	elog "0 * * * * /usr/share/musicbrainz-server/admin/cron/slave.sh"
	elog
	elog "Please configure ${ROOT}etc/conf.d/${PN} before starting the server."
	elog
	elog "Start the server with ${ROOT}etc/init.d/${PN} start."
	elog "Visit http://<host ip>:5000 to access the musicbrainz mirror site."
	elog
}
