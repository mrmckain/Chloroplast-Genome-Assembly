#!/usr/bin/perl -w
use strict;
#USAGE perl find_matching_reads.pl string reads
open my $out, ">", "matching_reads.fsa";
my %seqs;
my @files = <*.fq>;
for my $tfile (@files){
	open my $file, "<", $tfile;

		while(<$file>){
			chomp;
			#for (my $i=0; $i<=length($ARGV[0])-20; $i++){
                		my $sub = $ARGV[0];#substr($ARGV[0], $i, 20);
                		my $revpat = reverse($sub);
                		$revpat =~ tr/ATCGatcg/TAGCtagc/;
				if(/$sub/i){
					$seqs{$_}=1;
					print $out ">matchread_curr\n$_\n";
				}
				if(/$revpat/i){
					$seqs{$_}=1;
					print $out ">matchread_curr\n$_\n";
				}
			
		}
}

for my $seq (keys %seqs){
	print $out ">matchread\n$seq\n";
}
