\l ..\Tests\VectorOfTimesTests.q

testOutput: (FixedTimeTest[];DynamicTimeTest[];
	TSmallerThanStartingValueTest[];TLargerThanBiggestValueTest[];
	TOneSecondLargerThanFirstValueTest[];TOneSecondSmallerThanLastValueTest[];
	IsEveryTimeDistancedByTwoSecondsTest[])

$[all testOutput=1b;show "All VectorOfTimes tests completed successfully!";show "Some VectorOfTimes tests have failed!"]