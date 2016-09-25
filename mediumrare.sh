#!/bin/bash
URL=$1
file=$2
echo "parsing: $URL"
./rss2md.py $URL > $file.md
# remove gerümpel before first article
sed -i "" '1,/\* \*/d' $file.md
# remove gerümpel in betwee articles
sed -i "" '/BlockedUnblockFollowFollowing/,/\* \*/d' $file.md

#add title info
DATE=`date +%Y-%m-%d`
echo "% $file $DATE
% Medium Rare Script
" | cat - $file.md > temp && mv temp $file.md

pandoc --epub-stylesheet styles.css -f markdown -t epub -o $DATE-$file $file.md
rm $file.md *.html
echo "done!"
 

