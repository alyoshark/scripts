import re
import sys

with open(sys.argv[1]) as f:
    lines = f.read().split()
    urls = []
    for l in lines:
        url = re.match(r'href=\"(/watch\?v=.*?)&amp;list=', l)
        if url:
            urls.append("http://youtube.com" + url.group(1))

    uniq_urls = set(urls)
    for url in uniq_urls:
        print url
