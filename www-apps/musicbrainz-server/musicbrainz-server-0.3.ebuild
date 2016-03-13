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
mb_root="/usr/share/${PN}"

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
	>=dev-perl/Algorithm-Diff-1.190.200
	>=dev-perl/Authen-Passphrase-0.7
	>=dev-perl/Cache-Memcached-1.290
	>=dev-perl/Captcha-reCAPTCHA-0.930
	>=dev-perl/Catalyst-Action-RenderView-0.160
	>=dev-perl/Catalyst-Plugin-Authentication-0.100.170
	>=dev-perl/Catalyst-Authentication-Credential-HTTP-1.13
	>=dev-perl/Catalyst-Plugin-I18N-0.100
	>=dev-perl/Catalyst-Plugin-Cache-0.100
	>=dev-perl/Catalyst-Runtime-5.900.110
	>=dev-perl/Catalyst-View-TT-0.370
	>=perl-gcpan/CGI-Expand-2.03
	dev-perl/Class-Load
	>=dev-perl/Clone-0.310
	>=dev-perl/Data-Compare-0.220
	>=dev-perl/Data-Dumper-Concise-2.20
	>=dev-perl/Data-OptList-0.107
	>=dev-perl/Data-Page-2.02
	>=perl-gcpan/Data-UUID-MT-0.006
	>=dev-perl/DateTime-TimeZone-1.420
	>=dev-perl/Date-Calc-6.300
	>=dev-perl/DateTime-Format-Pg-0.160.70
	>=dev-perl/DateTime-Format-Natural-0.98
	>=dev-perl/DateTime-Format-ISO8601-0.70
	>=dev-perl/DateTime-Format-W3CDTF-0.60
	>=dev-perl/DBIx-Connector-0.470
	>=dev-perl/DBD-Pg-2.19.0
	>=dev-perl/DBI-1.616
	>=dev-perl/Digest-HMAC-1.30
	>=virtual/perl-Digest-MD5-2.510
	>=virtual/perl-Digest-SHA-0.730
	>=dev-perl/Email-Address-1.892
	>=dev-perl/Email-MIME-1.910
	>=dev-perl/Email-Sender-1.120
	>=dev-perl/Email-Valid-0.185
	>=dev-perl/Encode-Detect-1.10
	>=dev-perl/Exception-Class-1.370
	>=virtual/perl-File-Spec-3.400
	>=perl-gcpan/GnuPG-0.18
	>=dev-perl/Hash-Merge-0.120
	>=dev-perl/HTML-FormHandler-0.400.160
	>=dev-perl/HTML-Tiny-1.50
	>=dev-perl/HTML-TreeBuilder-XPath-0.140
	>=dev-perl/HTTP-Date-6.0
	>=dev-perl/IO-All-0.440
	>=dev-perl/JSON-2.590
	>=dev-perl/JSON-XS-2.320
	>=dev-perl/List-AllUtils-0.20
	>=dev-perl/List-MoreUtils-0.330
	>=dev-perl/List-UtilsBy-0.080
	dev-perl/LWP-Protocol-https
	>=dev-perl/Log-Dispatch-2.290
	>=dev-perl/Math-Random-Secure-0.60
	>=dev-perl/Method-Signatures-Simple-1.02
	>=virtual/perl-MIME-Base64-3.130
	>=dev-perl/Module-Pluggable-3.900
	>=dev-perl/Moose-2.40.100
	>=perl-gcpan/MooseX-ABC-0.06
	>=dev-perl/MooseX-Clone-0.50
	>=dev-perl/MooseX-Getopt-0.370
	>=dev-perl/MooseX-MethodAttributes-0.250
	>=dev-perl/MooseX-Role-Parameterized-1.03.0
	>=perl-gcpan/MooseX-Runnable-0.03
	>=dev-perl/MooseX-Singleton-0.290
	>=dev-perl/MooseX-Types-0.310
	>=dev-perl/MooseX-Types-Structured-0.280
	>=dev-perl/MooseX-Types-URI-0.30
	>=dev-perl/MRO-Compat-0.110
	>=perl-gcpan/Net-Amazon-AWSSign-0.12
	>=perl-gcpan/Unicode-ICU-Collator-0.002
	>=perl-gcpan/REST-Utils-0.6
	>=dev-perl/Readonly-1.30
	>=dev-perl/Redis-1.926
	dev-perl/set-scalar
	>=perl-gcpan/Statistics-Basic-1.6601
	>=dev-perl/String-CamelCase-0.20
	>=dev-perl/String-ShellQuote-1.30
	>=perl-gcpan/String-TT-0.03
	>=dev-perl/Template-Plugin-Class-0.130
	>=dev-perl/Template-Plugin-JavaScript-0.20
	>=perl-gcpan/Template-Plugin-JSON-Escape-0.02
	>=perl-gcpan/Text-Diff3-0.10
	>=dev-perl/Text-Markdown-1.0.26
	>=dev-perl/Text-WikiFormat-0.810
	>=dev-perl/Text-Unaccent-1.80
	>=perl-gcpan/Text-Trim-1.02
	>=dev-perl/Throwable-0.102.080
	>=dev-perl/URI-1.590
	>=dev-perl/XML-Parser-Lite-0.714
	>=perl-gcpan/RSS-Parser-Lite-0.10
	>=perl-gcpan/XML-SemanticDiff-1.0000
	>=dev-perl/XML-Simple-2.180
	>=dev-perl/XML-XPath-1.130
	
	perl-gcpan/Object-InsideOut
	perl-gcpan/Math-Random-MT-Auto
"

MAKEFILE_ETAG_CACHING="
	>=perl-gcpan/Catalyst-Plugin-Cache-HTTP-0.001000
"

# Cache::Memory is part of Cache
MAKEFILE_DEFAULT_CACHING_SETUP="
	>=dev-perl/Cache-2.40
	>=dev-perl/Cache-Memcached-Fast-0.190
"

MAKEFILE_DEFAULT_SESSION_STORE_STATE_MANAGEMENT="
	>=dev-perl/Catalyst-Plugin-Session-State-Cookie-0.170
	>=dev-perl/Catalyst-Plugin-Session-Store-FastMmap-0.140
"

MAKEFILE_DEVELOPER_FEATURES="
	>=dev-perl/Catalyst-Plugin-StackTrace-0.110
	>=dev-perl/Catalyst-Devel-1.360
	>=dev-perl/Plack-1
	>=perl-gcpan/Plack-Middleware-Debug-0.14
"

MAKEFILE_PRODUCTION_SERVER="
	>=dev-perl/Digest-MD5-File-0.70
	>=dev-perl/Catalyst-Plugin-AutoRestart-0.960.0
	>=dev-perl/Catalyst-Plugin-ErrorCatcher-0.0.8.13
	>=dev-perl/Catalyst-Plugin-Session-Store-Memcached-0.50
	>=dev-perl/FCGI-0.740
	>=dev-perl/FCGI-ProcManager-0.240
"

# Locale::Messages is part of dev-perl/libintl-perl
MAKEFILE_I18N="
	dev-perl/Locale-PO
	>=dev-perl/libintl-perl-1.200
"

MAKEFILE_AUTHOR="
	dev-perl/Test-NoTabs
	dev-perl/Test-EOL
"

MAKEFILE_TEST="
	dev-perl/Coro
	perl-gcpan/HTML-HTML5-Parser
	perl-gcpan/HTML-HTML5-Sanity
	dev-perl/HTML-Selector-XPath
	perl-gcpan/LWP-UserAgent-Mockable
	dev-perl/Test-Aggregate
	dev-perl/Test-Differences
	>=dev-perl/Test-Fatal-0.6
	dev-perl/Test-JSON
	dev-perl/Test-LongString
	>=perl-gcpan/Test-Magpie-0.4
	dev-perl/Test-Memory-Cycle
	perl-gcpan/Test-Mock-Class
	perl-gcpan/Test-Routine
	>=dev-perl/Test-WWW-Mechanize-Catalyst-0.580
	perl-gcpan/Test-XPath
	dev-perl/XML-Parser
	dev-perl/TAP-Parser-SourceHandler-pgTAP
"

RDEPEND="
	>=dev-lang/perl-5.10.1
	dev-db/postgresql:9.1[server]
	net-misc/memcached
	dev-db/redis
	net-libs/nodejs[npm]

	dev-libs/libxml2
	dev-libs/expat

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
	# Create musicbrainz group
	enewgroup "${groups}"
	# Create musicbrainz user, put in musicbrainz group
	enewuser "${user}" -1 -1 -1 "${groups}"
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

	# Rotation of log files
	insinto "/etc/logrotate.d"
	insopts -m0644 -o root -g root
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	cd "${S}"
	insinto "${mb_root}"
	doins -r *

	find "${D}/${mb_root}" -path ./blib -prune -o -path ./node_modules -prune -o -type f -print | \
	while read fn; do 
		head -n1 "${fn}" | grep -q "^#\!" && echo "${fn}" && chmod +x "${fn}" 
	done
}

pkg_postinst() {
	elog "Musicbrainz-server has been installed."
	elog
	elog "A Unix user/group musicbrianz:musicbrainz has been created."
	elog
	elog "To complete the installation you must do the following:"
	elog
	elog "  1. Edit REPLICATION_TYPE in ${mb_root}/lib/DBDefs.pm"
	elog "  2. Make any other desired changes in DBDefs.pm"
	elog "  3. Install Node.js dependencies:"
	elog "     cd ${mb_root}"
	elog "     npm install"
	elog "     ./script/compile_resources.sh"
	elog "     You may need to repeat these commands until they succeed."
	elog "  4. Set PostgreSQL access permissions"
	elog "  5. Create a database and if required import data dumps"
	elog
	elog "  A full description of these steps can be found here:"
	elog "  https://github.com/metabrainz/musicbrainz-server/blob/master/INSTALL.md"
	elog
	elog "To update a slave hourly from the musicbrainz master, add this cron:"
	elog "0 * * * * ${mb_root}/admin/cron/slave.sh"
	elog
	elog "Please configure ${ROOT}etc/conf.d/${PN} before starting the server."
	elog
	elog "Start the server with ${ROOT}etc/init.d/${PN} start."
	elog "Visit http://<host ip>:5000 to access the musicbrainz mirror site."
	elog
}
