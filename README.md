## HSBC Exercises
This repository contains my implementation of problems provided in email. I'll give a brief description about every folder and how to use this repository.

### How to use
First of all you need to have Q/KDB installed on your computer. If you don't have it I recommend downloading it from this [site](https://code.kx.com/q/) according to given tutorial.

When you have all prerequisites, just run any needed script from ``scripts`` folder. To run it simply use Q command 
```docker
\l <directory>/<filename>.q
```
Where \l is `load` in Q terminology and will start script, `<directory>` is place where you should put path to script (this is optional if you are already in folder containing script) and `<filename>` is position where you should insert name of script.

### Description of folders

#### Scripts
This folder contains four load and three test scripts. It is created to make this whole compontent kind of blackbox - user don't have to look for anything inside other folders because scripts alone load anything that's needed.

As name suggests load scripts only load given functions so you can use them in your code. You can load TWAP, VWAP or VectorOfTimes (with dynamic time as default or with current time marked as "CurrentTime").

Tests scrips on the other hand access ``Tests`` folder that contains tests. When you run test script you of course also load needed functions for test purposes. Tests cover TWAP, VWAP and VectorOfTimes.

#### Data
The folder contains two CSV files - Trades.csv and EmptyTableTrades.csv. These are manually created files where I attempted to simulate sample data reflecting slight market fluctuations. In along with randomly named individuals but the names are purely for aesthetic purposes - only to better represent transactions between two parties where one person buys a specific quantity, and the other sells. These names are not used in any functional way within the code.

Representation of the CSV format I used:

|timestamp                    |fx_currency|buyer_username|seller_username|buyer_price|seller_price|volume|
|-----------------------------|-----------|--------------|---------------|-----------|------------|------|
|2034.11.22D17:43:40.123456789|PLN/EUR    |JohnForex     |JacekArkaniusz |0.78       |0.80        |1200  |
|.............................|...........|..............|...............|...........|............|......|

#### Tests
In this folder are located tests for TWAP, VWAP or VectorOfTimes.

Tests are handmade with simple overall idea of [Arrange, Act, Assert](https://medium.com/@pjbgf/title-testing-code-ocd-and-the-aaa-pattern-df453975ab80). Every test have simple output for user to easly check which test failed and which passed correctly.

#### VectorOfTimes
This folder stores two implementation for VectorOfTimes - one is implementation with input as time and second one (named "Version2") is essentially one suggested in email. 

First one is created mostly for better testing purposes, it's the same as second one but with dynamic input we can check how code works in current structure. 
There is also test for current time so it won't be a problem in terms of slightly different approach.


#### WAP
In WAP folder I made VWAP (Volume-weighted average price) and TWAP (Time-weighted average price) implementation. Each file contains responsible main method and data reader. VWAP and TWAP are by default made for one currency value at a time but for list usage I made `VWAPMultipleValues` and `TWAPMultipleValues` which supports multiple currencies and returns list of results for each one.

Inside `VWAP.q` you can also wrapper which is made for TWAP purpose - in Wikipedia definition we can find that Pj ``is the price of security at a time of measurement`` so I figured out that I can use created VWAP method for calculating this price from Trades.csv at given timestamp. Wrapper is mostly for better visibility on calling VWAP function that starts and ends on the same time.

I'll give a brief explanation of how to use main VWAP and TWAP functions:
```docker
VWAP[dataTable;currency;minimumTimeRange;maximumTimeRange]
```
```docker
TWAP[dataTable;currency;minimumTimeRange;maximumTimeRange]
```
In both cases dataTable should be adjusted to certain style as shown in CSV format, in main version currency should be one string or symbol (it's converted inside function in case of mistakes), minimum and maximum time range should be timestamp types. Function returns one float value representing the VWAP/TWAP value.
If you want multiple currencies then you should use `VWAPMultipleValues` or `TWAPMultipleValues` with the same arguments - just instead of one string or symbol, you should pass a list of them. Function will return list of VWAP/TWAP values for currencies in the same order as they were inside of list.