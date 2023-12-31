% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{party_votes}
\alias{party_votes}
\title{Party Votes (1996 - 2023)}
\format{
A data frame with 12,701 rows and 5 variables:
\describe{
\item{Election}{election year (1996--2023)}
\item{Ballot}{ballot type (Party)}
\item{Electorate}{electorate name (e.g., Auckland Central)}
\item{Party}{registered party name (e.g., ACT Party)}
\item{Votes}{total valid party votes for the party (0--27,010)}
}
}
\source{
This dataset was sourced from the NZ Electoral Commission's official results.
The raw data are available from \url{https://www.electionresults.govt.nz/}.
}
\usage{
party_votes
}
\description{
The \code{party_votes} dataset is in a long format and can be used to look up the party vote
in each electorate by registered party. For an example of how to use this dataset, refer
to the
\href{https://sarahcgall.github.io/scgElectionsNZ/articles/party-and-candidate-votes}{Party and Candidate Votes article}.
}
\keyword{datasets}
