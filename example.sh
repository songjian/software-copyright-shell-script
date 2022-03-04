#!/bin/bash
filename=newsapp-pc
filepath=out
find ../coincircle-backend/suxiangw/ -type f -name "*.php" -exec cat {} \; > $filepath/$filename-code.txt
dos2unix $filepath/$filename-code.txt
sed -i 's#//.*##g' $filepath/$filename-code.txt
sed -i 's/^\s*$//g' $filepath/$filename-code.txt
sed -i '/^$/d' $filepath/$filename-code.txt
