use inc::Module::Install;
name 'Twiggy-Prefork';
all_from 'lib/Twiggy/Prefork.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
#auto_include;
WriteAll;
