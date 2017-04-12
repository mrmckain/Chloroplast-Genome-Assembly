#!/usr/bin/perl -w
use strict;


my @files = <*cp_regions.fsa>;
open my $out, ">", $ARGV[1];
for my $file (@files){
	$file =~ /(.*?)_cp/;
	my $species = $1;
	
	open my $tfile, "<", $file;
	my $go=0;
	while(<$tfile>){
		chomp;
		if(/>/){
			if(/$ARGV[0]/i){
			$go = 1;
			print $out ">$species\n";
		}
		else{
			$go=0;
		}}
		
		elsif($go==1){
			print $out "$_\n";			
		}
		
	}
}
