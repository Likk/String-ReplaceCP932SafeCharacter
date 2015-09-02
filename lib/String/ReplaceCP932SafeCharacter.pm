package String::ReplaceCP932SafeCharacter;

=encoding utf8

=head1 name

String::ReplaceCP932SafeCharacter

=head1 SYNOPSIS

  use String::ReplaceCP932SafeCharacter wq/replace/;
  my  $word =     "頰塡剝";
  $word     = replace($word)
  print $word;    #頬填剥

=head1 DESCRIPTION

表外漢字字体表(印刷標準字体含む) の文字の中にはUTF8には存在するが、cp932には該当する文字が存在しないケースが有る。
そのまま Encode::encode('cp932', $_); するとcp932に変換できず ? が表示されてしまう。
このモジュールで、代替漢字である別の文字にあらかじめ置換をすることで、その後cp932に変換しても問題ないようにする

このモジュールはサロゲートペアを含むUTF8文字が含まれているので 4byte Unicode が表示でききる端末で開いて下さい(teraterm だと化けます)

=cut

use strict;
use warnings;
use utf8;
use Encode;
use Exporter::Lite;

our $VERSION   = '0.01';
our @EXPORT_OK = qw/replace/;

=head1 PACKAGE GLOBAL VARIABLE

=over

=item B<cp932_not_exist_characters>

cp932に存在しない文字

=item B<cp932_safe_characters>

cp932に存在する代替文字

=back

=cut

our $cp932_not_exist_characters = "俠俱剝吞啞噓嚙囊塡姸屛屢幷搔摑攢杮沪潑瀆焰瞱簞繡繫萊蔣蟬蠟軀醬醱頰顚驒鷗鹼麴";
our $cp932_safe_characters      = "侠倶剥呑唖嘘噛嚢填妍屏屡并掻掴攅柿濾溌涜焔曄箪繍繋莱蒋蝉蝋躯醤醗頬顛騨鴎鹸麹";

=head1 FUNCTIONS

=head2 replace

cp932 に存在しな文字を代替文字に置換する

=cut

sub replace {
    my $string = shift;
    die 'param is not utf8 flagged' unless Encode::is_utf8($string);

    ## no critic
    eval "\$string =~tr/$cp932_not_exist_characters/$cp932_safe_characters/";
    ## use critic

    return $string;
}

1;

__END__
