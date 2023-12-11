#' Majority (1999 - 2023)
#'
#' Look up the winning candidate in each electorate, their party, and their margin of victory/majority (n & %).
#'
#' @format ## `majority`
#' A data frame with 695 rows and 8 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Electorate}{Electorate}
#'   \item{Party}{Winning candidate's party}
#'   \item{Candidate}{Winning candidate's name}
#'   \item{Votes}{Majority: difference in the number of votes between first and second candidate}
#'   \item{Percentage}{Percentage: Majority / Votes = Margin of Victory (%)}
#'   \item{Party_List}{Yes/No if candidate is also on the party list}
#'   @examples
#'      majority
#' }
#' @source <https://www.electionresults.govt.nz/>
"majority"