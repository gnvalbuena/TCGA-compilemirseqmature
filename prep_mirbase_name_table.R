
### Prepare a table containing miRbase mature mirna

library(Biostrings)

# Read FASTA file containing miRbase entries ("mature.fa" from miRbase website)
maturemirna <- readDNAStringSet(file="mature.fa")

# extract names from miRbase object (extracted as a single character string)
miraccession <- maturemirna@ranges@NAMES

# split character string into component variables
miraccession <- as.data.frame(do.call(rbind, strsplit(miraccession, split=" ", fixed=TRUE)))

# combine genus and species name entries into single variable
species <- paste(miraccession$V3, miraccession$V4, sep=" ")

# assemble data table containing name and accession information from miRbase
miraccession <- data.frame(mirnaID = miraccession$V1, accession = miraccession$V2, species = species, maturemirna=miraccession$V5)

# save mirBase ID table to file
write.csv(miraccession, file = "mirbaseIDs.csv")

# extract entries for human mature miRNA from mirBase ID table
mirbasehuman <- miraccession[miraccession$species=="Homo sapiens",]

# save human mature miRNA ID table to file
write.csv(mirbasehuman, file = "mirbasehuman.csv")