#!/usr/bin/env python
from docx import Document
from docx.shared import Pt
from docx.oxml.ns import qn
from docx.shared import Cm
import os
import sys

#f=open(sys.argv[1],mode='r',encoding='utf-8')
#code=f.read()

res=os.popen("head -n 1530 " + sys.argv[1])
code=res.read()
res=os.popen("tail -n 1530 " + sys.argv[1])
code+=res.read()

path = sys.argv[1][0:-4] + ".docx"
os.system("touch %s" %path)
document = Document('examples.docx')
document.styles['Normal'].font.name = u'Times New Roman' #设置西文字体
document.styles['Normal']._element.rPr.rFonts.set(qn('w:eastAsia'), u'宋体') #设置中文字体使用字体2->宋体
document.sections[0].top_margin = Cm(2.04)
document.sections[0].bottom_margin = Cm(2.04)
document.sections[0].left_margin = Cm(2.54)
document.sections[0].right_margin = Cm(2.54)
p = document.paragraphs[0]
p.text=code
p.style.font.size=Pt(10.5)
p.paragraph_format.line_spacing=Pt(14)
document.save(path) 
