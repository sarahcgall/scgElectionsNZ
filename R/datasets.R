#' Candidate votes for successful registered parties (1996 - 2023)
#'
#' The `candidate_votes` dataset is in a long format and can be used to look up the candidate vote in each
#' electorate by successful registered party. For an example of how to use this dataset, refer
#' to the
#' [Party and Candidate Votes article](https://sarahcgall.github.io/scgElectionsNZ/articles/party-and-candidate-votes).
#'
#' @format A data frame with 5,357 rows and 6 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Ballot}{ballot type (Candidate)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Party}{successful registered party name (e.g., ACT Party)}
#'   \item{Votes}{total valid candidate votes for the party (0--49,510)}
#'   \item{Percentage}{percentage of total valid candidate votes for the party (0.00--78.06)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"candidate_votes"

#' Majority (1999 - 2023)
#'
#' The `majority` dataset is in a long format and can be used to look up the winning
#' candidate in each electorate, their party, and their margin of victory/majority (n & %).
#' For an example of how to use this dataset, refer to the
#' [Majority article](https://sarahcgall.github.io/scgElectionsNZ/articles/majority).
#'
#' @format A data frame with 696 rows and 7 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Party}{name of the winning candidate's party (e.g., Green Party)}
#'   \item{Candidate}{name of the winning candidate (e.g., SWARBRICK, Chloe Charlotte}
#'   \item{Votes}{majority votes: difference in the number of votes between first and second candidate (9--23,376)}
#'   \item{Percentage}{margin of victory as a percentage: majority votes / total valid votes cast (0.03--72.25)}
#'   \item{Party_List}{if candidate is also on the party list (Yes, No)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"majority"

#' Party Votes (1996 - 2023)
#'
#' The `party_votes` dataset is in a long format and can be used to look up the party vote
#' in each electorate by registered party. For an example of how to use this dataset, refer
#' to the
#' [Party and Candidate Votes article](https://sarahcgall.github.io/scgElectionsNZ/articles/party-and-candidate-votes).
#'
#' @format A data frame with 12,701 rows and 5 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Ballot}{ballot type (Party)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Party}{registered party name (e.g., ACT Party)}
#'   \item{Votes}{total valid party votes for the party (0--27,010)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"party_votes"

#' Pre-MMP Results (1890 - 1993)
#'
#' The `preMMP_results` dataset is in a long format and can be used to view the results
#' by party at each general election between 1890 and 1993. For an example of how to use this
#' dataset, refer to the [Summary article](https://sarahcgall.github.io/scgElectionsNZ/articles/summary).
#'
#' @format A data frame with 162 rows and 4 variables:
#' \describe{
#'   \item{Election}{election year (1890--1993)}
#'   \item{Party}{registered party name (e.g., Liberal)}
#'   \item{Seats}{number of seats won by party (0--67)}
#'   \item{Percentage}{percentage of popular vote (0--58.7)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"preMMP_results"

#' Split Electorate (2005 - 2023)
#'
#' The `split_electorate` dataset is in a long format and can be used to view the electorate-level
#' split voting by party. For an example of how to use this dataset, refer
#' to the [Split Voting article](https://sarahcgall.github.io/scgElectionsNZ/articles/split-voting).
#'
#' @format A data frame with 81,269 rows and 6 variables:
#' \describe{
#'   \item{Election}{election year (2005--2023)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{List_Party}{party voted for in party vote (e.g., 99 MP Party)}
#'   \item{Electorate_Party}{party voted for in candidate vote (e.g., ACT Party)}
#'   \item{Votes}{estimated number of votes flowing from list to electorate parties (n)}
#'   \item{Percentage}{percentage of votes flowing from list to electorate parties (%)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"split_electorate"

#' Split Total (2005 - 2023)
#'
#' The `split_total` dataset is in a long format and can be used to view the overall
#' split voting by party. For an example of how to use this dataset, refer
#' to the [Split Voting article](https://sarahcgall.github.io/scgElectionsNZ/articles/split-voting).
#'
#' @format A data frame with 2,435 rows and 5 variables:
#' \describe{
#'   \item{Election}{election year (2005--2023)}
#'   \item{List_Party}{party voted for in party vote (e.g., 99 MP Party)}
#'   \item{Electorate_Party}{party voted for in candidate vote (e.g., ACT Party)}
#'   \item{Votes}{estimated number of votes flowing from list to electorate parties (n)}
#'   \item{Percentage}{percentage of votes flowing from list to electorate parties (%)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"split_total"

#' Summary (1996 - 2023)
#'
#' The `summary` dataset is in a long format and can be used to view overall
#' results summary data. For an example of how to use this dataset, refer
#' to the [Summary article](https://sarahcgall.github.io/scgElectionsNZ/articles/summary).
#'
#' @format A data frame with 909 rows and 9 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Ballot}{ballot type (Candidate, Party, Total (Party + Candidate for Seats or Party only for Vote/Percentage))}
#'   \item{Party}{party name (e.g., ACT Party)}
#'   \item{Seats}{number of seats won by party (0--65)}
#'   \item{Votes}{total valid votes for the party (0--1.44355e+06)}
#'   \item{Percentage}{percentage of total valid votes for the party (0.00--50.01)}
#'   \item{Nominated}{number nominated by party on lists or ballot papers (0--153)}
#'   \item{Registered}{if party is registered (Yes, No)}
#'   \item{Successful}{if party achieved the eligibility requirement (Yes, No)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"summary"

#' Turnout (1996 - 2023)
#'
#' The `turnout` dataset is in a long format and can be used to view the elector turnout
#' and the informal vote by Electorate and Ballot type. For an example of how to use this
#' dataset, refer to the [Turnout article](https://sarahcgall.github.io/scgElectionsNZ/articles/turnout).
#'
#' @format A data frame with 1,392 rows and 7 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Ballot}{ballot type (Candidate, Party)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Electors}{total number of registered electors (24,725--59,899)}
#'   \item{Turnout}{turnout as a percentage of the number of electors (1.53--93.49)}
#'   \item{Total}{total number of votes cast - valid and informal (804--50,106)}
#'   \item{Informal}{total number informal votes cast (0--1403))}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"turnout"

#' Turnout (Historic) (1879 - 2023)
#'
#' The `turnout_historic` dataset is in a long format and can be used to look view the elector turnout at
#' each general election between 1879 and 2023. For an example of how to use this dataset,
#' refer to the [Turnout article](https://sarahcgall.github.io/scgElectionsNZ/articles/turnout)
#'
#' @format A data frame with 48 rows and 4 variables:
#' \describe{
#'   \item{Election}{election year (1879--2023)}
#'   \item{MPs}{total number of MPs in parliament (74--123)}
#'   \item{Electors}{total number of registered electors (82,271--3.68829e+06)}
#'   \item{Turnout}{turnout as a percentage of the number of electors (60.60--93.70)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"turnout_historic"

#' Vote Type (1996 - 2023)
#'
#' The `vote_type` dataset is in a long format and can be used to view the vote type
#' (ordinary, special - nz, special - oversease) by validity (informal/valid/disallowed)
#' and Electorate and Ballot type. For an example of how to use this dataset, refer
#' to the [Vote Type article](https://sarahcgall.github.io/scgElectionsNZ/articles/vote-type).
#'
#' @format A data frame with 11,136 rows and 6 variables:
#' \describe{
#'   \item{Election}{election year (1996--2023)}
#'   \item{Ballot}{ballot type (Candidate, Party)}
#'   \item{Electorate}{electorate name (e.g., Auckland Central)}
#'   \item{Validity}{validity of the vote (Valid, Informal, Disallowed)}
#'   \item{Vote_Type}{type of vote (Ordinary, Special - NZ, Special - Overseas)}
#'   \item{Votes}{total number of votes cast (0--42,496)}
#' }
#' @source This dataset was sourced from the NZ Electoral Commission's official results.
#' The raw data are available from \url{https://www.electionresults.govt.nz/}.
"vote_type"