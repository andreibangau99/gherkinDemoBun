Feature: Number 2
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

	Scenario: Compare
		Given greater
		When thenGreater
		Then compare <param1> and <param2>

    Examples:
        | param1 | param2 |
        | 2      | 4      |
        | 1      | 8      |
        | 4      | 6      |


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


