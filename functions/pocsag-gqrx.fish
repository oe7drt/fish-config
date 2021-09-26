function pocsag-gqrx
	socat stdout udp-listen:9999 | sox -t raw -esigned-integer -b 16 \
		-r 48000 - -esigned-integer -b 16 -r 22050 -t raw - | multimon-ng -t raw \
		-a POCSAG512 -a POCSAG1200 -a POCSAG2400  -f alpha -
end