"""
 Markdown.py
 0. just print whatever is passed in to stdin
 0. if filename passed in as a command line parameter, 
    then print file instead of stdin
 1. wrap input in paragraph tags
 2. convert single asterisk or underscore pairs to em tags
 3. convert double asterisk or underscore pairs to strong tags

"""

import fileinput
import re

def convertStrong(line):
  line = re.sub(r'\*\*(.*)\*\*', r'<strong>\1</strong>', line)
  line = re.sub(r'__(.*)__', r'<strong>\1</strong>', line)
  return line

def convertEm(line):
  line = re.sub(r'\*(.*)\*', r'<em>\1</em>', line)
  line = re.sub(r'_(.*)_', r'<em>\1</em>', line)
  return line

def convertCustom(line):
    if line[0] == '>':
        line = "<blockquote>" + line[1:] + "\n" + "</blockquote>"
    elif line[0] == '#':
        if line[0:2] == "##":
            if line[0:3] == "###":
                line = "<h3>" + line[3:] + "</h3>"
            else:
                line = "<h2>" + line[2:] + "</h2>"
        else:
            line = "<h1>" + line[1:] + "</h1>"
    return line

for line in fileinput.input():
  line = line.rstrip() 
  line = convertStrong(line)
  line = convertEm(line)
  line = convertCustom(line)
  print '<p>' + line + '</p>',

