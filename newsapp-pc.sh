#!/bin/bash
outfile=newsapp-pc-code.txt
outdir=outfile
find ../coincircle-backend/suxiangw/ -type f -name "*.php" -exec cat {} \; > $outdif/$outfile
dos2unix $outdif/$outfile
sed -i 's#//.*##g' $outdif/$outfile
sed -i 's/^\s*$//g' $outdif/$outfile
sed -i '/^$/d' $outdif/$outfile
