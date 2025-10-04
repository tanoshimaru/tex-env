#!/usr/bin/env perl

# 出力モード (4 = lualatex)
$pdf_mode = 4;

# lualatex を使用 (ポスター用)
$lualatex = 'lualatex -synctex=1 -file-line-error -halt-on-error %O %S';

# 最大リピート回数
$max_repeat = 5;

# BibTeX と Biber の設定
$bibtex_use = 2;
$bibtex = 'upbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# 出力ディレクトリ
$out_dir = ".";

# エラーが発生した場合に一時ファイルを削除しない
$emulate_aux = 1;

# クリーンアップ
$clean_ext="$clean_ext %R.nav %R.snm %R.synctex.gz indent.log";
