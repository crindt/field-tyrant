#!/usr/bin/perl

$teams = {
    bu12_martin => [
        { w => [ 300, 330 ], f => [300, 330] },
        { w => [ 400, 430 ], f => [400, 430] },
        {}
        ],
    gu13_tbd => [
        { w => [ 300, 330 ], f => [300, 330] },
        { w => [ 500, 530 ], f => [500, 530] },
        {}
        ],
    bu14_tbd => [
        { w => [ 400, 430 ], f => [400, 430] },
        { w => [ 500, 530 ], f => [500, 530] },
        {}
        ],
    bu12_suarez => [
        {}
        ],
    gu11_cardinale => [
        {}
        ],
    bu11_anderson => [
        {}
        ],
    bu10_suarez => [
        {}
        ],
    bu9_serrano => [
        {}
        ],
    gu9_tbd => [
        {}
        ],
    bu8_perry => [
        {}
        ]
};

$fields = {
    adaE => {
        w => [ 300, 330, 400, 430, 500, 530 ],
        f => [ 300, 330, 400, 430, 500, 530 ]
    },
    adaW => {
        w => [ 300, 330, 400, 430, 500, 530 ],
        f => [ 300, 330, 400, 430, 500, 530 ]
    }
};

my %bvars = ();
sub bvar {
    my $v = join("_",@_);
    $bvars{$v}++;
    return $v;
}

# objective
print "min: 0\n";
foreach my $t (keys %{$teams}) {
    my $pri = 1;
    foreach my $o ( @{$teams->{$t}} ) {
        print " + $pri ".bvar($t,"o$pri");
        $pri++
    }
    print "\n";
}
print ";\n";


print "/* Must pick one option for each team */\n";
foreach my $t (keys %{$teams}) {
    my $pri = 0;
    print join(" + ", map { $pri++; bvar( $t, "o$pri") } @{$teams->{$t}} )." = 1;\n";
}


print "\n/* team options */";
foreach my $t (keys %{$teams}) {
    my $pri = 1;
    foreach my $o ( @{$teams->{$t}} ) {
        print "\n".bvar($t,"o$pri")." = ".join('+',map { bvar($t,"o$pri", $_) } keys %${fields}).";\n";

        foreach my $f ( keys %{$fields}) {
            @dd = keys %{$teams->{$t}->[$pri-1]};
            my $tot = 0;
            @slots = ();
            foreach my $d ( @dd ) { 
                $tot += scalar(@{$teams->{$t}->[$pri-1]->{$d}});
                push @slots, map{ bvar($t,$f,$d,$_) } @{$teams->{$t}->[$pri-1]->{$d}};
            }
            if ( $tot ) {
                print "$tot ".bvar($t,"o$pri",$f)." = ".join(" + ",@slots).";\n";
            }
        }

        $pri++;
    }
}



print "\n/* DON'T OVERBOOK FIELDS */";
foreach my $f ( keys %{$fields} ) {
    foreach my $d ( keys %{$fields->{$f}} ) {
        foreach my $t ( @{$fields->{$f}->{$d}} ) {
            print "\n";
            print bvar($f,$d,$t)." <= 1.5;\n";
            print bvar($f,$d,$t)." = ";
            print join(" + ", map { bvar($_,$f,$d,$t) } keys %{$teams});
            print ";\n";
        }
    }
}

# dump binary variables
print "\n/* BINARY VARS */";
print "\nbin ".join(", ",keys %bvars).";\n";
