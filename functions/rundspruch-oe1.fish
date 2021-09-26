function rundspruch-oe1 --description "Aufzeichnen des Wien-Rundspruchs in ~/Musik/Rundsprueche/OE1"
	set date (date +"%d.%B %Y")
	set title "OE1-Rundspruch vom $date"
	set filename oe1-rundspruch-(date +%Y-%m-%d).mp3

	ffmpeg -y -i "https://www.oe1-oevsv.at/oe1-bulletin" \
		-c:a libmp3lame -q:a 9 \
		-map_metadata -1 -id3v2_version 4 \
		-metadata TPE2="ÖVSV OE1 Rundspruch Team" \
		-metadata TPE1="ÖVSV" \
		-metadata TIT2="$title" \
		-metadata TIT3="Das Team: YL Karin OE1SKC, OM Roland OE1RSA, OM Andreas OE1ADS" \
		-metadata TDEN=(date -I) \
		-metadata TALB="OE1-Rundspruch" \
		-metadata LINK="https://wrsp.oe1-oevsv.at/" \
		-metadata TENC="Dominic Reich, OE7DRT, https://oe7drt.com" \
		-metadata COMM="Stream: https://www.oe1-oevsv.at/oe1-bulletin" \
		$HOME/Musik/Rundsprueche/OE1/$filename

	mpc update
	mpc add Rundsprueche/OE1/$filename
	#mpc searchplay $title

	set -e date title filename
end

