My personal overlay for a musicbrainz mirror

This overlay requires the Gentoo official perl-experimental mirror

To add:

  # layman -a perl-experimental
  # layman -f -o https://raw.githubusercontent.com/splog123/splog-musicbrainz-mirror/master/repositories.xml -a musicbrainz-mirror
