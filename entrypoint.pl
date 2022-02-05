#!/usr/bin/env perl

use strict;
use warnings;
use CPAN::Uploader;

my $filename = shift or usage();
my $user     = shift or usage();
my $password = shift or usage();
my $dry_run  = shift;

die "File $filename does not exist\n" unless -f $filename;

CPAN::Uploader->upload_file(
    $filename,
    {
        user     => uc($user),
        password => $password,
        dry_run => $dry_run,
    }
);

sub usage {
    die <<"USAGE";
Usage:

    cmd FILENAME USERNAME PASSWORD DRY_RUN

DRY_RUN is optional and if given should be anything except "0" to active it.
USAGE
}
