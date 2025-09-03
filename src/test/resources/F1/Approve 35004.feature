#Auto generated Octane revision tag
Feature: Number 22
	Scenario: numberStatus
		Given numberOdd
		When one
		Then one

    @MyTag
	Scenario: Compare2 - <nr>
		Given compare <param1> and <param2>
		When greater
		Then thenGreater <param1> and <param2>
		And again <param1> and <param2>

    @MyTag @ExampleTag1
    Examples:
        | nr  | param1 | param2 |
        | one   | 5      | 5      |
        | two   | 3      | 5      |
        | three | 3      | 4      |

    @MyTag @ExampleTag2
    Examples:
        | nr    | param1 | param2 |
        | one   | 3      | 5      |
        | two   | 7      | 5      |
        | three | 6      | 4      |

    Scenario: Compare22 - <nr>
            Given compare <param1> and <param2>
            When greater
            Then thenGreater <param1> and <param2>
            And again <param1> and <param2>

    @MyTag @Excluded
    Examples:
        | nr    | param1 | param2 |
        | one   | 3      | 5      |
        | two   | 7      | 5      |
        | three | 6      | 4      |

