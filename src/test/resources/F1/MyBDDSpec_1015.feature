#Auto generated Octane revision tag
@BSPID1015REV0.2.0
#Auto generated Octane revision tag
@BSPID1001REV0.2.0
@TestToRun
Feature: Standard test for demo
@TSCID7104
	Scenario: Basic script for CI
		Given  The user created a defect
		When  He enters the defect
        And  He edits the description field
		Then  The description is changed
        But  The name is not change