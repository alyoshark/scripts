import re
import sys

with open(sys.argv[1]) as f:
    lines = f.read().split()
    for l in lines:
        url = re.match(r'href=\"(/watch\?v=.*?)&amp;list=', l)
        if url:
            print "http://youtube.com" + url.group(1)
