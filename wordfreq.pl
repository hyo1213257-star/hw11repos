#!/usr/bin/perl

my %freq;

while (<STDIN>) {
    chomp;
    next if $_ eq "";
    $freq{$_}++;
}

printf "%-20s %s\n", "단어", "빈도";
foreach my $word (sort keys %freq) {
    printf "%-20s %d\n", $word, $freq{$word};
}
