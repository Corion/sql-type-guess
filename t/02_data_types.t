#!perl -w
use strict;
use Test::More tests => 6;

use SQL::Type::Guess;

my $g= SQL::Type::Guess->new();

is $g->guess_data_type(undef, 1,2,3,1000,10), 'decimal(4,0)', 'Just whole numbers';
is $g->guess_data_type(undef, 1,2,3,1000,-10), 'decimal(4,0)', 'Just whole numbers, with negative';
is $g->guess_data_type(undef, 1,2,3,'x',-10), 'varchar(3)', 'A varchar';

for my $type ('decimal(1,0)','varchar(3)', '') {
    is $g->guess_data_type($type, ''), $type, "Empty string as value does not change the type ('$type')";
};
