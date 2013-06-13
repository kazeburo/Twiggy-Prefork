requires 'Parallel::Prefork', '0.13';
requires 'Twiggy', '0.1020';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
    requires 'Test::More';
};
