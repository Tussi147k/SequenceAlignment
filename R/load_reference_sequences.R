#' Load Reference Sequences
#'
#' This function loads reference DNA sequences from multiple FASTA files and standardizes their names.
#'
#' @param file_paths A character vector of file paths to FASTA files containing DNA sequences.
#' @return A `DNAStringSet` object containing the loaded DNA sequences with cleaned headers.
#' @examples
#' file_paths <- c("file1.fasta", "file2.fasta")
#' ref_seqs <- load_reference_sequences(file_paths)
#' print(ref_seqs)
#' @export

load_reference_sequences <- function(file_paths) {
  dna_sequences <- DNAStringSet()  # Create an empty DNAStringSet

  for (file_path in file_paths) {
    # Read sequences from the file
    new_sequences <- readDNAStringSet(filepath = file_path)

    # Clean up headers: Keep only the gene name (e.g., CDKN1A)
    # Regex explanation: match anything up to the first space and extract the gene name
    names(new_sequences) <- gsub(".*\\s([A-Za-z0-9_]+)\\s.*", "\\1", names(new_sequences))

    # Combine the new sequences with the existing ones
    dna_sequences <- c(dna_sequences, new_sequences)
  }

  return(dna_sequences)
}
