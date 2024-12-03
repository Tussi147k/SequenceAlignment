#' Analyze Input Sequence
#'
#' This function aligns an input DNA sequence against a set of reference sequences and returns a sorted data frame of alignment scores.
#'
#' @param input_sequence A string representing the input DNA sequence.
#' @param ref_files A character vector of file paths to reference DNA FASTA files.
#' @return A data frame with columns:
#' \item{Reference_Name}{The name of the reference sequence.}
#' \item{Alignment_Score}{The alignment score for the input sequence.}
#' @examples
#' input_sequence <- "ATCGTACG"
#' ref_files <- c("file1.fasta", "file2.fasta")
#' results <- analyze_input_sequence(input_sequence, ref_files)
#' print(results)
#' @export


analyze_input_sequence <- function(input_sequence, ref_files) {
  # Load reference sequences
  reference_seqs <- load_reference_sequences(ref_files)

  # Perform alignment for each reference sequence
  results <- lapply(1:length(reference_seqs), function(i) {
    ref <- reference_seqs[i]  # Access individual sequence
    alignment_info <- perform_alignment(input_sequence, ref)

    # Create a data frame with reference name and alignment score
    data.frame(
      Reference_Name = names(reference_seqs)[i],  # Get the modified name of the reference sequence
      Alignment_Score = alignment_info$score
    )
  })

  # Combine results and sort by alignment score
  result_df <- do.call(rbind, results)
  result_df <- result_df[order(-result_df$Alignment_Score), ]

  return(result_df)
}
