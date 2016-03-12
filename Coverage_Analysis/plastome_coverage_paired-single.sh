#!/bin/bash
cd `pwd`



bowtie2-build $1 $2_bowtie 

bowtie2 --very-sensitive-local --quiet --al map_hits.fq --al-conc map_pair_hits.fq -x $2_bowtie -1 $3 -2 $4 -U $5 -S plastid_coverage.sam

jellyfish count -m 25 -t 4 -C -s 1G map_*

jellyfish dump mer_counts.jf > $2_25dump

perl Chloroplast-Genome-Assembly/Coverage_Analysis/new_window_coverage.pl $2_25dump $1 25
Rscript Chloroplast-Genome-Assembly/Coverage_Analysis/plot_coverage.r $2.coverage_25kmer.txt $2

perl Chloroplast-Genome-Assembly/Coverage_Analysis/check_plastid_coverage.pl $2.coverage_25kmer.txt  25 0


