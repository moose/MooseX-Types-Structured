use strict;
use warnings;

use Test::More tests=>3;

## List all the modules we want to make sure can at least compile

use_ok 'MooseX::Meta::TypeConstraint::Structured::Named';
use_ok 'MooseX::Meta::TypeConstraint::Structured::Positional';
use_ok 'MooseX::Types::Structured';