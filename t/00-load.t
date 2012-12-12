#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'evernotecli' ) || print "Bail out!\n";
}

diag( "Testing evernotecli $evernotecli::VERSION, Perl $], $^X" );
