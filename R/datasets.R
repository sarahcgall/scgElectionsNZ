#' Candidate votes for successful registered parties (1996 - 2023)
#'
#' Th `candidate_votes` dataset in a long format allows analysis of candidate votes in each electorate
#' by successful registered parties. Useful for exploring voting patterns and party performance in
#' individual electorates over time. For usage examples, see
#' [Party and Candidate Votes article](https://sarahcgall.github.io/scgElectionsNZ/articles/party-and-candidate-votes).
#' For understanding candidate votes, consult
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#candidate-vote).
#'
#' @format A data frame with 5,349 rows and 6 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Ballot}{Type of ballot (Candidate).}
#'   \item{Electorate}{Name of electorate (e.g., Auckland Central).}
#'   \item{Party}{Name of successful registered party (e.g., ACT Party).}
#'   \item{Votes}{Total valid candidate votes for the party (0--49,510).}
#'   \item{Percentage}{Percentage of total valid candidate votes for the party (0.00--78.06).}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"candidate_votes"

#' Majority (1999 - 2023)
#'
#' The `majority` dataset in a long format is used for identifying winning candidates in each electorate,
#' their party affiliations, and their margins of victory.
#' See [Majority article](https://sarahcgall.github.io/scgElectionsNZ/articles/majority) for use cases.
#' For methodology, refer to 'Candidate Vote' section in
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#candidate-vote).
#'
#' @format A data frame with 696 rows and 7 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Electorate}{Electorate name (e.g., Auckland Central).}
#'   \item{Party}{Winning candidate's party name (e.g., Green Party).}
#'   \item{Candidate}{Winning candidate's name (e.g., SWARBRICK, Chloe Charlotte).}
#'   \item{Votes}{Majority votes: difference in votes between first and second candidates (9--23,376).}
#'   \item{Percentage}{Margin of victory as a percentage: majority votes / total valid votes cast (0.03--72.25).}
#'   \item{Party_List}{Whether candidate is also on the party list (Yes, No).}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"majority"

#' Party Votes (1996 - 2023)
#'
#' The `party_votes` dataset in a long format can be used to look up the party vote
#' in each electorate by registered party. Usage examples in
#' [Party and Candidate Votes article](https://sarahcgall.github.io/scgElectionsNZ/articles/party-and-candidate-votes).
#' For insights into party votes, refer to
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html).
#'
#' @format A data frame with 12,701 rows and 5 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Ballot}{Type of ballot (Party).}
#'   \item{Electorate}{Electorate name (e.g., Auckland Central).}
#'   \item{Party}{Registered party name (e.g., ACT Party).}
#'   \item{Votes}{Total valid party votes for the party (0--27,010).}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"party_votes"

#' Pre-MMP Results (1890 - 1993)
#'
#' The `preMMP_results` dataset in long a format offers historical insights into party results at general elections between 1890 and 1993.
#' This dataset can be used for historical electoral analysis and comparison with the post-MMP era.
#' For usage guidance, see the [Summary article](https://sarahcgall.github.io/scgElectionsNZ/articles/summary).
#'
#' @format A data frame with 162 rows and 4 variables:
#' \describe{
#'   \item{Election}{Year of election (1890--1993).}
#'   \item{Party}{Registered party name (e.g., Liberal).}
#'   \item{Seats}{Number of seats won by the party (0--67).}
#'   \item{Percentage}{Percentage of the popular vote (0--58.7).}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"preMMP_results"

#' Split Electorate (2005 - 2023)
#'
#' The `split_electorate` dataset in a long format provides a detailed view of split voting at the electorate level
#' by party, from 2005 to 2023. Essential for understanding voter behaviour in terms of party and candidate vote divergence.
#' For application examples, refer to the
#' [Split Voting article](https://sarahcgall.github.io/scgElectionsNZ/articles/split-voting).
#' To grasp split voting concepts, see 'Split Voting' section in
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#split-voting).
#'
#' @format A data frame with 81,269 rows and 6 variables:
#' \describe{
#'   \item{Election}{Year of election (2005--2023).}
#'   \item{Electorate}{Electorate name (e.g., Auckland Central).}
#'   \item{List_Party}{Party voted for in the party vote (e.g., 99 MP Party).}
#'   \item{Electorate_Party}{Party voted for in the candidate vote (e.g., ACT Party).}
#'   \item{Votes}{Estimated number of votes flowing from list to electorate parties.}
#'   \item{Percentage}{Percentage of votes flowing from list to electorate parties.}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"split_electorate"

#' Split Total (2005 - 2023)
#'
#' The `split_total` dataset in long format facilitates the analysis of overall split voting trends by party from 2005 to 2023.
#' Ideal for examining national-level voting patterns and the degree of voter alignment between party and candidate preferences.
#' For usage, see [Split Voting article](https://sarahcgall.github.io/scgElectionsNZ/articles/split-voting).
#' Split voting concepts detailed in 'Split Voting' section of
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#split-voting).
#'
#' @format A data frame with 2,435 rows and 5 variables:
#' \describe{
#'   \item{Election}{Year of election (2005--2023).}
#'   \item{List_Party}{Party voted for in the party vote (e.g., 99 MP Party).}
#'   \item{Electorate_Party}{Party voted for in the candidate vote (e.g., ACT Party).}
#'   \item{Votes}{Estimated number of votes flowing from list to electorate parties.}
#'   \item{Percentage}{Percentage of votes flowing from list to electorate parties.}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"split_total"

#' Summary (1996 - 2023)
#'
#' The `summary` dataset offers a comprehensive overview of election results from 1996 to 2023, in a user-friendly long format.
#' This dataset is useful for broad analysis of electoral trends and party performance across different elections.
#' For practical application, see the [Summary article](https://sarahcgall.github.io/scgElectionsNZ/articles/summary).
#'
#' @format A data frame with 909 rows and 9 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Ballot}{Type of ballot (Candidate, Party, Total).}
#'   \item{Party}{Party name (e.g., ACT Party).}
#'   \item{Seats}{Number of seats won by the party (0--65).}
#'   \item{Votes}{Total valid votes for the party.}
#'   \item{Percentage}{Percentage of total valid votes for the party (0.00--50.01).}
#'   \item{Nominated}{Number nominated by party on lists or ballot papers.}
#'   \item{Registered}{If party is registered (Yes, No).}
#'   \item{Successful}{If party achieved the eligibility requirement (Yes, No).}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"summary"

#' Turnout (1996 - 2023)
#'
#' The `turnout` dataset in a long format enables the analysis of elector turnout and informal vote by Electorate and Ballot type from 1996 to 2023.
#' Key for understanding voter participation and the effectiveness of electoral engagement strategies.
#' For application insights, visit the [Turnout article](https://sarahcgall.github.io/scgElectionsNZ/articles/turnout).
#' Turnout concepts explained in 'Turnout' section of
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#turnout).
#'
#' @format A data frame with 1,392 rows and 7 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Ballot}{Type of ballot (Candidate, Party).}
#'   \item{Electorate}{Electorate name (e.g., Auckland Central).}
#'   \item{Electors}{Total number of registered electors.}
#'   \item{Turnout}{Turnout as a percentage of the number of electors.}
#'   \item{Total}{Total number of votes cast - valid and informal.}
#'   \item{Informal}{Total number of informal votes cast.}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"turnout"

#' Turnout (Historic) (1879 - 2023)
#'
#' The `turnout_historic` dataset provides a long-term perspective of elector turnout at general elections from 1879 to 2023.
#' Essential for historical analysis of voter engagement and turnout trends over time.
#' For use case examples, refer to the [Turnout article](https://sarahcgall.github.io/scgElectionsNZ/articles/turnout).
#' Turnout methodology detailed in 'Turnout' section of
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#turnout).
#'
#' @format A data frame with 48 rows and 4 variables:
#' \describe{
#'   \item{Election}{Year of election (1879--2023).}
#'   \item{MPs}{Total number of MPs in parliament.}
#'   \item{Electors}{Total number of registered electors.}
#'   \item{Turnout}{Turnout as a percentage of the number of electors.}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"turnout_historic"

#' Vote Type (1996 - 2023)
#'
#' The `vote_type` dataset in a long format allows for the analysis of vote types (ordinary, special - NZ,
#' special - overseas) by their validity (valid, informal, disallowed) and Electorate and Ballot type.
#' Useful for understanding the distribution of different types of votes.
#' For usage guidance, see the [Vote Type article](https://sarahcgall.github.io/scgElectionsNZ/articles/vote-type).
#' Detailed explanation of voting types in 'Vote Types' section of
#' [NZ Elections Explained](https://sarahcgall.github.io/scgElectionsNZ/articles/nz-elections-explained.html#vote-types).
#'
#' @format A data frame with 11,136 rows and 6 variables:
#' \describe{
#'   \item{Election}{Year of election (1996--2023).}
#'   \item{Ballot}{Type of ballot (Candidate, Party).}
#'   \item{Electorate}{Electorate name (e.g., Auckland Central).}
#'   \item{Validity}{Validity of the vote (Valid, Informal, Disallowed).}
#'   \item{Method}{Method of voting (Ordinary, Special - NZ, Special - Overseas).}
#'   \item{Votes}{Total number of votes cast.}
#' }
#' @source Sourced from the NZ Electoral Commission's official results, available at
#' \url{https://www.electionresults.govt.nz/}.
"vote_type"