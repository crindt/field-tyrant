#!/usr/bin/perl

use JSON;
use IO::All;

my $confstr << io($ARGV[0] || "winter-2012.json");

my $conf = decode_json( $confstr );

my $teams = $conf->{teams};
my $fields = $conf->{fields};

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

sub field_is_avail {
    my ($f,$d,$t) = @_;

    return grep { $_ eq $t } @{$fields->{$f}->{$d}};
}

@invalid = ();

print "\n/* team options */";
foreach my $tm (keys %{$teams}) {
    my $pri = 1;
    foreach my $o ( @{$teams->{$tm}} ) {
        print "\n".bvar($tm,"o$pri")." = ".join('+',map { bvar($tm,"o$pri", $_) } keys %${fields}).";\n";

        foreach my $f ( keys %{$fields}) {
            @dd = keys %{$teams->{$tm}->[$pri-1]};
            my $tot = 0;
            @slots = ();
            foreach my $d ( @dd ) { 
                @times = @{$teams->{$tm}->[$pri-1]->{$d}};
                $tot += scalar(@times);
                push @slots, map{ bvar($tm,$f,$d,$_) } @times;
                foreach $t ( @times ) {
                    push @invalid, map {
                        bvar($tm,$f,$d,$_)
                    } grep { not field_is_avail( $f, $d, $t ) } @times;
                }
                
            }
            if ( $tot ) {
                print "$tot ".bvar($tm,"o$pri",$f)." = ".join(" + ",@slots).";\n";
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
            print bvar($f,$d,$t)." <= ".(field_is_avail( $f, $d, $t )?1.5:0).";\n";
            print bvar($f,$d,$t)." = ";
            print join(" + ", map { bvar($_,$f,$d,$t) } keys %{$teams});
            print ";\n";
        }
    }
}

if ( @invalid ) {
    print "\n/* ZERO THE DISALLOWED TIMES */\n";
    print join( " + ", @invalid )." = 0;";
}


# dump binary variables
print "\n/* BINARY VARS */";
print "\nbin ".join(", ",keys %bvars).";\n";
