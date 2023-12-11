#' Vote Type (1996 - 2023)
#'
#' View the vote type (ordinary, special - nz, special - oversease) by validity (informal/valid/disallowed)
#' and Electorate and Ballot type
#'
#' @format ## `vote_type`
#' A data frame with 11,136 rows and 6 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Ballot}{Ballot: Party Vote, Candidate Vote, or Total (Party + Candidate)}
#'   \item{Electorate}{Name of Electorate}
#'   \item{Validity}{Validity: Valid, Informal, or Disallowed}
#'   \item{Vote_Type}{Vote_Type: Ordinary, Special - NZ, or Special - Overseas}
#'   \item{Votes}{Votes (n)}
#'   @examples
#'      vote_type
#' }
#' @source <https://www.electionresults.govt.nz/>
"vote_type"