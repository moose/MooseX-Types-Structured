package MooseX::Types::Structured::MessageStack;
use Moose;

has 'level' => (
    traits => ['Counter'],
    is => 'ro',
    isa => 'Num',
    required => 0,
    default => 0,
    handles => {
        inc_level => 'inc',
        dec_level => 'dec',
    },
);

# :level, :message, :tc
has 'messages' => (
    traits => ['Array'],
    is => 'ro',
    isa => 'ArrayRef[HashRef]',
    required => 1,
    default => sub { [] },
    handles => {
        has_messages => 'count',
        add_message => 'push',
        all_messages => 'elements',
    },
);

sub _clean_message {
    my $message = shift @_;
    $message =~s/MooseX::Types::Structured:://g;
    return $message;
}

sub as_string {
    my @messages = (shift)->all_messages;
    my $message = join("", map { "\n". (" " x $_->{level}) ."[+] " . _clean_message($_->{message}) } reverse @messages);
    return $message;
}


no Moose;
__PACKAGE__->meta->make_immutable;

1;
