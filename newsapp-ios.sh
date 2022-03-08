#!/bin/bash
outfile=newsapp-ios-code.txt
outdir=outfile
find ../newsapp/APP/ -type f '(' -name '*.html' -o -name '*.css' -o -name '*.js' ')' \
    -exec cat {} \; | dos2unix | sed -f script > $outdir/$outfile
