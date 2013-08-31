import xml.etree.ElementTree as et
import sys

tree = et.parse(sys.argv[1])
fp = open(sys.argv[2], "w")
ls = [i.find("enclosure").attrib['url'] for i in \
        tree.getroot().find("channel").findall("item")]
fp.write("\n".join(ls))
