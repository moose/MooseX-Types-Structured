use strict;
use warnings;
use Test::More;

BEGIN {
    package MyTypes;
    use MooseX::Types::Structured qw(Dict Tuple Optional);
    use MooseX::Types::Moose qw(Object Any);
    use MooseX::Types -declare => [qw(
        Signature
        MyDict
    )];

    subtype Signature, as Tuple[Tuple[Object], Dict[optional => Optional[Any], required => Any]];

    subtype MyDict, as Dict[optional => Optional[Any], required => Any];
}

BEGIN {
    MyTypes->import(':all');
}

ok(!Signature->check([ [bless {}, 'Foo'], {} ]));

ok(!MyDict->check({ }));
ok(!MyDict->check({ optional => 42 }));
ok(!MyDict->check({ optional => 42, unknown => 23 }));
ok(!MyDict->check({ required => 42, unknown => 23 }));

ok(MyDict->check({ optional => 42, required => 23 }));
ok(MyDict->check({ required => 23 }));

done_testing;
