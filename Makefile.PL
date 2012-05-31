use inc::Module::Install;
name 'Twiggy-Prefork';
all_from 'lib/Twiggy/Prefork.pm';

requires 'Twiggy' => '0.1020';
requires 'Parallel::Prefork' => '0.13';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
#auto_include;
WriteAll;
