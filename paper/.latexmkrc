#!/usr/bin/env perl

# 出力モード (3 = dvi -> pdf)
$pdf_mode = 3;

# uplatex + dvipdfmx を使用 (論文用)
$latex = 'uplatex -synctex=1 -file-line-error -halt-on-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';

# 最大リピート回数
$max_repeat = 5;

# BibTeX と Biber の設定
$bibtex_use = 2;
$bibtex = 'upbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# 索引作成 (upmendex 使用)
$makeindex = 'upmendex %O -o %D %S -s jpbase';

# 出力ディレクトリ
$out_dir = ".";

# エラーが発生した場合に一時ファイルを削除しない
$emulate_aux = 1;

# クリーンアップ
$clean_ext="$clean_ext %R.dvi %R.synctex.gz indent.log";
