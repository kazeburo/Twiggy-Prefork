use strict;
use warnings;
use Test::More;
use Net::EmptyPort qw(empty_port);
use Plack::Loader;
use Test::SharedFork;
use Capture::Tiny qw(capture_stderr);

$ENV{TWIGGY_DEBUG} = 1;

my $max_workers = 2;

my $pid = fork;
!defined $pid
  and die "fork failed:$!";
if ($pid == 0) {
    my $stderr = capture_stderr {
        Plack::Loader->load(
            'Twiggy::Prefork',
            host => '127.0.0.1',
            port => empty_port(),
            max_workers => $max_workers,
        )->run(sub {});
    };
    my @lines = split /\n/, $stderr;
    my @start_lines = grep { $_ =~ /^\[\d+\] start child/ } @lines;
    my @end_lines = grep { $_ =~ /^\[\d+\] end child/ } @lines;
    ok @start_lines == $max_workers * 2, 'start child';
    ok @end_lines == $max_workers * 2, 'end child';
    exit 0;
}
# ping to child process
my $kid;
do {
    $kid = kill 0, $pid;
} while !$kid;
sleep 3;
# send signal to child process
kill HUP => $pid;
sleep 3;
kill TERM => $pid;
waitpid($pid, 0);

done_testing;
