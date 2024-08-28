Feature: Number 2

	Scenario: Compare - <nr>
		Given compare <param1> and <param2>
		When greater
		Then thenGreater <param1> and <param2>
		And again <param1> and <param2>

    Examples:
        | nr  | param1 | param2 |
        | one   | 6      | 4      |
        | two   | 4      | 4      |
        | three | 3      | 4      |



