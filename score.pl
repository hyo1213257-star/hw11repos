#!/usr/bin/perl

my $num_subjects = 0;
my @subsum;
my $count = 0;

while (<>) {
    chomp;
    my @f = split(/\s+/);

    if ($. == 1) {
        $num_subjects = scalar(@f) - 2;

        printf "%-8s %-8s", $f[0], $f[1];
        for my $i (2 .. $#f) { printf " %8s", $f[$i]; }
        printf " %8s %8s\n", "총점", "평균";

        next;
    }

    $count++;
    my $total = 0;

    printf "%-6s %-8s", $f[0], $f[1];
    for my $i (2 .. $#f) {
        printf " %6d", $f[$i];
        $total      += $f[$i];
        $subsum[$i] += $f[$i];
    }

    my $avg = $total / $num_subjects;
    printf " %6d %6.1f\n", $total, $avg;
}

if ($count > 0) {
    printf "%-14s", "(과목평균)";
    for my $i (2 .. (1 + $num_subjects)) {
        printf " %6.1f", $subsum[$i] / $count;
    }
    printf "\n";
}
