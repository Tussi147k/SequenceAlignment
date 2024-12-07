% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_results_to_csv.R
\name{save_results_to_csv}
\alias{save_results_to_csv}
\title{Save Alignment Results to CSV}
\usage{
save_results_to_csv(results, output_file)
}
\arguments{
\item{results}{A data frame containing alignment results (e.g., reference names and alignment scores).}

\item{output_file}{A string representing the path to the output CSV file.}
}
\value{
None (the function is used for its side effect of saving the file).
}
\description{
This function saves a data frame of alignment results to a CSV file.
}
\examples{
results <- data.frame(
  Reference_Name = c("Ref1", "Ref2"),
  Alignment_Score = c(85, 92)
)
save_results_to_csv(results, "alignment_results.csv")
}
