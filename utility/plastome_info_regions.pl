#!/usr/bin/perl -w
use strict;

my $cp_genome;
open my $file, "<", $ARGV[0]; #cp genome full
while(<$file>){
	chomp;
	if(/>/){
		next;
	}
	else{
		$cp_genome = $_;
	}
}

my $lsc;
my $ssc;
my $irb;
my $ira;

my $boundary1= substr(reverse($cp_genome), 0, 20);
$boundary1 =~ tr/ATCGatcg/TAGCtagc/;
my $start_irb = index($cp_genome, $boundary1);

$lsc = substr($cp_genome, 0, $start_irb);

my $i = $start_irb;

my $irb_end = substr($cp_genome, $i, 20);
$irb_end = reverse($irb_end);
$irb_end =~ tr/ATCGatcg/TAGCtagc/;

until($cp_genome !~ /$irb_end/){
	$i++;
	$irb_end = substr($cp_genome, $i, 20);
	$irb_end = reverse($irb_end);
	$irb_end =~ tr/ATCGatcg/TAGCtagc/;
}
$i--;
$irb_end = substr($cp_genome, $i, 20);
$irb = substr($cp_genome, $start_irb, ($i+20-$start_irb));
my $ira_seq = $irb_end;
$ira_seq = reverse($ira_seq);
$ira_seq =~ tr/ATCGatcg/TAGCtagc/;
my $ira_start = index($cp_genome, $ira_seq);
$ssc = substr($cp_genome, $i+20, $ira_start-($i+20));
$ira= substr($cp_genome, $ira_start);

open my $outfile, ">", $ARGV[1] . "_cp_regions.fsa";
print $outfile ">lsc\n$lsc\n>ssc\n$ssc\n>irb\n$irb\n";
