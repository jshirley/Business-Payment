package Business::Payment;
use Moose;

our $VERSION = '0.01';

has processor => (
    is => 'ro',
    isa => 'Business::Payment::Processor'
);

sub handle {
    my ($self, $charge) = @_;

    return $self->processor->handle($charge);
}

__PACKAGE__->meta->make_immutable;

1;

=head1 NAME

Business::Payment - Payment Processing Library

=head1 SYNOPSIS

    use Business::Payment;

    my $bp = Business::Payment->new(
        processor => Business::Payment::Processor::Test::True->new
    );

    my $charge = Business::Payment::Charge->new(
        amount => 10.00 # Something Math::Currency can parse
    );

    my $result = $bp->handle($charge);
    if($result->success) {
        print "Success!\n";
    } else {
        print "Failed: ".$result->error_code.": ".$result->error_message."\n";
    }

=head1 DESCRIPTION

Business::Payment is a payment abstraction library, primarily meant to be used
as an abstraction in front of payment processor libraries.

=head1 AUTHOR

Cory G Watson, C<< <gphat@cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Cold Hard Code, LLC, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
