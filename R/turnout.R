#' Turnout (1996 - 2023)
#'
#' View the elector turnout and the informal vote by Electorate and Ballot type
#'
#' @format ## `turnout`
#' A data frame with 1,392 rows and 7 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Ballot}{Ballot: Party Vote, Candidate Vote, or Total (Party + Candidate)}
#'   \item{Electorate}{Name of Electorate}
#'   \item{Electors}{Total number of registered electors}
#'   \item{Turnout}{Turnout (%)}
#'   \item{Total}{Total number of votes cast}
#'   \item{Informal}{Informal vote (Ordinary + Special)}
#'   @examples
#'      turnout
#' }
#' @source <https://www.electionresults.govt.nz/>
"turnout"