# load packages
pacman::p_load(tidyverse)

# read csv file
read_csv('whiskey_distilleries.csv') -> whiskey_distilleries

# select only needed columns
whiskey_distilleries[c(1,2,3,4,5)] -> cleaned_distilleries

# set columns names
colnames(cleaned_distilleries) <- (c('Distillery','County','Whiskies', 'Votes','Rating')) 

# write df to csv fiel for analysis
write.csv(cleaned_distilleries,"distilleries_data.csv", row.names = TRUE)
