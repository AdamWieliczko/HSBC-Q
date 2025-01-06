\l ../WAP/VWAP.q

TWAPDataReader: { [dataPath]
	dataTable: ("PSSSFFJ";enlist csv) 0: dataPath;
	dataTable
 }

TWAP: { [dataTable;currency;minimumTimeRange;maximumTimeRange]
	filteredDataTable: dataTable[where (dataTable[`timestamp] >= minimumTimeRange) & (dataTable[`timestamp] <= maximumTimeRange) & (dataTable[`fx_currency]= (`$currency))];
	
	distinctTimes: distinct ("v"$filteredDataTable[`timestamp]);
	times: 1 _ distinctTimes;
	times: 00:00:01, times - -1 _ distinctTimes;

	$[count distinctTimes > 0;[totalTradesSum: sum times * VWAPWrapper[filteredDataTable;currency;] each distinctTimes];[:0.0]];
	pTWAP: totalTradesSum % "j"$(1 + last distinctTimes - first distinctTimes);
	pTWAP
 }


TWAPMultipleValues: { [dataTable;currency;minimumTimeRange;maximumTimeRange]
	result: TWAP[dataTable;;minimumTimeRange;maximumTimeRange] each currency;
	result
 }