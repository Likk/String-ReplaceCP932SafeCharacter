use inc::Module::Install;
name 'String-ReplaceCP932SafeCharacter';
all_from 'lib/String/ReplaceCP932SafeCharacter.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
