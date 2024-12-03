#' Plot Alignment Scores
#'
#' This function generates a bar plot visualization of alignment scores for input sequences against reference sequences.
#'
#' @param results A data frame with columns `Reference_Name` and `Alignment_Score`.
#' @return A ggplot2 object representing the bar plot.
#' @examples
#' results <- data.frame(
#'   Reference_Name = c("Ref1", "Ref2"),
#'   Alignment_Score = c(85, 92)
#' )
#' plot_alignment_scores(results)
#' @export

plot_alignment_scores <- function(results) {
  ggplot(results, aes(x = Reference_Name, y = Alignment_Score)) +
    geom_bar(stat = "identity", fill = "pink") +
    labs(title = "Alignment Scores for Input Sequence", x = "Reference Sequence", y = "Alignment Score") +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      plot.title = element_text(face = "bold", hjust = 0.5)
    )
}
