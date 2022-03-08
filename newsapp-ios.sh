#!/bin/bash
outfile=newsapp-ios2-code.txt
outdir=outfile
find ../newsapp/APP/ -type f '(' -name '*.html' -o -name '*.css' -o -name '*.js' ')' \
    -exec cat {} \; > $outdir/$outfile
dos2unix $outdir/$outfile
sed -i 's#//.*##g' $outdir/$outfile
sed -i 's/速翔网络/资讯站/g' $outdir/$outfile
sed -i 's/QQ技术：//g' $outdir/$outfile
sed -i 's/1424445608//g' $outdir/$outfile
sed -i "s/<!--.*-->//g" $outdir/$outfile
sed -i 's/^\s*$//g' $outdir/$outfile
sed -i '/^$/d' $outdir/$outfile
