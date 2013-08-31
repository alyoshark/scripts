import re
import sys

with open(sys.argv[1]) as f:
    lines = f.read().split()
    urls = []
    for l in lines:
        matcher = re.match(r'href=\"(/watch\?v=.*?)&amp;list=', l)
        if matcher:
            url = "http://youtube.com" + matcher.group(1)
            if url not in urls:
                urls.append(url)
    print "\n".join(urls)
