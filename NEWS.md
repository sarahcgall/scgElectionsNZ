# scgElectionsNZ (development version 0.0.1)

This is the initial release. It contains the following datasets:

| Column Name            | `summary` | `turnout` | `vote_type` | `party_votes`<sup>1</sup> | `candidate_votes` | `majority` | `split_total`<sup>1</sup> | `preMMP_results` | `historic_turnout` |
|:-----------------------|:---------:|:---------:|:-----------:|:-------------------------:|:-----------------:|:----------:|:-------------------------:|:----------------:|:------------------:|
| Election               | &#10004;  | &#10004;  |  &#10004;   |         &#10004;          |     &#10004;      |  &#10004;  |         &#10004;          |     &#10004;     |      &#10004;      |
| Ballot<sup>2</sup>     | &#10004;  | &#10004;  |  &#10004;   |         &#10004;          |     &#10004;      |            |                           |                  |                    |
| MPs                    |           |           |             |                           |                   |            |                           |                  |      &#10004;      |
| Electorate             |           | &#10004;  |  &#10004;   |         &#10004;          |     &#10004;      |  &#10004;  |         &#10004;          |                  |                    |
| Electors               |           | &#10004;  |             |                           |                   |            |                           |                  |      &#10004;      |
| Turnout                |           | &#10004;  |             |                           |                   |            |                           |                  |      &#10004;      |
| Total<sup>3</sup>      |           | &#10004;  |             |                           |                   |            |                           |                  |                    |
| Informal               |           | &#10004;  |             |                           |                   |            |                           |                  |                    |
| Validity               |           |           |  &#10004;   |                           |                   |            |                           |                  |                    |
| Vote_Type              |           |           |  &#10004;   |                           |                   |            |                           |                  |                    |
| Party                  | &#10004;  |           |             |         &#10004;          |     &#10004;      |  &#10004;  |                           |     &#10004;     |                    |
| List_Party             |           |           |             |                           |                   |            |         &#10004;          |                  |                    |
| Electorate_Party       |           |           |             |                           |                   |            |         &#10004;          |                  |                    |
| Candidate<sup>4</sup>  |           |           |             |                           |                   |  &#10004;  |                           |                  |                    |
| Seats                  | &#10004;  |           |             |                           |                   |            |                           |     &#10004;     |                    |
| Votes                  | &#10004;  |           |  &#10004;   |         &#10004;          |     &#10004;      |            |         &#10004;          |                  |                    |
| Percentage             | &#10004;  |           |             |                           |     &#10004;      |            |         &#10004;          |     &#10004;     |                    |
| Party_List<sup>5</sup> |           |           |             |                           |                   |  &#10004;  |                           |                  |                    |
| Nominated<sup>6</sup>  | &#10004;  |           |             |                           |                   |            |                           |                  |                    |
| Registered<sup>7</sup> | &#10004;  |           |             |                           |                   |            |                           |                  |                    |
| Successful<sup>8</sup> | &#10004;  |           |             |                           |                   |            |                           |                  |                    |

1 Dataset includes Informal Votes under Party column.<br>
2 Ballot includes "Party", "Candidate", or "Total" (Party + Candidate for Seats or Party only for Vote/Percentage).<br>
3 Total refers to the total number of votes cast (Valid + Informal).<br>
4 Candidate column contains the name of the winning candidate for that electorate.<br>
5 Party_List column contains Yes or No values and refers to whether the candidate running in the electorate is also on the Party List.<br>
6 Nominated column refers to the number of candidates nominated as electorate candidates or the number on a party list depending on Vote_Type.<br>
7 Registered column contains Yes or No values and refers to whether the party is a registered party with a list or an unregistered party without a list.<br>
8 Successful column contains Yes or No values and refers to whether or not a party achieved the 5% Party_Vote threshold or won at least one electorate.<br>
