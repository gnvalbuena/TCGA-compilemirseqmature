# TCGA-compilemirseqmature

A function to generate a data table of mature miRNA counts using isoform quantification data tables (isoforms.quantification.txt) downloaded from The Cancer Genome Atlas (TCGA) via the Genomic Data Commons (GDC). Entries in each table are mapped to mature miRNA names using the provided Accession Numbers (MIMAT...) and collapsed to produce a single total count for each mature miRNA. Count tables for individual samples are then merged to produce a single data table of mature miRNA counts for all samples.

The necessary input for the function `mergeTCGAmaturemirna` is:

1. A table of mature miRNA names and their corresponding accession numbers (MIMAT...), which can be produced from mature.fa downloaded from miRbase using the provided function prep_mirbase_name_table.R (the table must contain columns named maturemirna (containing mature miRNA names) and accession (containing the corresponding accession numbers).
2. A list containing fileIDs for the raw data files. This corresponds to the names of folders containing the isoforms.quantification.txt when these files are downloaded from GDC. In the metadata file that can be downloaded with the isoforms.quantification.txt file, this corresponds to the entry "file_id".
3. A raw data folder containing the isoforms.quantification.txt files in individual folders per file (named with the file_id). This will be the existing folder structure when files are downloaded from GDC.

The function `mergeTCGAmaturemirna` requires the libraries `splitstackshape`, `qdap`, and `plyr`, while `prep_mirbase_name_table` requires the library `Biostrings`.

Set the working directory to the raw data folder, and run the function

```R
maturemirnatable <- mergeTCGAmaturemirna(mirfileIDs, mirbasenames)
```

This will produce a data table of mature miRNA counts for all samples listed, which can then be taken forward to normalization, etc.

Code was adapted from an existing set of scripts in rptashkin/TCGA_miRNASeq_matrix.
