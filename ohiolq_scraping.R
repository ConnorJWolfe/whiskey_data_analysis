# load packages
pacman::p_load(tidyverse, dplyr, tidyr) 

# read csv file from Chrome DataMiner
ohiolq = read_csv('dataminer.csv')

# select only needed columns from original csv file write to new df
ohiolq[c(2,3,4)] -> bourbon

# remove NA values from df 
bourbon %>% drop_na() -> bourbon_clean

# set column names
colnames(bourbon_clean) <- (c('Product Name','Category','Price'))

# write df to csv fiel for analysis
write.csv(bourbon_clean,"ohiolq_dataset.csv", row.names = TRUE)
