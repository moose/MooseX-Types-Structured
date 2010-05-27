BEGIN {
	use strict;
	use warnings;
	use Test::More tests=>5;
}

{
    package TypeLib;
    use MooseX::Types::Structured qw(Dict Tuple);
    use MooseX::Types::Moose qw(Int Str Item);
    use MooseX::Types -declare => [qw(
        MyDict1 MyDict2  MyDict4 
    )];

    subtype MyDict1,
    as Dict[name=>Str, age=>Int];

    subtype MyDict2,
    as Dict[name=>Str, age=>Int];

     subtype MyDict4,
    as Dict[name=>Str, age=>Item];

}

use Moose::Util::TypeConstraints;
use MooseX::Types::Structured qw(Dict Tuple);
use MooseX::Types::Moose qw(Int Str Item Object ArrayRef HashRef);

BEGIN {
    TypeLib->import(':all');
}

ok ( MyDict2->is_a_type_of(MyDict4),
  'MyDict2 is_a_type_of MyDict4');

ok ( (Tuple[Tuple[ class_type('Paper'), class_type('Stone') ], Dict[]])->is_a_type_of( Tuple[Tuple[ Item, Item ], Dict[]] ),
  "tuple of tuple" );

ok ( (Tuple[Tuple[ class_type('Paper'), class_type('Stone') ], Dict[]])->is_a_type_of( Tuple[Tuple[ Item, Item ], Dict[]] ),
  "tuple of tuple" );

ok ( (Tuple[Tuple[ class_type('Paper'), class_type('Stone') ], Dict[]])->is_subtype_of( Tuple[Tuple[ Item, Item ], Dict[]] ),
  "tuple of tuple" );

ok ( MyDict1->is_subtype_of(MyDict4),
  'MyDict1 is_subtype_of MyDict4');

