#!/bin/bash

# 准备代码
git clone git@gogs.betterhr.cn:sj/coincircle-backend.git ../coincircle-backend
mkdir -p ../newsapp/APP2
rm -f ../newsapp/APP2/*
find ../newsapp/APP -type f \( -name '*.js' -o -name '*.html' -o -name '*.css' \) -exec cp {} ../newsapp/APP2/ \;

proj=(
    资讯站管理系统IOS端
    资讯站管理系统Android端
    资讯站管理系统H5端
    资讯站管理系统PC端
    )
code_dir=(
    ../newsapp/APP/
    ../newsapp/APP2/
    ../coincircle-backend/www_suxiangw_com/
    ../coincircle-backend/suxiangw/
    )
out_dir=project
version='V1.0'

num=0
for i in "${proj[@]}" ; do
    mkdir -p ${out_dir}/${i}V1.0
    . make_code_doc.sh ${code_dir[${num}]} ${out_dir}/${i}${version}/${i}${version}源代码.txt
    source venv/bin/activate
    python make_manual_docx.py ${out_dir}/${i}${version}/ ${i}${version}
    let "num=num+1"
done
