VWAPDataReader: { [dataPath]
	dataTable: ("PSSSFFJ";enlist csv) 0: dataPath;
	dataTable
 }

VWAP: { [dataTable;currency;minimumTimeRange;maximumTimeRange]
	filteredDataTable: dataTable[where (dataTable[`timestamp] >= minimumTimeRange) & (dataTable[`timestamp] <= maximumTimeRange) & (dataTable[`fx_currency]= (`$currency))];
	totalTradesSum: (sum filteredDataTable[`volume] * filteredDataTable[`seller_price] - 0.5 * (filteredDataTable[`seller_price] - filteredDataTable[`buyer_price]));
	pVWAP: totalTradesSum % sum filteredDataTable[`volume];
	pVWAP
 }

VWAPWrapper: { [dataTable;currency;time]
	result: VWAP[dataTable;currency;time;time];
	result
 }