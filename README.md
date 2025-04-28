# HFT-Market-Data-Parser

Data Processing (data_filter.v):
Parsing: Your data_filter.v module (Step 3, April 26, 2025) likely parses market data packets. This dataset’s CSV format (e.g., 2025-04-27,QQQ,450000000,485.50,15000000) can be processed as ASCII input, similar to the atoi Verilog module I provided for parsing numbers (response to your String to Integer query).
Filtering: Filter rows based on ticker (e.g., only process QQQ) or flow_daily (e.g., flag large inflows > $10M for trading signals).

Arbitrage Detection (arbitrage.v):
NAV-Based Trading: For ETFs, compare nav to the market price (e.g., via NASDAQ real-time feeds) to detect mispricings (e.g., price > nav suggests overvaluation).
Flow Analysis: Large flow_daily values may signal price momentum, triggering trades (e.g., buy on inflows > $10M).

LED Blink Integration (blinker.v):
Use the LED blink module (provided in my previous response) to indicate data processing:
Blink when a valid CSV row is parsed (valid_out = 1 in data_filter).
Blink faster if flow_daily exceeds a threshold (e.g., $10M).


Refernce: 
https://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHspecification.pdf 

https://docs.data.nasdaq.com/docs/getting-started

https://data.nasdaq.com/api/v1/bulkdownloads/FOO/BAR?date.eq=2024-03-20&symbol.eq=ZZYZ
