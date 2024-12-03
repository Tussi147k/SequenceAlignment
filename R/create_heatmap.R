#' Create Heatmap of Alignment Scores
#'
#' This function generates a heatmap visualization of alignment scores for input sequences against reference sequences.
#'
#' @param results A data frame with columns `Reference_Name` and `Alignment_Score`.
#' @return A ggplot2 object representing the heatmap.
#' @examples
#' results <- data.frame(
#'   Reference_Name = c("Ref1", "Ref2"),
#'   Alignment_Score = c(85, 92)
#' )
#' create_heatmap(results)
#' @export

create_heatmap <- function(results) {
  # Reshape the data into long format for ggplot2
  results_long <- data.frame(
    Reference_Name = rep(results$Reference_Name, each = 1),
    Alignment_Score = results$Alignment_Score
  )

  # Plot the heatmap using ggplot2
  ggplot(results_long, aes(x = Reference_Name, y = 1, fill = Alignment_Score)) +
    geom_tile() +
    scale_fill_gradient(low = "maroon", high = "red") +
    labs(title = "Heatmap of Alignment Scores", x = "Reference Sequence", y = "") +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      plot.title = element_text(face = "bold", hjust = 0.5)
    )
}
