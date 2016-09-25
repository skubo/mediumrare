# mediumrare
bash and python scripts for converting medium.com article feeds into epub tiles

Currently this is a sunday afternoon hack, but it produces readable output. This might break very soon, if medium.com changes their website. 

## prerequisites

- pandoc (http://pandoc.org)
- curl
- python 2.7 (in /usr/bin/python2.7)
- feedparser python module
- html2text python module
- tested on OSX, might work on Linux too, not on Windows. 

## usage

./mediumrare.sh <feedurl> <outputfilename>

example: 
./mediumrare.sh https://medium.com/feed/@skubo skubo.epub

## how it works

Medium.com makes it really hard for you to read content from their site on different devices apart from web browsers. I want to read the stories there on my e-reader though during my commutes to and from work. Most HTML scapers will still keep too much garbage in their outputs, also "html2epub" converters that I found did not work very well. So after fiddling around with a lot of html tools, I gave up and rather looked at their RSS feeds. Most of the pages at medium.com can be prefixed with "feed" in the URL path like medium.com/feed/@skubo, which works also with pages and tags https://medium.com/feed/tag/football. This alone is not enough, because most feeds do not contain the full article text. So what we do here is to fetch the XML-feed, extract the article URLs, use curl to load the HTML page, then use the html2text module to get rid of all the HTML junk, save that as markdown. A little "sed-ing" later, stripping off repeated in-between-article content, we can then feed that combined markdown text into pandoc, which will create an epub file. 

## potential improvements

- optimizing styles for epub in styles.css
- use medium channel title image and author info for the epub title page
