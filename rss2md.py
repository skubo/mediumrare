#!/usr/bin/python2.7
import feedparser
import sys
from subprocess import call

rss_url = sys.argv[1]

feed = feedparser.parse( rss_url )
items = feed["items"]
for item in items:
    time = item[ "published_parsed" ]
    title = item[ "title" ]
    url = item[ "link" ]
    fileName = str(time.tm_year) + '-' + str(time.tm_mon) + '-' + str(time.tm_mday) + "-" + title + '.html'
    fileName = fileName.replace("/", "")
    call(["curl", "-L", url, "-o", fileName])
    call(["html2text", "--protect-links", "--images-with-size", "--no-wrap-links", fileName])
    