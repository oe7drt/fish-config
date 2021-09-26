function rot1 --description "decodes a ROT-1 string"
	echo "$argv" | tr 'b-za-aB-ZA-A' 'a-zA-Z'
end