# Chloroplast-Genome-Assembly
Authors: Michael R. McKain
	  <br>Mark Wilson

This pipeline was developed to assembly whole chloroplast genomes from genome shotgun data from Illumina.  Any high-throughput sequencing data should work, but we have mostly tested with Illumina.

The assembly pipeline is capable of producing full chloroplast genomes (with proper orientation) under certain circumstances.  We are exploring how to optimize this.

<h2>Assembly</h2>

These scripts will be uploaded soon.


<h2>Coverage Analysis</h2>

The coverage analysis pipeline uses a 25 base pair sliding window to look at coverage across your assembly.  A graphical representation of the coverage is provided.

Usage:

<b>plastome_coverage_paired-single.sh Chloroplast_Assembly Accession_ID Paired_End-1 Paired_End-2 Single_End</b>

Definition:

          --Chloroplast_Assembly        Assembly in fasta format.
          --Accession_ID                Name for your sample.
          --Paired_End-1                Fastq file for paired end read 1
          --Paired_End-2                Fastq file for paired end read 2 
          --Single_End                  Comma delimited list of single end fastq files of reads


The current version needs Jellyfish (v2+) and bowtie2, expected to be in PATH.  We usually use Trimmomatic trimmed paired end reads, so we use the two trimmed paired end files and both unpaired files that trimmomatic outputs.
