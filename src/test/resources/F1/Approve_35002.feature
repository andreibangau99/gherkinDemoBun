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
		When  one
		Then fail


