function ysfdecode --description "Decodes YSF signals on $argv frequency"
	if test (count $argv) = 1
		if test "$argv[1]" -gt 430000000 -a "$argv[1]" -lt 447000000
			rtl_fm -f $argv[1] -s 22050 | dsdccx -i - -o - -fy | play -q -t s16 -r 8k -c 1 -
		else
			echo "Incorrect frequency!"
		end
	else
		echo "Which frequency?"
		echo "Use: dmrdecode <frequency>"
	end
end