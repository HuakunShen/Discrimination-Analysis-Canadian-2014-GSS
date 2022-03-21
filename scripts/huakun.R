library(tidyverse)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(kableExtra)
library(here)
library(hash)

source(here::here("scripts/constants.R"))

gss_data <- read_csv(here::here("inputs/data/data.csv"))
data = gss_data
binary_col="dis_20"
multi_col="msvic"
bin_vs_multi_col_bar_plot <- function(data, binary_col, multi_col, multi_col_num_2_label, plot_title, plot_subtitle, plot_xlab, plot_ylab, plot_fill_lab) {
  bool_only_data = data %>% filter(.data[[binary_col]] < 3)
  count_df <- rename(count(bool_only_data, .data[[multi_col]], .data[[binary_col]]), freq=n)
  
  sum_freq_by_multi_col <- aggregate(count_df$freq, by=list(msvic=count_df[[multi_col]]), FUN=sum)
  
  # add freq column to count_df
  count_df <- rename(merge(x=count_df, y=sum_freq_by_multi_col, by=multi_col, all = TRUE), total=x)
  
  count_df$perc = count_df$freq / count_df$total
  # map binary_col column to English
  binary_col_unique_val=sort(unique(count_df[[binary_col]]))
  binary_col_en = c("Yes", "No")
  names(binary_col_unique_val)=binary_col_en
  count_df$binary_col_en=binary_col_en[count_df[[binary_col]]]

  # map msvic column to English
  count_df$multi_col_en = ""
  for(i in 1:nrow(count_df)) {
    row <- count_df[i,]
    count_df[i,]$multi_col_en <- multi_col_num_2_label[[as.character(row[[multi_col]])]]
  }
  bar_plot <- ggplot(count_df, aes(x = multi_col_en, y = perc, fill=.data[["binary_col_en"]])) + 
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
    xlab(plot_xlab) + 
    ylab(plot_ylab) + 
    labs(title = plot_title, subtitle = plot_subtitle, fill=plot_fill_lab)
  return(bar_plot)
}





merge(x=sum_freq, y=sum_freq, by=multi_col, all = TRUE)









data = gss_data %>% filter()
# data, binary_col, multi_col, multi_col_num_2_label, plot_title, plot_subtitle, plot_xlab, plot_ylab, plot_fill_lab
sex_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
                  binary_col="dis_10", # sex discrimination
                  multi_col="msvic", 
                  multi_col_num_2_label=msvic_num_2_label, 
                  plot_title="Sex Discrimination VS Crime", 
                  plot_subtitle="Sex Discrimination has an obvious correlation with Sexual Assault", 
                  plot_xlab="Crime", 
                  plot_ylab="Percentage of Sex Discrimination", 
                  plot_fill_lab="Sex Discrimination")

culture_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_15", # Ethnicity or culture
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Ethnicity or culture Discrimination VS Crime", 
              plot_subtitle="Ethnicity or culture Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime", 
              plot_ylab="Percentage of Ethnicity or culture Discrimination", 
              plot_fill_lab="Ethnicity or culture Discrimination")

race_skin_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
                  binary_col="dis_20", # race and skin color
                  multi_col="msvic", 
                  multi_col_num_2_label=msvic_num_2_label, 
                  plot_title="Race and Skin Color Discrimination VS Crime", 
                  plot_subtitle="Sex Discrimination has an obvious correlation with Sexual Assault", 
                  plot_xlab="Crime", 
                  plot_ylab="Percentage of Race and Skin Color Discrimination", 
                  plot_fill_lab="Race and Skin Color Discrimination")

physical_appearance_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_25", # Physical appearance
              multi_col="msvic",
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Physical appearance Discrimination VS Crime", 
              plot_subtitle="Sex Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime", 
              plot_ylab="Percentage of Physical appearance Discrimination", 
              plot_fill_lab="Physical appearance Discrimination")

religion_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data,
              binary_col="dis_30", # Religion
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Religion Discrimination VS Crime", 
              plot_subtitle="Sex Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime", 
              plot_ylab="Percentage of Religion Discrimination", 
              plot_fill_lab="Religion Discrimination")

sexual_orientation_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_35", # Sexual orientation
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Sexual orientation Discrimination VS Crime", 
              plot_subtitle="Sexual orientation Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime",
              plot_ylab="Percentage ofRace and Skin Color Discrimination",
              plot_fill_lab="Sexual orientation Discrimination")


age_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_40", # Age
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Age Discrimination VS Crime", 
              plot_subtitle="Age Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime",
              plot_ylab="Percentage ofRace and Skin Color Discrimination",
              plot_fill_lab="Age Discrimination")

physical_mental_disability_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_45", # Physical or mental disability
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Physical or mental disability Discrimination VS Crime", 
              plot_subtitle="Physical or mental disability Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime",
              plot_ylab="Percentage ofRace and Skin Color Discrimination",
              plot_fill_lab="Physical or mental disability Discrimination")


language_crime_plot <- bin_vs_multi_col_bar_plot(data=gss_data, 
              binary_col="dis_50", # Language
              multi_col="msvic", 
              multi_col_num_2_label=msvic_num_2_label, 
              plot_title="Language Discrimination VS Crime", 
              plot_subtitle="Language Discrimination has an obvious correlation with Sexual Assault", 
              plot_xlab="Crime",
              plot_ylab="Percentage ofRace and Skin Color Discrimination",
              plot_fill_lab="Language Discrimination")


bin_vs_multi_col_bar_plot(data=gss_data, 
                           binary_col="dts_30", # polic
                           multi_col="msvic", 
                           multi_col_num_2_label=msvic_num_2_label, 
                           plot_title="Language Discrimination VS Crime", 
                           plot_subtitle="Language Discrimination has an obvious correlation with Sexual Assault", 
                           plot_xlab="Crime",
                           plot_ylab="Percentage ofRace and Skin Color Discrimination",
                           plot_fill_lab="Language Discrimination")


bin_vs_multi_col_bar_plot(data=gss_data, 
                          binary_col="dts_35", # court
                          multi_col="msvic", 
                          multi_col_num_2_label=msvic_num_2_label, 
                          plot_title="Language Discrimination VS Crime", 
                          plot_subtitle="Language Discrimination has an obvious correlation with Sexual Assault", 
                          plot_xlab="Crime",
                          plot_ylab="Percentage ofRace and Skin Color Discrimination",
                          plot_fill_lab="Language Discrimination")



grid.arrange(sex_crime_plot,
            culture_crime_plot,
            nrow=1)
             grid.arrange(race_skin_crime_plot,
              physical_appearance_crime_plot,
              religion_crime_plot,
              sexual_orientation_crime_plot,
              age_crime_plot,
              physical_mental_disability_crime_plot,
              language_crime_plot, nrow=5)


rename(count(gss_data, "msvic", freq=n))

count(gss_data, .data[["msvic"]]) %>% rename(freq=n)
data = gss_data
subset_data = data %>% filter(msvic < 900)
data$msvic_str = as.character(data$msvic)
subset_data %>% 
  left_join(as.data.frame(list(msvic=msvic_num, msvic_label=msvic_labels))) %>%
  ggplot(aes(as.factor(msvic_label), fill=msvic_label)) + geom_histogram(stat="count") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + xlab("Crime")
  
count_df <- rename(merge(x=count_df, y=sum_freq_by_multi_col, by=multi_col, all = TRUE), total=x)
count_df$perc = count_df$freq / count_df$total





sex_crime_plot <- cross_compare_barplot(data=gss_data, 
                                        col1 = "eduf10", col2 = "msvic",
                                        col1_num=eduf10_num, col1_labels=eduf10_labels,
                                        col2_num=msvic_num, col2_labels=msvic_labels, 
                                        plot_title="Sex Discrimination VS Crime", 
                                        plot_subtitle="Sex Discrimination has an obvious correlation with Sexual Assault", 
                                        plot_xlab="Crime", 
                                        plot_ylab="Percentage of Sex Discrimination", 
                                        plot_fill_lab="Sex Discrimination")

