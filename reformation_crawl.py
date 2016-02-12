import codecs
from urllib2 import urlopen
from contextlib import closing

from lxml import html
from lxml.etree import tostring

BASE_URL = "https://www.biblegateway.com"
BOOK_URL = BASE_URL + "/resources/reformation-study-bible/toc/"
REL_REF = "/passage/?search="
ABS_REF = BASE_URL + REL_REF

RESOURCE_PATH = "//ul[@class='resource-list']/li/a[@href]"
CONTENT_PATH = "//div[@class='article']/p"


def parse_content(selected=None, excluded=None):
    with closing(urlopen(BOOK_URL)) as page:
        tree = html.fromstring(page.read())
    books = tree.xpath(RESOURCE_PATH)
    for book in books:
        title = book.text
        if (selected and title not in selected) or \
           (excluded and title in excluded):
            continue
        print "Parsing %s" % title
        parse_book(book)


def parse_book(book):
    title = book.text
    url = BASE_URL + book.attrib["href"]
    with closing(urlopen(url)) as page:
        tree = html.fromstring(page.read())
    notes = tree.xpath(RESOURCE_PATH)
    with codecs.open(title + ".html", 'w', "utf-8") as f:
        f.write("<html><body>")
        for note in notes:
            _, comment = parse_note(note)
            f.write("%s" % comment)
        f.write("</body></html>")


def parse_note(note):
    title = note.text
    url = BASE_URL + note.attrib["href"]
    with closing(urlopen(url)) as page:
        tree = html.fromstring(page.read())
    contents = [tostring(i).replace(REL_REF, ABS_REF) for i in tree.xpath(CONTENT_PATH)]
    return title, " ".join(contents)


if __name__ == "__main__":
    parse_content(selected=frozenset(("Matthew", "Mark", "Luke", "John")))
