#!/usr/bin/perl

use strict;

my $koyuumeishi = "\x8c\xc5\x97\x4c\x96\xbc\x8e\x8c";
my $jinmei = "\x90\x6c\x96\xbc";
my $mei = "\x96\xbc";
my $sei = "\x90\xa9";

while (<>) {
	chomp;
	s/\r//;

	if (/^\!/) {
		print "$_\r\n";
		next;
	}

	@_ = split(/\t/);
	if (scalar(@_) == 0) {
		print "\r\n";
		next;
	}
	if (scalar(@_) != 3) {
		print scalar(@_)."\n";
		die;
	}

	if ($_[2] eq $jinmei ||
	    $_[2] eq $mei ||
	    $_[2] eq $sei) {
		$_[2] = $koyuumeishi;
	} else {
		print STDERR "keep type: $_\n";
	}
	print join("\t", @_)."\r\n";
}
