%.rng: %.rnc
	# trang: java -jar "$(dirname "$0")"/trang-20090818/trang.jar "$@"
	# trang-20090818 http://web.archive.org/web/20100314025346/http://code.google.com/p/jing-trang/downloads/list
	trang $^ $@

gpxlint: tools/monuments.rng monuments.gpx
	# xmllint: sudo apt-get install libxml2-utils
	# tools/monuments.rng is a stricter form of http://www.topografix.com/GPX/1/1/gpx.xsd
	xmllint --noout --relaxng $^

urls : monuments.gpx
	grep -F '<desc>' $< | cut -d ':' -f2 | cut -d '?' -f1 | cut -c 25-

# create the sinple poi files from csplit result gpx snippets
%.poi : pois/gpx2poi.sed %.gpx
	sed -f $^ > $@~
	mv $@~ $@
pois : $(patsubst %.gpx,%.poi,$(wildcard pois/*/*.gpx))
# turn single poi file into single poi gpx snippet
%.poi.gpx : pois/poi2gpx.sh %.poi
	sh $^ | xmllint - | tail +2 > $@~
	mv $@~ $@
# glue all gpx snippets together
pois.gpx : pois/head.gpx $(patsubst %.poi,%.poi.gpx,$(wildcard pois/*/*.poi)) pois/tail.gpx
	cat $^ | xmllint --format --nocdata - > $@~
	mv $@~ $@
clean :
	rm pois.gpx pois/*/*.poi*
