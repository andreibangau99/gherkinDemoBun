Feature: Synchrony delinquent customers making a one-time payment using their payment method

  @SUCCESS @REGRESSION
  Scenario Outline: Make a one-time payment for current date using digital channel- scn_id:s1
	Given an account of type '<accountType>',client '<clientName>', UPCCode3 '<upcCode3>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance|
	  | blank          | greaterThan0  |
	When a payment method with bank account type '<bankAccountType>', bank account number & bank routing number is added using channel 'collectionshub'
	And making a one-time payment with payment amount '<paymentAmount>' and payment date 'currentDate' using channel 'digital-servicing'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount '<paymentAmount>',payment date 'currentDate', created by channel 'collectionshub' should be added in DB
	And Memo is sent successfully when payment scheduled via digital channel
	And Delinquent Memo is sent successfully when payment scheduled via digital channel
	And Email is published successfully when payment scheduled via digital channel
	And Open to buy should be updated
	And Action entry should be updated

	@RC
	Examples:
	  | bankAccountType | paymentAmount     | accountType | clientName | upcCode3| delinquencyDaysLowerLimit| delinquencyDaysUpperLimit |
	  | savings         | statementBalance  | plcc        | amazon     | blank   |30                        | 204                       |
	  | checking        | minimumPaymentDue | dc          | jcpenney   | blank   |30                        | 204                       |
	  | savings         | currentBalance    | brc         | lowes      | blank   |30                        | 204                       |
	  | checking        | otherAmount       | plcc        | amazon     | blank   |30                        | 204                       |
	  | savings         | statementBalance  | plcc        | amazon     | C       |30                        | 145                       |
	  | checking        | minimumPaymentDue | dc          | jcpenney   | C       |30                        | 145                       |
	  | savings         | currentBalance    | brc         | lowes      | C       |30                        | 145                       |
	  | checking        | otherAmount       | plcc        | amazon     | C       |30                        | 145                       |

	@PSCC
	  Examples:
		| bankAccountType | paymentAmount     | accountType | clientName                | upcCode3| delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
		| savings         | statementBalance  | pscc        | Ashley Furniture          | blank   | 30                        | 204                       |
		| checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | blank   | 30                        | 204                       |
		| savings         | currentBalance    | pssc        | Car Care One Total        | blank   | 30                        | 204                       |
		| checking        | otherAmount       | pscc        | Care Credit Dental Dual   | blank   | 30                        | 204                       |
		| savings         | statementBalance  | pscc        | Ashley Furniture          | C       | 30                        | 145                       |
		| checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | C       | 30                        | 145                       |
		| savings         | currentBalance    | pssc        | Car Care One Total        | C       | 30                        | 145                       |
		| checking        | otherAmount       | pscc        | Care Credit Dental Dual   | C       | 30                        | 145                       |

  @SUCCESS @SMOKE @REGRESSION
  Scenario Outline: Make future dated one-time payment using digital channel- scn_id:s2
	Given an account of type '<accountType>',client '<clientName>', UPCCode3 '<upcCode3>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance |
	  | blank          | greaterThan0   |
	When a payment method with bank account type '<bankAccountType>', bank account number & bank routing number is added using channel 'collectionshub'
	And making a one-time payment with payment amount '<paymentAmount>' and payment date '<paymentDate>' using channel 'digital-servicing'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount '<paymentAmount>',payment date '<paymentDate>', created by channel 'collectionshub' should be added in DB
	And Memo is sent successfully when payment scheduled via digital channel
	And Delinquent Memo is sent successfully when payment scheduled via digital channel
	And Email is published successfully when payment scheduled via digital channel
	And Action entry should be updated

	@RC
	Examples:
	  | bankAccountType | paymentAmount     | accountType | clientName | upcCode3 | paymentDate    | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | savings         | statementBalance  | plcc        | amazon     | blank    | 204-delinqDays | 30                        | 204                       |
	  | checking        | minimumPaymentDue | dc          | jcpenney   | blank    | 204-delinqDays | 30                        | 204                       |
	  | savings         | currentBalance    | brc         | lowes      | blank    | 204-delinqDays | 30                        | 204                       |
	  | checking        | otherAmount       | plcc        | amazon     | blank    | 204-delinqDays | 30                        | 204                       |
	  | checking        | minimumPaymentDue | dc          | jcpenney   | blank    | currentDate    | 204                       | 204                       |
	  | savings         | statementBalance  | plcc        | amazon     | C        | 145-delinqDays | 30                        | 145                       |
	  | checking        | minimumPaymentDue | dc          | jcpenney   | C        | 145-delinqDays | 30                        | 145                       |
	  | savings         | currentBalance    | brc         | lowes      | C        | 145-delinqDays | 30                        | 145                       |
	  | checking        | otherAmount       | plcc        | amazon     | C        | 145-delinqDays | 30                        | 145                       |
	  | savings         | statementBalance  | plcc        | amazon     | C        | currentDate    | 145                       | 145                       |


	@PSCC
	  Examples:
		| bankAccountType | paymentAmount     | accountType | clientName                | upcCode3| paymentDate    | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
		| savings         | statementBalance  | pscc        | Ashley Furniture          | blank   | 204-delinqDays | 30                        | 204                       |
		| checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | blank   | 204-delinqDays | 30                        | 204                       |
		| savings         | currentBalance    | pscc        | Car Care One Total        | blank   | 204-delinqDays | 30                        | 204                       |
		| checking        | otherAmount       | pscc        | Care Credit Dental Dual   | blank   | 204-delinqDays | 30                        | 204                       |
		| savings         | statementBalance  | pscc        | Ashley Furniture          | blank   | currentDate    | 204                       | 204                       |
		| savings         | statementBalance  | pscc        | Ashley Furniture          | C       | 145-delinqDays | 30                        | 145                       |
		| checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | C       | 145-delinqDays | 30                        | 145                       |
		| savings         | currentBalance    | pscc        | Car Care One Total        | C       | 145-delinqDays | 30                        | 145                       |
		| checking        | otherAmount       | pscc        | Care Credit Dental Dual   | C       | 145-delinqDays | 30                        | 145                       |
		| checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | C       | currentDate    | 145                       | 145                       |

  @SUCCESS @SMOKE @REGRESSION
  Scenario Outline: Make a one-time payment for current date using paybyphone channel- scn_id:s3
	Given an account of type '<accountType>',client '<clientName>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance |
	  | blank          | greaterThan0   |
	When a one-time payment with payment amount '<paymentAmount>' and payment date 'currentDate'
	And making a one-time payment with bank account type '<bankAccountType>', bank account number & bank routing number in request using channel '<channel>'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount '<paymentAmount>',payment date 'currentDate', created by channel '<channel>' should be added in DB
	And Open to buy should be updated

	@RC
	Examples:
	  | channel | bankAccountType | paymentAmount     | accountType | clientName | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | wkscx   | savings         | statementBalance  | plcc        | amazon     | 30                        | 180                       |
	  | ivrcx   | checking        | minimumPaymentDue | dc          | jcpenney   | 30                        | 180                       |
	  | wkscx   | savings         | currentBalance    | brc         | lowes      | 30                        | 180                       |
	  | ivrcx   | checking        | otherAmount       | plcc        | amazon     | 180                       | 200                       |
	  | ivrcx   | checking        | minimumPaymentDue | dc          | jcpenney   | 180                       | 200                       |
	  | wkscx   | savings         | currentBalance    | brc         | lowes      | 180                       | 200                       |
	  | ivrcx   | checking        | otherAmount       | plcc        | amazon     | 200                       | 206                       |
	  | ivrcx   | checking        | minimumPaymentDue | dc          | jcpenney   | 200                       | 206                       |
	  | wkscx   | savings         | currentBalance    | brc         | lowes      | 200                       | 206                       |

	@PSCC
	  Examples:
		| channel | bankAccountType | paymentAmount     | accountType | clientName                | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
		| wkscx   | savings         | statementBalance  | pscc        | Ashley Furniture          | 30                        | 180                       |
		| ivrcx   | checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | 30                        | 180                       |
		| wkscx   | savings         | currentBalance    | pscc        | Car Care One Total        | 30                        | 180                       |
		| ivrcx   | checking        | otherAmount       | pscc        | Care Credit Dental Dual   | 180                       | 200                       |

  @SUCCESS @REGRESSION
  Scenario Outline: Make future dated one-time payment using paybyphone channel- scn_id:s4
	Given an account of type '<accountType>',client '<clientName>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance |
	  | blank          | greaterThan0   |
	When a one-time payment with payment amount '<paymentAmount>' and payment date '<paymentDate>'
	And making a one-time payment with bank account type '<bankAccountType>', bank account number & bank routing number in request using channel '<channel>'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount '<paymentAmount>',payment date '<paymentDate>', created by channel '<channel>' should be added in DB

	@RC
	Examples:
	  | channel | bankAccountType | paymentAmount     | accountType | clientName | paymentDate    | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | wkscx   | savings         | statementBalance  | plcc        | amazon     | currentDate+1  | 30                        | 180                       |
	  | ivrcx   | checking        | minimumPaymentDue | dc          | jcpenney   | currentDate+23 | 30                        | 180                       |
	  | wkscx   | savings         | currentBalance    | brc         | lowes      | currentDate+1  | 30                        | 180                       |
	  | ivrcx   | checking        | otherAmount       | plcc        | amazon     | currentDate+5  | 180                       | 200                       |
	  | ivrcx   | checking        | minimumPaymentDue | dc          | jcpenney   | currentDate+5  | 180                       | 200                       |
	  | wkscx   | savings         | currentBalance    | brc         | lowes      | currentDate+1  | 180                       | 200                       |

	 @PSCC
	Examples:
	  | channel | bankAccountType | paymentAmount     | accountType | clientName                | paymentDate    | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | wkscx   | savings         | statementBalance  | pscc        | Ashley Furniture          | currentDate+1  | 30                        | 180                       |
	  | ivrcx   | checking        | minimumPaymentDue | pscc        | Care Credit Cosmetic Dual | currentDate+23 | 30                        | 180                       |
	  | wkscx   | savings         | currentBalance    | pscc        | Car Care One Total        | currentDate+1  | 30                        | 180                       |
	  | ivrcx   | checking        | otherAmount       | pscc        | Care Credit Dental Dual   | currentDate+5  | 180                       | 200                       |


  @SUCCESS @SANITY @REGRESSION
  Scenario Outline: Make a one-time payment for current date when account is delinquent greater than equal to 206 days using digital channel- scn_id:s5
	  Given an account of type '<accountType>',client '<clientName>', UPCCode3 '<upcCode3>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance |
	  | blank          | greaterThan0   |
	When a payment method with bank account type '<bankAccountType>', bank account number & bank routing number is added using channel 'collectionshub'
	And making a one-time payment with payment amount 'currentBalance' and payment date 'currentDate' for settlement
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount 'currentBalance',payment date 'currentDate', created by channel 'collectionshub' should be added in DB
	And Memo is sent successfully when payment scheduled via digital channel
	And Delinquent Memo is sent successfully when payment scheduled via digital channel
	And Email is published successfully when payment scheduled via digital channel
	And Open to buy should be updated
	And Action entry should be updated

	@RC
	Examples:
	  | bankAccountType | accountType | clientName | upcCode3| delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | savings         | plcc        | amazon     | blank   | 206                       | greaterThan206            |
	  | checking        | dc          | jcpenney   | blank   | 206                       | greaterThan206            |
	  | savings         | brc         | lowes      | blank   | 206                       | greaterThan206            |
	  | savings         | plcc        | amazon     | C       | 145                       | greaterThan145            |
	  | checking        | dc          | jcpenney   | C       | 145                       | greaterThan145            |
	  | savings         | brc         | lowes      | C       | 145                       | greaterThan145            |

	@PSCC
	  Examples:
		| bankAccountType | accountType | clientName                | upcCode3| delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
		| savings         | pscc        | Ashley Furniture          | blank   | 206                       | greaterThan206            |
		| checking        | pscc        | Care Credit Cosmetic Dual | blank   | 206                       | greaterThan206            |
		| savings         | pscc        | Car Care One Total        | blank   | 206                       | greaterThan206            |
		| savings         | pscc        | Care Credit Dental Dual   | blank   | 206                       | greaterThan206            |
		| savings         | pscc        | Ashley Furniture          | C       | 145                       | greaterThan145            |
		| checking        | pscc        | Care Credit Cosmetic Dual | C       | 145                       | greaterThan145            |
		| savings         | pscc        | Car Care One Total        | C       | 145                       | greaterThan145            |
		| savings         | pscc        | Care Credit Dental Dual   | C       | 145                       | greaterThan145            |

  @SUCCESS @SANITY @REGRESSION
  Scenario Outline: Make a future dated one-time payment when account is delinquent greater than equal to 206 days using digital channel- scn_id:s6
	  Given an account of type '<accountType>',client '<clientName>', UPCCode3 '<upcCode3>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance|
	  | blank          | greaterThan0  |
	When a payment method with bank account type '<bankAccountType>', bank account number & bank routing number is added using channel 'collectionshub'
	And making a one-time payment with payment amount 'currentBalance' and payment date '<paymentDate>' for settlement
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount 'currentBalance',payment date 'currentDate', created by channel 'collectionshub' should be added in DB
	And Memo is sent successfully when payment scheduled via digital channel
	And Delinquent Memo is sent successfully when payment scheduled via digital channel
	And Email is published successfully when payment scheduled via digital channel
	And Action entry should be updated

	@RC
	Examples:
	  | bankAccountType | accountType | clientName | upcCode3| paymentDate     | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | savings         | plcc        | amazon     | blank   | currentDate+1   | 206                       | greaterThan206            |
	  | checking        | dc          | jcpenney   | blank   | currentDate+365 | 206                       | greaterThan206            |
	  | savings         | brc         | lowes      | blank   | currentDate+1   | 206                       | greaterThan206            |
	  | savings         | plcc        | amazon     | C       | currentDate+1   | 145                       | greaterThan145            |
	  | checking        | dc          | jcpenney   | C       | currentDate+365 | 145                       | greaterThan145            |
	  | savings         | brc         | lowes      | C       | currentDate+1   | 145                       | greaterThan145            |

	@PSCC
	Examples:
	  | bankAccountType | accountType | clientName                | upcCode3| paymentDate     | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit |
	  | savings         | pscc        | Ashley Furniture          | blank   | currentDate+1   | 206                       | greaterThan206            |
	  | checking        | pscc        | Care Credit Cosmetic Dual | blank   | currentDate+365 | 206                       | greaterThan206            |
	  | savings         | pscc        | Car Care One Total        | blank   | currentDate+1   | 206                       | greaterThan206            |
	  | savings         | pscc        | Care Credit Dental Dual   | blank   | currentDate+1   | 206                       | greaterThan206            |
	  | savings         | pscc        | Ashley Furniture          | C       | currentDate+1   | 145                       | greaterThan145            |
	  | checking        | pscc        | Care Credit Cosmetic Dual | C       | currentDate+365 | 145                       | greaterThan145            |
	  | savings         | pscc        | Car Care One Total        | C       | currentDate+1   | 145                       | greaterThan145            |
	  | savings         | pscc        | Care Credit Dental Dual   | C       | currentDate+1   | 145                       | greaterThan145            |


  @SUCCESS @SANITY @REGRESSION
  Scenario Outline: Make a one-time payment for current date when account is delinquent greater than equal to 206 days using paybyphone channel- scn_id:s7
	Given an account of type '<accountType>' and client '<clientName>' with account conditions
	  | delinquencyDays      | externalStatus | currentBalance|
	  | greaterThanEquals206 | blank          | greaterThan0  |
	When a one-time payment with payment amount 'currentBalance' and payment date 'currentDate' for settlement
	And making a one-time payment with bank account type '<bankAccountType>', bank account number & bank routing number in request using channel '<channel>'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount 'currentBalance',payment date 'currentDate', created by channel '<channel>' should be added in DB
	And Open to buy should be updated

	@RC
	Examples:
	  | channel | bankAccountType | accountType | clientName |
	  | wkscx   | savings         | plcc        | amazon     |
	  | ivrcx   | checking        | dc          | jcpenney   |
	  | wkscx   | savings         | brc         | lowes      |

	@PSCC
	  Examples:
		| channel | bankAccountType | accountType | clientName                |
		| wkscx   | savings         | pscc        | Ashley Furniture          |
		| ivrcx   | checking        | pscc        | Care Credit Cosmetic Dual |
		| wkscx   | savings         | pscc        | Car Care One Total        |
		| wkscx   | savings         | pscc        | Care Credit Dental Dual   |


  @SUCCESS @SANITY @REGRESSION
  Scenario Outline: Make a future dated one-time payment when account is delinquent greater than equal to 206 days using paybyphone channel- scn_id:s8
	Given an account of type '<accountType>' and client '<clientName>' with account conditions
	  | delinquencyDays 		 | externalStatus | currentBalance|
	  | greaterThanEquals206 | blank          | greaterThan0  |
	When a one-time payment with payment amount 'currentBalance' and payment date '<paymentDate>' for settlement
	And making a one-time payment with bank account type '<bankAccountType>', bank account number & bank routing number in request using channel '<channel>'
	Then API response code should be '201' with payment confirmation number in response
	And payment confirmation number should be added in DB with payment status scheduled
	And payment amount 'currentBalance',payment date 'currentDate', created by channel '<channel>' should be added in DB

	@RC
	Examples:
	  | channel | bankAccountType | accountType | clientName | paymentDate     |
	  | wkscx   | savings         | plcc        | amazon     | currentDate+1   |
	  | ivrcx   | checking        | dc          | jcpenney   | currentDate+365 |
	  | wkscx   | savings         | brc         | lowes      | currentDate+1   |

	@PSCC
	  Examples:
		| channel | bankAccountType | accountType | clientName                | paymentDate     |
		| wkscx   | savings         | pscc        | Ashley Furniture          | currentDate+1   |
		| ivrcx   | checking        | pscc        | Care Credit Cosmetic Dual | currentDate+365 |
		| wkscx   | savings         | pscc        | Car Care One Total        | currentDate+1   |
		| wkscx   | savings         | pscc        | Care Credit Dental Dual   | currentDate+1   |

  @@ERROR @SANITY @REGRESSION
  Scenario Outline: Make one-time payment with payment date greater than allowed payment date range when account is delinquent using paybyphone channel- scn_id:s9
	Given an account of type '<accountType>',client '<clientName>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance|
	  | blank          | greaterThan0  |
	When a one-time payment with payment amount 'currentBalance' and payment date '<paymentDate>'
	And making a one-time payment with bank account type '<bankAccountType>', bank account number & bank routing number in request using channel '<channel>'
	Then API response code should be '422' with error code and error message

	@RC
	Examples:
	  | accountType | clientName | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit | paymentDate    | channel | bankAccountType |
	  | dc          | jcpenney   | 30                        | 180                       | currentDate+25 | wkscx   | savings         |
	  | plcc        | amazon     | 180                       | 200                       | currentDate+7  | ivrcx   | checking        |
	  | brc         | lowes      | 200                       | 206                       | currentDate+2  | wkscx   | savings         |
	  | plcc        | amazon     | 206                       | greaterThan206            | currentDate+1  | wkscx   | checking        |

	@PSCC
	  Examples:
		| accountType | clientName                | delinquencyDaysLowerLimit | delinquencyDaysUpperLimit | paymentDate    | channel | bankAccountType |
		| pscc        | Ashley Furniture          | 30                        | 180                       | currentDate+25 | wkscx   | savings         |
		| pscc        | Care Credit Cosmetic Dual | 180                       | 200                       | currentDate+7  | ivrcx   | checking        |
		| pscc        | Car Care One Total        | 200                       | 206                       | currentDate+2  | wkscx   | savings         |
		| pscc        | Care Credit Dental Dual   | 206                       | greaterThan206            | currentDate+1  | wkscx   | checking        |


  @ERROR @REGRESSION
  Scenario Outline: Make one-time payment with payment date greater than allowed payment date range when account is delinquent using digital channel- scn_id:s10
	Given an account of type '<accountType>',client '<clientName>', UPCCode3 '<upcCode3>' and delinquent between '<delinquencyDaysLowerLimit>' '<delinquencyDaysUpperLimit>' days with account conditions
	  | externalStatus | currentBalance |
	  | blank          | greaterThan0   |
	When a payment method with bank account type '<bankAccountType>', bank account number & bank routing number is added using channel 'collectionshub'
	And making a one-time payment with payment amount 'otherAmount' and payment date '<paymentDate>' using channel 'digital-servicing'
	Then API response code should be '422' with error code and error message

	@RC
	Examples:
	  | accountType | clientName | upcCode3|delinquencyDaysLowerLimit | delinquencyDaysUpperLimit | paymentDate    | bankAccountType |
	  | dc          | jcpenney   | blank   |30                        | 204                       | 204+delinqDays | savings         |
	  | plcc        | amazon     | blank   |206                       | greaterThan206            | 204+CurrentDate| checking        |
	  | dc          | jcpenney   | C       |30                        | 145                       | 145+delinqDays | savings         |
	  | plcc        | amazon     | C       |145                       | greaterThan145            | 145+delinqDays | checking        |


	@PSCC
	Examples:
	  | accountType | clientName                | upcCode3| delinquencyDaysLowerLimit | delinquencyDaysUpperLimit | paymentDate     | bankAccountType |
	  | pscc        | Ashley Furniture          | blank   | 30                        | 204                       | 204+delinqDays  | savings         |
	  | pscc        | Care Credit Cosmetic Dual | blank	  | 30                        | 204                       | 204+delinqDays  | checking        |
	  | pscc        | Car Care One Total        | blank   | 30                        | 204                       | 204+delinqDays  | savings         |
	  | pscc        | Care Credit Dental Dual   | blank   | 206                       | greaterThan206            | 204+delinqDays  | checking        |
	  | pscc        | Ashley Furniture          | C       | 30                        | 145                       | 145+delinqDays  | savings         |
	  | pscc        | Care Credit Cosmetic Dual | C	      | 30                        | 145                       | 145+delinqDays  | checking        |
	  | pscc        | Car Care One Total        | C       | 30                        | 145                       | 145+delinqDays  | savings         |
	  | pscc        | Care Credit Dental Dual   | C       | 145                       | greaterThan145            | 145+delinqDays  | checking        |