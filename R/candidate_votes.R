#' Candidate Votes for Successful Registered Parties (1996 - 2023)
#'
#' Look up the candidate vote in each electorate by successful registered party.
#'
#' @format ## `candidate_vote`
#' A data frame with 5,357 rows and 5 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Electorate}{Electorate}
#'   \item{Party}{Registered party name}
#'   \item{Votes}{Total valid candidate votes for the party}
#'   \item{Votes}{Percentage of total valid party votes for the party}
#'   @examples
#'      candidate_votes
#' }
#' @source <https://www.electionresults.govt.nz/>
"candidate_votes"