\l ..\WAP\VWAP.q

OneTimestampVWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: VWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 2118.0 % 2700;

    result: VWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "OneTimestampVWAPTest: Completed successfully!"];
	[show "OneTimestampVWAPTest: Failed!"]];
    
    testResult
 }


FewSecondRangeVWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: VWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:44.123456789;

    expectedValue: 8829.0 % 11180;

    result: VWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "FewSecondRangeVWAPTest: Completed successfully!"];
	[show "FewSecondRangeVWAPTest: Failed!"]];
    
    testResult
 }



EmptyDataTableVWAPTest: {
    path: `$":../Data/EmptyTableTrades.csv";
    dataTable: VWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0n;

    result: VWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "EmptyDataTableVWAPTest: Completed successfully!"];
	[show "EmptyDataTableVWAPTest: Failed!"]];
    
    testResult
 }



SmallerStartThanEndVWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: VWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:41.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0n;

    result: VWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "SmallerStartThanEndVWAPTest: Completed successfully!"];
	[show "SmallerStartThanEndVWAPTest: Failed!"]];
    
    testResult
 }


NotExistingCurrencyVWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: VWAPDataReader[path];
    currency: "QQQ/QQQ";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0n;

    result: VWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "NotExistingCurrencyVWAPTest: Completed successfully!"];
	[show "NotExistingCurrencyVWAPTest: Failed!"]];
    
    testResult
 }