#' Save Alignment Results to CSV
#'
#' This function saves a data frame of alignment results to a CSV file.
#'
#' @param results A data frame containing alignment results (e.g., reference names and alignment scores).
#' @param output_file A string representing the path to the output CSV file.
#' @return None (the function is used for its side effect of saving the file).
#' @examples
#' results <- data.frame(
#'   Reference_Name = c("Ref1", "Ref2"),
#'   Alignment_Score = c(85, 92)
#' )
#' save_results_to_csv(results, "alignment_results.csv")
#' @export


save_results_to_csv <- function(results, output_file) {
  write.csv(results, file = output_file, row.names = FALSE)
}

