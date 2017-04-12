Utility Scripts for Chloroplast Assembly and Phylogenetics
=============

<b>split_cp_region_files.pl</b>: Takes a directory of FASTA files with any suffix but requires some suffix separated by a "." (e.g. .txt, .fa, .fsa). The name before the "." should be the taxon name.  This will save some hassle down the line. Combines entries based on FASTA ID lines from files. The names should be the same across the different files. You would probably want these to be gene names, like <i>matK</i>.   Creates new FASTA files based on the gene names.  Each FASTA ID in these gene files will be the name from the sequence's original file. These names are taken from the base name from the file that comes before the ".". Names of "genes" can be any homologous region of a plastome, or any other FASTA file.
