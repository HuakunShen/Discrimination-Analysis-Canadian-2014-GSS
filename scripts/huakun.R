library(tidyverse)
library(dplyr)
library(ggplot2)
library(kableExtra)
library(here)
library(hash)

gss_data <- read_csv(here::here("inputs/data/data.csv"))

bool_only_data = gss_data %>% filter(dis_10 < 3)

count_df <- rename(count(bool_only_data, msvic, dis_10), freq=n)

sum_freq_by_msvic <- aggregate(count_df$freq, by=list(msvic=count_df$msvic), FUN=sum)

# add freq column to count_df
count_df <- rename(merge(x=count_df, y=sum_freq_by_msvic, by="msvic", all = TRUE), total=x)

count_df$perc = count_df$freq / count_df$total

# map dis_10 column to English
dis_10_unique=sort(unique(count_df$dis_10))
dis_10_en = c("No", "Yes")
names(dis_10_unique)=dis_10_en
count_df$dis_10_en=dis_10_en[count_df$dis_10]

# map msvic column to English
source(here::here("scripts/constants.R"))
count_df$msvic_en = ""
for(i in 1:nrow(count_df)) {
  row <- count_df[i,]
  count_df[i,]$msvic_en <- msvic_num_2_label[[as.character(row$msvic)]]
}

x = c("dis_10_en")
bar_plot <- ggplot(count_df, aes(x = msvic_en, y = perc, fill=.data[["dis_10_en"]])) + geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

bar_plot


