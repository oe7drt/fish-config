function decode-gqrx --description "Reads packets from Gqrx via UDP and plays audio"
	socat stdout udp-listen:9999 | dsdccx -i - -fa -o - | play -q -t s16 -r 8k -c 1 -
end