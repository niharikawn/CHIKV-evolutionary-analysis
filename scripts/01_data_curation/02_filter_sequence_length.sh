#!/bin/bash

# ============================================================
# CHIKV Whole-Genome Sequence Length Filtering
# ============================================================
#
# Purpose:
#     Retain CHIKV whole-genome sequences with a minimum
#     length of 11,000 nucleotides.
#
# Tool:
#     SeqKit
#
# Input:
#     FASTA file containing CHIKV sequences
#
# Output:
#     FASTA file containing sequences >= 11,000 nt
#
# Usage:
#     bash 02_filter_sequence_length.sh input.fasta output.fasta
# ============================================================

# Stop the script if an error occurs
set -e

# Check that the correct number of arguments was provided
if [ "$#" -ne 2 ]; then
    echo "Usage: bash 02_filter_sequence_length.sh input.fasta output.fasta"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# Minimum genome length
MIN_LENGTH=11000

echo "Input FASTA: $INPUT"
echo "Minimum sequence length: ${MIN_LENGTH} nt"
echo "Output FASTA: $OUTPUT"

# Count input sequences
INPUT_COUNT=$(seqkit stats -T "$INPUT" | tail -n 1 | cut -f 4)

echo "Input sequences: $INPUT_COUNT"

# Filter sequences by minimum length
seqkit seq -m "$MIN_LENGTH" "$INPUT" > "$OUTPUT"

# Count filtered sequences
OUTPUT_COUNT=$(seqkit stats -T "$OUTPUT" | tail -n 1 | cut -f 4)

echo "Sequences retained: $OUTPUT_COUNT"

echo "Sequence-length filtering completed successfully."
