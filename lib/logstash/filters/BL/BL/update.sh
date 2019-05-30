for FILE in `find . -type d`; do
    CAT=$(basename $FILE)
    for URL in `cat $FILE/domains`; do
        echo "$URL|$CAT" >> blacklist
    done
done
