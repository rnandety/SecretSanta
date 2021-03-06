% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_functions.R
\name{estimate_lim}
\alias{estimate_lim}
\title{estimate_lim}
\usage{
estimate_lim(fasta_chunk, truncate)
}
\arguments{
\item{fasta_chunk}{AAStringSet}

\item{truncate}{truncate or throw away}
}
\value{
truncated AAStringSet
}
\description{
helper function to estimate approximate length threshold if
sequence chunk size exceedes 200000 a.a len limit and truncate long sequences
or throw them away, otherwise signalp will break (signalp2 and signalp3 will)
}
\keyword{internal}
