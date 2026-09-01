# nsP1 gene extraction
seqkit subseq -r 110:2559 ../aligned_genomes.fasta > nsP1_raw.fasta

# nsP2 gene extraction
seqkit subseq -r 2560:4302 ../aligned_genomes.fasta > nsP2_raw.fasta

# nsP3 gene extraction
seqkit subseq -r 4436:6956 ../aligned_genomes.fasta > nsP3_raw.fasta

# nsP4 gene extraction
seqkit subseq -r 6961:7919 ../aligned_genomes.fasta > nsP4_raw.fasta

# Capsid gene extraction
seqkit subseq -r 7967:8746 ../aligned_genomes.fasta > capsid_raw.fasta

# E3 gene extraction
seqkit subseq -r 8747:9010 ../aligned_genomes.fasta > E3_raw.fasta

# E2 gene extraction
seqkit subseq -r 9011:9898 ../aligned_genomes.fasta > E2_raw.fasta

# E1 gene extraction
seqkit subseq -r 10139:11713 ../aligned_genomes.fasta > E1_raw.fasta
