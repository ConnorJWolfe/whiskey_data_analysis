# Whiskey Data Analysis
Connor Wolfe, ISA 401B

[GitHub Repository](https://github.com/ConnorJWolfe/whiskey_data_analysis)

## Background
The whiskey[^1] market is expansive with thousands of bottles and brands to choose from. Even though these bottles are produced, this doesn't mean that consumers are always able to purchase them. Distribution of whiskey is like no other liquor on the market. Many bottles and brands are limited in production due to the extended aging periods and the limited warehouse space needed to store the barrels. As a result, many states, like the state of Ohio, have a state run liquor control agency that uses an allocation system to control the distribution of liquor to agencies all over the state. For whiskies specifically, the state of Ohio uses a lottery system to provide all Ohioans with the equal opportunity to purchase rare bottles. Since liquor is controlled by the state, prices are set at a state minimum pricing. This means that Ohio liquor agencies cannot sell bottles at prices less than the minimum. In most cases, Ohio liquor agencies do not attempt to sell common bottles at inflated prices because they will quickly lose sales to their competition. In other states like Illinois, the state does not control liquor distribution so agencies can theoretically sell liquor at whatever price they want. Additionally, these liquor agencies have a higher probability of getting allocated (rare) bottles from their distributors because distribution is not controlled by the state. As a result, competition in the liquor markets is much greater in states where liquor sales are not controlled by the state. Overall, this means that pricing varies all over the United States and a true standard can not be expected in different parts of the country or even between cities. Beyond retail liquor agencies, secondary whiskey markets have becoming a increasingly popular trend. These secondary markets tend to be able to offer bottles that would otherwise be difficult to find in a traditional liquor agency store. However, like you may expect, a consumer will pay a significantly inflated price to get their hands on the bottle of their choice. The secondary whiskey markets have become popular on sites like [Whiskey Exchange](https://www.thewhiskyexchange.com/wanted) and on social media platforms like Facebook and Instagram. On these platforms, groups have been created that specifically offer an opportunity for a user to sell their whiskey to others. Although, social media has played a major part in the success of the secondary whiskey market, this practice is considered to be highly illegal in many states since liquor tax is unable to be paid on a secondary market transaction. As a result, social media platforms have attempted to shut down these groups to stop the illegal resale of whiskey. However, many new resale opportunities continue to arise in the marketplace daily. 

### What is the problem?
In many ways, whiskey consumption has one major barrier to entry--the mass amount of options (bottles) to choose from. For new whiskey consumers who are not familiar with the whiskey marketplace, they are likely to become frustrated just like every whiskey consumer was when they first began their new hobby. It is difficult for new consumers to decide which whiskies to purchase and at what price they should do so at. For example, a new consumer may hear talk about a rare bottle that they've got to get their hands on and they may either find one in a liquor agency at state minimum pricing or they find a bottle on the secondary market where they pay a premium price. With these two options in mind, we look to understand how a consumer can make the best choice for themselves out of their potential purchase decision. 

### Why should we care?
This problem is important because it provides the opportunity for consumers to be informed so that they do not make a poor purchasing decision whether that be in a liquor agency or on a secondary market. Additionally, it uncovers an untraditional investment opportunity that can bring returns in the thousands percentage for consumers who are lucky enough to find a bottle at a low price. And overall, this analysis and visualization provides the opportunity for new whisky drinkers to understand some of the most popular whiskies on the market, their retail and secondary marketing prices, and other relevant information to making their purchasing decisions. 

### Existing Knowledge
In the whiskey community, there are many beliefs and arguments for which whiskies are the best and why. However, this is all opinion in nature and has no data backing it up. People make these assumptions based on a bottles percieved tastes and flavor profile, what distillery it comes from, its mash bill, or the number of years that it has been aged. This analysis will add onto this existing knowledge by taking a data backed approach to understanding the current whiskey market landscape in regards to pricing variation. Currently, no analysis has been done publicly to visualize primary and secondary market pricing. However, it is well-known in the whiskey community which bottles and brands are worth a large value. 

### Questions

- Where are the highest voted whiskies distilled in the United States?
- Do whiskey brands that produce more products tend to receive more votes?
- Are older distilleries more popular among whiskey consumers?
- What whiskey brands provide the greatest ROI in a secondary market?
- Are the distilleries producing the largest quantity of whiskies receiving the most votes?
- How should a consumer decide whether to drink or to resell?


## Data
#### Data Gathering and Description
`ohiolq_dataset.csv` : State of Ohio Liquor Pricing

[Ohio LQ](https://www.ohlq.com/products/)

The OhioLQ dataset is from the OhioLQ products site. Once on this site, the category filter was narrowed to be only `American Whiskey`. This filter was set because this analysis only focuses on whiskey and those produced in the United States. The OhioLQ products site includes data on all types of liquor. This data was scraped from the OhioLQ webpage using the DataMiner extension in Google Chrome. This provides the data as a downloadable flat file. From there, the dataset was cleaned in R. The cleaning that was required on this data set included dropping unnecesary columns, dropping NA values using `drop_na()` and adding column names to the data frame. After cleaning was complete, the dataset was exported to a CSV file using `write_csv()`and was then ready for analysis. The OhioLQ dataset provides attributes like: whiskey name, type, and state minimum price. This dataset has 876 records and the mean price of a whiskey on the primary market is $64.84. 

`secondary_market_dataset.csv` : Secondary Whiskey Market Prices

[Bottle Blue Book](https://bottlebluebook.com)

The Secondary Market pricing dataset was gathered from the Bottle Blue Book website. The secondary market prices were only collected for a subset of the most popular whiskies based on votes from the below `Whisky_Brand.csv` dataset. This data shows current secondary market pricing for specific whiskies. Disclaimer that this dataset is an appromixation and is no way 100% the truth or valid, rather it is based on current secondary market sales trends. Additionally, secondary market pricing is done based on product. For this analysis, a brand's ROI was based on the primary and secondary market pricing from both the Bottle Blue Book and OhioLQ datasets for one or multiple products of a brand. When multiple products were available, the average of those products ROI were used in calculation. The Secondary Market pricing dataset provides attributes like: whiskey name and secondary market price. This data set is limited in that it only provides a small subset of whiskies and their prices. This analysis could be further expanded by including more secondary market prices of a larger quantity of whiskies. This dataset has 32 records and the mean price of a whiskey on the secondary market is $532.03. 

`Distillery.csv` : Distillery Information and Ratings

`Whisky_Brand.csv` : Whiskey Branding Information and Ratings

[Whiskybase](https://www.whiskybase.com/whiskies/distilleries)

[Kaggle](https://www.kaggle.com/koki25ando/world-whisky-distilleries-brands-dataset)

The Distillery and Whiskey Brand dataset were retrieved from Kaggle. These datasets were pre-scrapped from the [Whiskybase](https://www.whiskybase.com/whiskies/distilleries) webpage. These datasets did not require any cleaning in R. However, once loaded into Tableau, many columns were able to be dropped that did not provide value for this analysis. Additionally, the `Country` attribute was filtered when loading the table to only include Distilleries and Brands located in the United States. The Distillery dataset scrapped from Whiskybase provides valuable attributes like: distillery name, founding year, quantity of votes, rating out of 100, number of whiskies produced, and longitude/latitude. For this analysis, we use `Votes` from the distillery dataset as a way to indicate overall popularity of the distillery. However, the dataset is limited because votes are only retrieved from viewers of the  Whisybase site. In order to vote, the user must intentionally select to vote for a distillery as their favorite. On the other hand, the Whiskey Brand dataset provides attributes like: brand, number of whiskies produced, votes, and ratings. The Distillery dataset has 1,158 records in total, while the Whiskey Brand dataset has 4,881 records. 

### Joining the Data

In order to produce a merged dataset, some joining was required. First, the secondary market dataset was joined with the whiskey brand dataset on the brand attribute using a fuzzy lookup in Excel. This was neccesary in order to ensure that the product name could be related to its associated brand without having exactly the same name. Next, in Tableau the whiskey brand dataset was joined on the secondary market dataset on the brand attribute. Then, the OhioLQ dataset was joined on the secondary market dataset on the product name field to produce an aggregated dataset. For this analysis, the aggregated dataset was used for some visualizations related to pricing, while others leverage an unjoined dataset to gather a wider understanding of the whiskey marketplace. 

## Questions for Further Research
- Which states receive the largest allocations of whiskies?
- What states provide the lowest minimum pricing? 
- What are the flavor profiles/characteristics of the highest voted whiskies on the market?
- What impact does ABV% have on the popularity among consumers?

[^1]: For this analysis the term whiskey refers to Irish Whiskey, Scotch Whiskey, Bourbon Whiskey, Japanese Whiskey, Canadian Whiskey, Rye Whiskey, Tennessee Whiskey, and Blended Whiskey. 

