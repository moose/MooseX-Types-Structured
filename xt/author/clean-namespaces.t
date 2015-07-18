use strict;
use warnings;

use Test::More 0.94;
use Test::CleanNamespaces 0.15;

use Test::Requires { 'MooseX::Types' => '0.44' };

subtest all_namespaces_clean => sub { all_namespaces_clean() };

done_testing;
