function rundspruch-oe --description "Aufzeichnen des OE-Rundspruchs in ~/Musik/Rundsprueche/OE"
	set date (date +"%d.%B %Y")
	set title "OE-Rundspruch vom $date"
	set filename oe-rundspruch-(date +%Y-%m-%d).mp3

	ffmpeg -y -i "https://live.datamatix.at:9040/;stream.mp3" \
		-c:a libmp3lame -q:a 9 \
		-map_metadata -1 -id3v2_version 4 \
		-metadata TPE2="ÖVSV OE Rundspruch Team" \
		-metadata TPE1="ÖVSV" \
		-metadata TIT2="$title" \
		-metadata TIT3="Das Team: YL Sylvia OE1YXS, OM Nicolas OE1NBS, OM Wolfgang OE1WBS" \
		-metadata TDEN=(date -I) \
		-metadata TALB="OE-Rundspruch" \
		-metadata LINK="http://oersp.oevsv.at/" \
		-metadata TENC="Dominic Reich, OE7DRT, https://oe7drt.com" \
		-metadata COMM="Stream: https://live.datamatix.at:9040/;stream.mp3" \
		$HOME/Musik/Rundsprueche/OE/$filename

	mpc update
	mpc add Rundsprueche/OE/$filename
	#mpc searchplay $title

	set -e date title filename
end
