#!/usr/bin/perl
use strict;

# Determine mode from user input
my $input_mode;
if ( scalar @ARGV == 2 && $ARGV[0] eq "-i" ) {
    $input_mode = 1;
} elsif(scalar @ARGV == 2 && $ARGV[0] eq "-o" ) {
    $input_mode = 0;
} else {
    print "Use -i when you're trying to input silly animals, use -o when you're filtering output\n";
    exit -1;
}

# Determine the os
my $os = $^O;

# Get the file
my $file;
if ( $os eq "linux" || $os eq "darwin" ) {
    # We're running in linux or OS X
    $file = "/tmp/silly-animals.dat";
    system ("touch $file");
} else {
    # I don't know how to deal with this...
    print "Bad news: silly-animals doesn't support the $os operating system!\n";
    print "Good news: silly-animals is FOSS under the MIT license and you can help fix this problem!\n";
    exit 1;
}

# Load the file
open my $handle, '<', $file;
chomp(my @lines = <$handle>);
close $handle;

# If we're running in input_mode, map animals to gross-strings.
if ( $input_mode ) {
    my %niceToGross = map {
	split(/\s/, $_, 2);
    } @lines;
    my $nice = $ARGV[1];
    my $gross = $niceToGross{$nice};
    if(!$gross){
	my @partials = grep { index $_, $nice } keys %niceToGross;
	if ( scalar @partials == 1 ) {
	    print $niceToGross{@partials[0]};
	    exit 0;
	}
	else {
	    print "Unable to resolve input";
	    exit 2;
	}
    }
    else {
	print $gross;
	exit 0;
    }
}
# Otherwise, we're running in output_mode. Map gross-strings to animals (and add new mappings as required)
