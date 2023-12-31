% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{turnout}
\alias{turnout}
\title{Turnout (1996 - 2023)}
\format{
A data frame with 1,392 rows and 7 variables:
\describe{
\item{Election}{election year (1996--2023)}
\item{Ballot}{ballot type (Candidate, Party)}
\item{Electorate}{electorate name (e.g., Auckland Central)}
\item{Electors}{total number of registered electors (24,725--59,899)}
\item{Turnout}{turnout as a percentage of the number of electors (1.53--93.49)}
\item{Total}{total number of votes cast - valid and informal (804--50,106)}
\item{Informal}{total number informal votes cast (0--1403))}
}
}
\source{
This dataset was sourced from the NZ Electoral Commission's official results.
The raw data are available from \url{https://www.electionresults.govt.nz/}.
}
\usage{
turnout
}
\description{
The \code{turnout} dataset is in a long format and can be used to view the elector turnout
and the informal vote by Electorate and Ballot type. For an example of how to use this
dataset, refer to the \href{https://sarahcgall.github.io/scgElectionsNZ/articles/turnout}{Turnout article}.
}
\keyword{datasets}
