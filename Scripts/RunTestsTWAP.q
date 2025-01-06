\l ..\Tests\TWAPTests.q

testOutput: (OneTimestampTWAPTest[];FewSecondRangeTWAPTest[];EmptyDataTableTWAPTest[];
	SmallerStartThanEndTWAPTest[];NotExistingCurrencyTWAPTest[];OneTimestampMultipleValuesTWAPTest[])

$[all testOutput=1b;show "All TWAP tests completed successfully!";show "Some TWAP tests have failed!"]