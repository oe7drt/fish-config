function pocsag-rtl --description "Prints incoming DAPNET messages on 438.025MHz"
	#rtl_fm -f 438025000 -s 22050 | multimon-ng -t raw -q - | egrep "^[A-Z0-9]+:"
	rtl_fm -f 438025000 -s 22050 | multimon-ng -t raw -q -a POCSAG512 \
		-a POCSAG1200 -a POCSAG2400 -f alpha -
end