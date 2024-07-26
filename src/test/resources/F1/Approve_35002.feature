@exclude
Feature: Feature: Approve

    @exclude
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

	Scenario: Approve2222
		Given numberEven
		When three
		Then three

	Scenario Outline: Online
		Given all
		When  <param2>
		Then <param1>

	Examples:
		| param1 | param2 |
		| 2      | 4      |
		| 3      | 8      |
		| 4      | 2      |
		| 5      | 9      |
		| 6      | 7      |
		| 7      | 6      |
		| 8      | 6      |
