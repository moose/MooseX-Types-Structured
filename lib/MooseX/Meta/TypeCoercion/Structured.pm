package ## Hide from PAUSE
 MooseX::Meta::TypeCoercion::Structured;
# ABSTRACT: Coerce structured type constraints.

use Moose;
extends 'Moose::Meta::TypeCoercion';

=head1 DESCRIPTION

We need to make sure we can properly coerce the structure elements inside a
structured type constraint.  However requirements for the best way to allow
this are still in flux.  For now this class is a placeholder.

=head1 SEE ALSO

The following modules or resources may be of interest.

L<Moose>, L<Moose::Meta::TypeCoercion>

=cut

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
