
Feature: Feature: Approve

	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

    @Approve
	Scenario: Approve2222
		Given numberEven
		When one
		Then three

	Scenario Outline: Online
		Given all
		When  one
		Then fail


