\l ..\Tests\VWAPTests.q

testOutput: (OneTimestampVWAPTest[];FewSecondRangeVWAPTest[];EmptyDataTableVWAPTest[];
	SmallerStartThanEndVWAPTest[];NotExistingCurrencyVWAPTest[]; OneTimestampMultipleValuesVWAPTest[])

$[all testOutput=1b;show "All VWAP tests completed successfully!";show "Some VWAP tests have failed!"]