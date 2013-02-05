#!/usr/bin/perl

$sched;

LOOP: while(<>) {
    /^\s*$/ && next LOOP;
    /Value of the objective function:/ && next LOOP;
    /Actual values/ && next LOOP;
    /(\w+)\s+(\d+)/ && do {
        print $1."\n";
        $d = 0;
        $t = 0;
        ($team,$coach,$of,$d,$t) = split(/_/,$1);
        print join(",",$team,$coach,$of,$d,$t),"\n";
        if ( $d && $t && $2 == 1) {
            print "$team $coach\n";
            $sched->{$of}->{$d}->{$t} = "$team $coach";
            print "$of on $d @ $t is $team $coach\n";
            1;
        } else {
            print "NO BOOHOOKY\n"
        }
    }
}

foreach my $f ( keys %{$sched} ) {
    foreach my $d ( keys %{$sched->{$f}} ) {
        foreach my $t ( sort keys %{$sched->{$f}->{$d}} ) {
            print "$f on $d @ $t is ".$sched->{$f}->{$d}->{$t}."\n";
        }
    }
}
