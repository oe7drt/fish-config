function vidrotate --description "Rotates a video file by 90° with ffmpeg"
	if test (count $argv) -lt 2	-o 	"$argv[1]" = "--help"
		set pname (basename (status -f))
		echo "usage: $pname <INPUT-FILE> <OUTPUT-FILE>"
		return 1
	end

	set infile  $argv[1]
	set outfile $argv[2]

	if test ! -r $infile
		echo "Could not read $infile"
		return 1
	end

	ffmpeg -i $infile -map_metadata 0 -metadata:s:v rotate="90" -c copy $outfile
end