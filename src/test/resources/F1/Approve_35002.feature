#Auto generated Octane revision tag
@BSPID1001REV0.4.0
@ADD_NEW_TAG
Feature: Feature: Approve

@TSCID1001
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

@TSCID1002
	Scenario: Approve2222
		Given numberEven
		When three
		Then three

@TSCID1003
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
