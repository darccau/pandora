functions qfuzz {
	dom=$(echo $1 | unfurl format %s%d)
	ffuf -c -v -u $1/FUZZ -w quick.txt \
	-H "User-Agent: Mozilla Firefox Mozilla/5.0" \
	-H "X-Bug-Bounty: rez0" -ac -mc all -o quick_$dom.csv \
	-of csv $2 -maxtime 360 $3
}

functions rfuzz {
  mkdir -p recursive
  dom=$(echo $1 | unfurl format %s%d)
  ffuf -c -v -u $1/FUZZ -w $2 -H "User-Agent: Mozilla Firefox Mozilla/5.0" \
  -H "X-Bug-Bounty: rez0" -recursion -recursion-depth 5 -mc all -ac \
  -o recursive/recursive_$dom.csv -of csv $3
}


functions vfuzz {
	dom=$(echo $1 | unfurl format %s%d)
	ffuf -c -u $1 -H "Host: FUZZ" -w vhosts.txt \
	-H "X-Bug-Bounty: rez0" -ac -mc all -fc 400,404 -o vhost_$dom.csv \
	-of csv -maxtime 120
}
