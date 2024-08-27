Feature: Number 2
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

	Scenario: Compare
		Given compare <param1> and <param2>
		When greater
		Then thenGreater <param1> and <param2>
		And again

    Examples:
        | param1 | param2 |
        | 6      | 5      |
        | 3      | 4      |
        | 5      | 5      |


	Scenario Outline: Online
		Given all
		When  <param2>
		Then <param1>

	Examples:
		| param1 | param2 |
		| 2      | 4      |
		| 1      | 8      |
		| 3      | 2      |
		| 4      | 6      |


