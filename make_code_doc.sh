#!/bin/bash
code_dir=$1
out_file=$2
find ${code_dir} -type f '(' -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.php' ')' \
    -exec cat {} \; | dos2unix | sed -f script > ${out_file}

source venv/bin/activate
python make_docx.py ${out_file}
