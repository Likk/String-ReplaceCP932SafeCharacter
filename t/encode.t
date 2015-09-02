use strict;
use warnings;
use utf8;

use Test::Base;
use Test::More;
use String::ReplaceCP932SafeCharacter qw/replace/;

run {
    my $block = shift;
    subtest 'replace' => sub {
        is(replace($block->input), $block->expected);
    };
};

done_testing();

__END__
=== test ascii
--- input
1234abcdABCD_
--- expected
1234abcdABCD_
=== normal japanese string
--- input
あいうえお
--- expected
あいうえお
=== normal han string
--- input
漢字
--- expected
漢字
=== irregular han string
--- input
パッと頰がバラ色に染まる。
--- expected
パッと頬がバラ色に染まる。
=== irregular han map
--- input
俠俱剝吞啞噓嚙囊塡姸屛屢幷搔摑攢杮沪潑瀆焰瞱簞繡繫萊蔣蟬蠟軀醬醱頰顚驒鷗鹼麴
--- expected
侠倶剥呑唖嘘噛嚢填妍屏屡并掻掴攅柿濾溌涜焔曄箪繍繋莱蒋蝉蝋躯醤醗頬顛騨鴎鹸麹
=== Lorem ipsum
--- input
メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。きょう未明メロスは村を出発し、野を越え山越え、十里はなれた此のシラクスの市にやって来た
--- expected
メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。きょう未明メロスは村を出発し、野を越え山越え、十里はなれた此のシラクスの市にやって来た

