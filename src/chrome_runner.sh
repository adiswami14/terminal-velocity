for word in $@
do
    search_ext="$search_ext%20$word"
done
    open "http://www.google.com/search?q=$search_ext"