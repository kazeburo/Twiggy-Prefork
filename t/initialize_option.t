use strict;
use warnings;

use Test::More;
use Twiggy::Prefork::Server;

{
    local $@;
    eval {
        Twiggy::Prefork::Server->new(
            max_reqs_per_child => 100,
            count_reqs_per_child => 0, # means disable_count_reqs_per_child
        );
    };

    like $@, qr/^either disable_count_reqs_per_child or max_reqs_per_child should be enabled\./;
}

{
    local $@;
    eval {
        Twiggy::Prefork::Server->new(
            count_reqs_per_child => 1, # means not pass disable_count_reqs_per_child
        );
    };

    ok ! $@;
}

{
    local $@;
    eval {
        Twiggy::Prefork::Server->new(
            max_reqs_per_child => 100,
        );
    };

    ok ! $@;
}

done_testing;
