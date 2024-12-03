#' Perform Pairwise Alignment
#'
#' This function performs local pairwise alignment between an input sequence and a reference sequence.
#'
#' @param input_seq A string representing the input DNA sequence.
#' @param ref_seq A string representing the reference DNA sequence.
#' @return A list containing:
#' \item{score}{The alignment score.}
#' \item{alignment}{The pairwise alignment object.}
#' @examples
#' input_seq <- "ATCG"
#' ref_seq <- "ATGG"
#' result <- perform_alignment(input_seq, ref_seq)
#' print(result$score)
#' @export


perform_alignment <- function(input_seq, ref_seq) {
  alignment <- pwalign::pairwiseAlignment(
    pattern = input_seq,
    subject = ref_seq,
    type = "local",
    substitutionMatrix = pwalign::nucleotideSubstitutionMatrix(match = 5, mismatch = -3),
    gapOpening = -10,
    gapExtension = -1
  )
  return(list(score = score(alignment), alignment = alignment))
}
