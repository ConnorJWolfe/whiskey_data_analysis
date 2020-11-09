# whiskey_data_analysis
### Connor Wolfe 
#### ISA 401

## Problem: 
The whiskey market is expansive with thousands of options to choose from. This is assuming you can even get your hands on some of them to choose from. Whiskeys on the market have a wide array of prices ranging anywhere from $10 to $10,000. In many states, this pricing is not set, meaning that they can be sold for inflated prices (or less than suggested retail price (SRP) if you are very lucky). 

Beyond MSRP, many retailers are known for marking up bottles based on their rarity or their allocation. Beyond retail stores, there are secondary bourbon markets that tend to be able to offer bottles that would be difficult to find in a retail store, these however charge a premium for the bottles. 

Does high price correlate with high ratings?
What %ABV is optimal for the achieving the highest rating?
What flavor characteristics are observed in some of the highest rated bourbons?
Can bourbon be a new investment opportunity? What bottles pull the greatest ROI?

## Datasets:
State of Ohio Liquor Pricings: ohiolq_dataset.csv
https://www.ohlq.com/products/

From the Ohio LQ products site, the cateogry was selected to be only 'American Whiskey' since this analysis only cares to look at Whiskeys and not other types of liquor. This data was scraped from the webpage using DataMiner extension in Google Chrome. This provides the data as a downloadable flat file. From there, the dataset was cleaned in R. The cleaning that was required on this data set was dropping unnecesary columns, dropping NA values, and adding column names. After cleaning was complete, the dataset was exported to a CSV file and ready for analysis.   

Whiskybase/Kaggle: Distillery.csv and Whisky_Brand.csv
https://www.whiskybase.com/whiskies/distilleries
https://www.kaggle.com/koki25ando/world-whisky-distilleries-brands-dataset

These two datasets were retrieved from Kaggle, from an analysis done by another Data Scientist. However, the data was scrapped from the Whiskybase website linked above. These datasets did not require cleaning. However, once loaded into Tableau, the some columns were able to be hidden and the 'Country' field was filtered to show only Distilleries and Brands from the United States. 

Second Hand Market Prices: secondary_market_dataset.csv
https://bottlebluebook.com

This dataset was retrieved from the Bottle Blue Book website for a set of the most popular whiskies from the above dataset based on public votes. This data shows current secondary market pricing for specific whiskies. Disclaimer that this dataset is an appromixation/estimate and is no way 100% the truth or valid but is based on current secondary market sales trends. 
