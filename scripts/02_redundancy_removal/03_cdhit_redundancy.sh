#!/bin/bash

# ============================================================
# CHIKV Redundancy Removal using CD-HIT-EST
# ============================================================
#
# Purpose:
#     Remove identical nucleotide sequences from the curated
#     CHIKV whole-genome dataset.
#
# Tool:
#     CD-HIT-EST
#
# Identity threshold:
#     100%
#
# Input:
#     Curated CHIKV FASTA file
#
# Output:
#     Non-redundant CHIKV FASTA file
#
# Usage:
#     bash 03_cdhit_redundancy.sh input.fasta output_prefix
# ============================================================

set -e

# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: bash 03_cdhit_redundancy.sh input.fasta output_prefix"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# CD-HIT settings
IDENTITY=1.00
THREADS=8

echo "Input FASTA: $INPUT"
echo "Identity threshold: ${IDENTITY}"
echo "Threads: ${THREADS}"

# Run CD-HIT-EST
cd-hit-est \
    -i "$INPUT" \
    -o "$OUTPUT" \
    -c "$IDENTITY" \
    -n 10 \
    -T "$THREADS" \
    -M 0 \
    -d 0

echo ""
echo "Redundancy removal completed."
echo "Non-redundant sequences: ${OUTPUT}"
echo "CD-HIT cluster information: ${OUTPUT}.clstr"
