package Twiggy::Prefork;

use strict;
use warnings;

our $VERSION = '0.01';

1;
__END__

=head1 NAME

Twiggy::Prefork - Preforking AnyEvent HTTP server for PSGI

=head1 SYNOPSIS

  $ plackup -s Twiggy::Prefork -a app.psgi
  
=head1 DESCRIPTION

Twiggy::Prefork is Preforking AnyEvent HTTP server for PSGI based on Twiggy.

=head1 OPTIONS

=over 4

=item max_workers

=item max_reqs_per_child

=item min_reqs_per_child

=back

=head1 PSGI extentions

=over 4

=item psgix.exit_guard

=back

=head1 AUTHOR

Masahiro Nagano E<lt>kazeburo {at} gmail.comE<gt>

=head1 SEE ALSO

L<Twiggy>, L<Parallel::Prefork>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
