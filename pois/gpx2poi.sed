s/ *<wpt lat="\([^"]*\)"  *lon="\([^"]*\)">/latlon="\1,\2"/
s| *<name>\([^<]*\)</name>|name="\1"|
/<cmt>/d
s| *<desc>.*href="http://megalithicireland.com/\(.*\)[?]src=gpx".*|url="/\1"|
s| *<sym>\([^<]*\)</sym>|sym="\1"|
s| *<sym/>|sym=""|
/<\/wpt>/d
