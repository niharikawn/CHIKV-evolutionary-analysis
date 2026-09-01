#!/usr/bin/env python3

"""
CHIKV Metadata Filtering

Purpose:
    Filter CHIKV sequence metadata according to the criteria
    required for downstream evolutionary analysis.

Filtering steps:
    1. Remove records without a collection date
    2. Keep sequences collected after 2015
    3. Remove passaged isolates
    4. Retain records with complete essential metadata

Input:
    Metadata table in CSV format

Output:
    Curated metadata table in CSV format
"""

import pandas as pd
import argparse


def filter_metadata(input_file, output_file):
    """Filter CHIKV metadata for downstream analysis."""

    # Load metadata
    metadata = pd.read_csv(input_file)

    print(f"Initial number of records: {len(metadata)}")

    # ---------------------------------------------------------
    # 1. Remove records without collection dates
    # ---------------------------------------------------------

    metadata["Collection Date"] = pd.to_datetime(
        metadata["Collection Date"],
        errors="coerce"
    )

    metadata = metadata.dropna(subset=["Collection Date"])

    print(
        f"After collection-date filtering: {len(metadata)}"
    )

    # ---------------------------------------------------------
    # 2. Keep sequences collected after 2015
    # ---------------------------------------------------------

    metadata = metadata[
        metadata["Collection Date"].dt.year >= 2015
    ]

    print(
        f"After temporal filtering: {len(metadata)}"
    )

    # ---------------------------------------------------------
    # 3. Remove passaged isolates
    # ---------------------------------------------------------

    if "Passage" in metadata.columns:

        metadata = metadata[
            metadata["Passage"]
            .fillna("")
            .astype(str)
            .str.strip()
            .eq("")
        ]

    print(
        f"After removing passaged isolates: {len(metadata)}"
    )

    # ---------------------------------------------------------
    # 4. Save curated metadata
    # ---------------------------------------------------------

    metadata.to_csv(output_file, index=False)

    print(
        f"Curated metadata saved to: {output_file}"
    )


def main():

    parser = argparse.ArgumentParser(
        description="Filter CHIKV metadata for evolutionary analysis."
    )

    parser.add_argument(
        "-i",
        "--input",
        required=True,
        help="Input metadata CSV file"
    )

    parser.add_argument(
        "-o",
        "--output",
        required=True,
        help="Output curated metadata CSV file"
    )

    args = parser.parse_args()

    filter_metadata(
        args.input,
        args.output
    )


if __name__ == "__main__":
    main()
