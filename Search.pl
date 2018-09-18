#!/usr/bin/perl
#perl Search.pl  list.txt TAIR10_GFF3_genes.gff > ll.txt 
open SEARCH,$ARGV[0] or die $!;
while ( <SEARCH> ) {
    $_ =~ s/\n*|\r*//g;
    if ( /(\S+(( ?\S+)*)?)/ ) {
        push @pattern , $1;
    }
}

open GFF,$ARGV[1] or die $!;
while (<GFF>) {
    #next if ($line != /\tgene\t/);
    my @F=split /\t/, $_;
    next if ($F[2] ne 'gene');
    foreach my $var (@pattern) {
          if ( $F[8] =~ /$var/ )  {
          	$F[0] =~ /(\d+)/;
                 print "$1\t$F[3]\t$var\n";
          }
    }
}
