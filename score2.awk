NR == 1 {
	printf "%-6s %-8s", $1, $2
	for (i = 3; i <= NF; i++) printf " %4s", $i
	printf " %4s %4s\n", "총점", "평균"
	num_fields = NF
	next
}
{
	count++
	total = 0
	printf "%-6s %-8s", $1, $2
	for (i = 3; i <= num_fields; i++) {
		printf " %6d", $i
		total += $i
		subsum[i] += $i
	}
	avg = total / (num_fields - 2)
	printf " %6d %6.1f\n", total, avg
}
END {
	if (count > 0) {
		printf "%-14s", "(과목평균)"
		for (i = 3; i <= num_fields; i++)
			printf " %6.1f", subsum[i] / count
		printf "\n"
	}
}
