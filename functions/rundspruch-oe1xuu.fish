function rundspruch-oe1xuu --description "Aufzeichnen der Relaisaktivität von OE1XUU in ~/Musik/Rundsprueche/OE1XUU"
	set date (date +"%d.%B %Y %H:%M:%S")
	set title "OE1XUU Repeater-Aktivität vom $date"
	set filename oe1xuu-(date +%Y-%m-%d-%H%M%S).mp3

	ffmpeg -y -i "https://www.oe1-oevsv.at/oe1xuu-repeater" \
		-c:a libmp3lame -q:a 9 \
		-map_metadata -1 -id3v2_version 4 \
		-metadata TPE2="ÖVSV OE1XUU Repeater" \
		-metadata TPE1="ÖVSV" \
		-metadata TIT2="$title" \
		-metadata TIT3="OE1XUU SysOp: OM Andy OE1BAD" \
		-metadata TDEN=(date -I) \
		-metadata TALB="OE1XUU Repeater" \
		-metadata LINK="https://www.oevsv.at/funkbetrieb/livestreams/" \
		-metadata TENC="Dominic Reich, OE7DRT, https://oe7drt.com" \
		-metadata COMM="Stream: https://www.oe1-oevsv.at/oe1xuu-repeater" \
		$HOME/Musik/Rundsprueche/OE1XUU/$filename

	mpc update
	mpc add Rundsprueche/OE1XUU/$filename
	#mpc searchplay $title

	set -e date title filename
end
