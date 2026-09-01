#!/bin/bash

#SBATCH --job-name=chikv_beast
#SBATCH --output=beast.out
#SBATCH --error=beast.err
#SBATCH --time=500:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G

module load java/17

export _JAVA_OPTIONS="-Xmx28g"

cd $SLURM_SUBMIT_DIR

beast -threads 16 beauti_24-04-2026_verified.xml
