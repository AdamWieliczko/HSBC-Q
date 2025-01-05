\l ..\WAP\TWAP.q

OneTimestampTWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: TWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 2118.0 % 2700;

    result: TWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "OneTimestampTWAPTest: Completed successfully!"];
	[show "OneTimestampTWAPTest: Failed!"]];
    
    testResult
 }


FewSecondRangeTWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: TWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:44.123456789;

    expectedValue: 0.2 * (2118.0 % 2700)+(1882.0 % 2400)+(1708.0 % 2150)+(1628.0 % 2050)+(1493.0 % 1880);

    result: TWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "FewSecondRangeTWAPTest: Completed successfully!"];
	[show "FewSecondRangeTWAPTest: Failed!"]];
    
    testResult
 }



EmptyDataTableTWAPTest: {
    path: `$":../Data/EmptyTableTrades.csv";
    dataTable: TWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0.0;

    result: TWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "EmptyDataTableTWAPTest: Completed successfully!"];
	[show "EmptyDataTableTWAPTest: Failed!"]];
    
    testResult
 }



SmallerStartThanEndTWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: TWAPDataReader[path];
    currency: "PLN/EUR";
    startTime: 2034.11.22D17:43:41.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0.0;

    result: TWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "SmallerStartThanEndTWAPTest: Completed successfully!"];
	[show "SmallerStartThanEndTWAPTest: Failed!"]];
    
    testResult
 }


NotExistingCurrencyTWAPTest: {
    path: `$":../Data/Trades.csv";
    dataTable: TWAPDataReader[path];
    currency: "QQQ/QQQ";
    startTime: 2034.11.22D17:43:40.123456789;
    endTime: 2034.11.22D17:43:40.123456789;

    expectedValue: 0.0;

    result: TWAP[dataTable;currency;startTime;endTime];

    testResult: result=expectedValue;


    $[testResult;
	[show "NotExistingCurrencyTWAPTest: Completed successfully!"];
	[show "NotExistingCurrencyTWAPTest: Failed!"]];
    
    testResult
 }