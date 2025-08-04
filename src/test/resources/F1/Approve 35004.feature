Feature: Number 2
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

	Scenario: Compare - <nr>
		Given compare <param1> and <param2>
		When greater
		Then thenGreater <param1> and <param2>
		And again <param1> and <param2>

    @PSCC
    Examples:
        | nr  | param1 | param2 |
        | one   | 5      | 5      |
        | two   | 3      | 5      |
        | three | 3      | 4      |

    Scenario: Compare2 - <nr>
            Given compare <param1> and <param2>
            When greater
            Then thenGreater <param1> and <param2>
            And again <param1> and <param2>

    @PSC
    Examples:
        | nr    | param1 | param2 |
        | one   | 3      | 5      |
        | two   | 7      | 5      |
        | three | 6      | 4      |


	Scenario Outline: Online
		Given all
		When  <param2>
		Then <param1>

    @PS
	Examples:
		| param1 | param2 |
		| 2      | 4      |
		| 1      | 8      |
		| 3      | 2      |
		| 4      | 6      |


