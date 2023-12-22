#' Candidate Votes for Successful Registered Parties (1996 - 2023)
#'
#' This dataset was produced from the NZ Electoral Commission's official results. These data are available
#' from \url{https://www.electionresults.govt.nz/}. `candidate_vote` is in a long format and can be used to look
#' up the candidate vote in each electorate by successful registered party.
#'
#' For an example of how to use this dataset, refer to
#'
#' @format ## `candidate_vote`
#' A data frame with 5,357 rows and 5 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Party}{registered party name (e.g., National Party)}
#'   \item{Votes}{Total valid candidate votes for the party}
#'   \item{Votes}{Percentage of total valid party votes for the party}
#' }
"candidate_votes"

#' Historic Turnout (1879 - 2023)
#'
#' View the elector turnout at each general election between 1879 and 2023
#'
#' @format ## `historic_turnout`
#' A data frame with 48 rows and 4 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{MPs}{Total number of MPs in parliament}
#'   \item{Electors}{Total number of registered electors}
#'   \item{Turnout}{Turnout}
#'   @examples
#'      historic_turnout
#' }
#' @source <https://www.electionresults.govt.nz/>
"historic_turnout"

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

#' Party Votes (1996 - 2023)
#'
#' Look up the party vote in each electorate by registered party.
#'
#' @format ## `party_vote`
#' A data frame with 12,701 rows and 4 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Electorate}{Electorate}
#'   \item{Party}{Registered party name}
#'   \item{Votes}{Total valid party votes for the party}
#'   @examples
#'      party_votes
#' }
#' @source <https://www.electionresults.govt.nz/>
"party_votes"

#' Pre-MMP Results (1890 - 1993)
#'
#' View the results by party at each general election between 1890 and 1993
#'
#' @format ## `preMMP_results`
#' A data frame with 162 rows and 4 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Party}{Registered party name}
#'   \item{Seats}{Number of seats won}
#'   \item{Percentage}{Popular vote (%)}
#'   @examples
#'      preMMP_results
#' }
#' @source <https://www.electionresults.govt.nz/>
"preMMP_results"

#' Split Total (2005 - 2023)
#'
#' View overall split voting by party
#'
#' @format ## `split_total`
#' A data frame with 2,435 rows and 5 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{List_Party}{Party voted for in party vote}
#'   \item{Electorate_Party}{Party voted for in electorate vote}
#'   \item{Votes}{Number of votes for list and electorate parties (n)}
#'   \item{Percentage}{Percentage of votes for list and electorate parties (%)}
#'   @examples
#'      split_total
#' }
#' @source <https://www.electionresults.govt.nz/>
"split_total"

#' Summary (1996 - 2023)
#'
#' View overall results summary data.
#'
#' @format ## `summary`
#' A data frame with 911 rows and 9 columns:
#' \describe{
#'   \item{Election}{Election year}
#'   \item{Ballot}{Ballot: Party Vote, Candidate Vote, or Total (Party + Candidate)}
#'   \item{Party}{Party}
#'   \item{Seats}{Number of seats won by party}
#'   \item{Votes}{Vote (n)}
#'   \item{Percentage}{Vote (%)}
#'   \item{Nominated}{Number nominated by party}
#'   \item{Registered}{Yes/No: if party is registered}
#'   \item{Successful}{Yes/No: if party achieves eligibility}
#'   @examples
#'      summary
#' }
#' @source <https://www.electionresults.govt.nz/>
"summary"

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