% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{summary}
\alias{summary}
\title{Summary (1996 - 2023)}
\format{
A data frame with 909 rows and 9 variables:
\describe{
\item{Election}{Year of election (1996--2023).}
\item{Ballot}{Type of ballot (Candidate, Party, Total).}
\item{Party}{Party name (e.g., ACT Party).}
\item{Seats}{Number of seats won by the party (0--65).}
\item{Votes}{Total valid votes for the party.}
\item{Percentage}{Percentage of total valid votes for the party (0.00--50.01).}
\item{Nominated}{Number nominated by party on lists or ballot papers.}
\item{Registered}{If party is registered (Yes, No).}
\item{Successful}{If party achieved the eligibility requirement (Yes, No).}
}
}
\source{
Sourced from the NZ Electoral Commission's official results, available at
\url{https://www.electionresults.govt.nz/}.
}
\usage{
summary
}
\description{
The \code{summary} dataset offers a comprehensive overview of election results from 1996 to 2023, in a user-friendly long format.
This dataset is useful for broad analysis of electoral trends and party performance across different elections.
For practical application, see the \href{https://sarahcgall.github.io/scgElectionsNZ/articles/summary}{Summary article}.
}
\keyword{datasets}
