BEGIN {
	printf "%-6s %-8s %4s %4s %4s %4s %4s\n", \
	       "학번", "이름", "국어", "영어", "수학", "총점", "평균"
}
NR==1 { next }
{
	total = $3 + $4 + $5
	avg = total / 3.0
	count++
	kor += $3; eng += $4; mat += $5
	printf "%-6s %-8s %6d %6d %6d %6d %6.1f\n", \
	       $1, $2, $3, $4, $5, total, avg
}
END {
	if(count > 0)
		printf "%-14s %6.1f %6.1f %6.1f\n", \
		"(과목평균)", kor/count, eng/count, mat/count
}
