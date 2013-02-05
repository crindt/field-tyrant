#!/usr/bin/perl

$sched;
$teams;

LOOP: while(<>) {
    /^\s*$/ && next LOOP;
    /Value of the objective function:/ && next LOOP;
    /Actual values/ && next LOOP;
    /(\w+)\s+(\d+)/ && do {
        $d = 0;
        $t = 0;
        ($team,$coach,$of,$d,$t) = split(/_/,$1);
        if ( $d && $t && $2 == 1) {
            $sched->{$of}->{$d}->{$t} = "$team $coach";
            $teams->{"$team"."_"."$coach"}->{$d}->{$t} = $of;
            1;
        } else {
        }
    }
}

%dorder = ( mo => 1, tu => 2, we => 3, th => 4, fr => 5, sa => 6, su => 7 );

foreach my $f ( keys %{$sched} ) {
    foreach my $d ( sort { $dorder{$a} <=> $dorder{$b} } keys %{$sched->{$f}} ) {
        foreach my $t ( sort keys %{$sched->{$f}->{$d}} ) {
            print "$f on $d @ $t is ".$sched->{$f}->{$d}->{$t}."\n";
        }
    }
}

foreach my $tm ( keys %{$teams} ) {
    print "$tm:\n";
    foreach my $d ( sort { $dorder{$a} <=> $dorder{$b} } keys %{$teams->{$tm}} ) {
        foreach my $t ( sort keys %{$teams->{$tm}->{$d}} ) {
            print "$d @ $t is ".$teams->{$tm}->{$d}->{$t}."\n";
        }
    }
}
