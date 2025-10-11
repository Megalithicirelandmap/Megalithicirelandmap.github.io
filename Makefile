%.rng: %.rnc
	# trang: java -jar "$(dirname "$0")"/trang-20090818/trang.jar "$@"
	# trang-20090818 http://web.archive.org/web/20100314025346/http://code.google.com/p/jing-trang/downloads/list
	trang $^ $@

gpxlint: tools/monuments.rng monuments.gpx
	# xmllint: sudo apt-get install libxml2-utils
	# tools/monuments.rng is a stricter form of http://www.topografix.com/GPX/1/1/gpx.xsd
	xmllint --noout --relaxng $^
