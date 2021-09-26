function opti --description "Optimizes .png files"
	# Author: Dominic, OE7DRT <dominic@oe7drt.com>
  	# 2021-04-17
	set -e missing

	for program in optipng advpng pngcrush
		if \! command -v $program > /dev/null
			set -a missing $program
			continue
		end
	end

	if test -n "$missing"
		echo "Could not find executables: $missing"
		return 1
	end

	if test -z $argv[1]
		echo "usage: opti <files...>"
		return 1
	end

	set count (count $argv)

	for i in (seq 1 $count)
		if test ! -f $argv[$i]
			echo "Could not read file $argv[$i]..."
			continue
		end

		optipng -nb -nc "$argv[$i]";
		advpng -z4 "$argv[$i]";
		pngcrush -rem gAMA -rem alla -rem cHRM -rem iCCP -rem sRGB -rem time -ow "$argv[$i]";
	end
end
