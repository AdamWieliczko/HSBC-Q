\l ..\VectorOfTimes\VectorOfTimes.q

FixedTimeTest: {
    startTime: 20:10:00;
    tValue: startTime + 4;

    expectedPosition: 2;
    expectedVectorCount: 998;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);


    $[testResult;
	[show "FixedTimeTest: Completed successfully!"];
	[show "FixedTimeTest: Failed!"]];
    
    testResult
 }

DynamicTimeTest: {
    startTime: ("v"$.z.z);
    tValue: startTime + 6;

    expectedPosition: 3;
    expectedVectorCount: 997;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);

    $[testResult;
	[show "DynamicTimeTest: Completed successfully!"];
	[show "DynamicTimeTest: Failed!"]];
    
    testResult
 }


TSmallerThanStartingValueTest: {
    startTime: 20:10:00;
    tValue: startTime - 1;

    expectedPosition: 1000;
    expectedVectorCount: 1000;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);

    $[testResult;
	[show "TSmallerThanStartingValueTest: Completed successfully!"];
	[show "TSmallerThanStartingValueTest: Failed!"]];
    
    testResult
 }


TLargerThanBiggestValueTest: {
    startTime: 20:10:00;
    tValue: startTime + 60000;

    expectedPosition: 1000;
    expectedVectorCount: 0;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);

    $[testResult;
	[show "TLargerThanBiggestValueTest: Completed successfully!"];
	[show "TLargerThanBiggestValueTest: Failed!"]];
    
    testResult
 }


TOneSecondLargerThanFirstValueTest: {
    startTime: 20:10:00;
    tValue: startTime + 1;

    expectedPosition: 1000;
    expectedVectorCount: 999;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);

    $[testResult;
	[show "TOneSecondLargerThanFirstValueTest: Completed successfully!"];
	[show "TOneSecondLargerThanFirstValueTest: Failed!"]];
    
    testResult
 }


TOneSecondSmallerThanLastValueTest: {
    startTime: 20:10:00;
    tValue: startTime + 1997;

    expectedPosition: 1000;
    expectedVectorCount: 1;

    results: VectorOfTimes[startTime; tValue];
    position: results[0];
    vectorCount: count results[1];

    testResult: all (expectedPosition=position;expectedVectorCount=vectorCount);

    $[testResult;
	[show "TOneSecondSmallerThanLastValueTest: Completed successfully!"];
	[show "TOneSecondSmallerThanLastValueTest: Failed!"]];
    
    testResult
 }



IsEveryTimeDistancedByTwoSecondsTest: {
    startTime: 20:10:00;
    tValue: startTime + 4;

    results: VectorOfTimes[startTime; tValue];
    listWithoutFirstElement: 1 _ results[1];
    listWithoutLastElement: -1 _ results[1];
    testResult: all listWithoutFirstElement - listWithoutLastElement = 2;

    $[testResult;
	[show "IsEveryTimeDistancedByTwoSecondsTest: Completed successfully!"];
	[show "IsEveryTimeDistancedByTwoSecondsTest: Failed!"]];
    
    testResult
 }