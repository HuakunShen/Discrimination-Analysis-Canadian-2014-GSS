library(tidyverse)
library(dplyr)
library(ggplot2)


gss_data <- read_csv(here::here("inputs/data/data.csv"))
sex_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_10 < 3),
                                        col1 = "dis_10", col2 = "msvic",
                                        col1_num=dis_10_num, col1_labels=dis_10_labels,
                                        col2_num=msvic_num, col2_labels=msvic_labels, 
                                        plot_title="Sex Discrimination VS Crime", 
                                        plot_subtitle="High sexual assault rate",
                                        plot_xlab="Crime", 
                                        plot_ylab="Percentage", 
                                        plot_fill_lab="Sex Discrimination")

culture_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_15 < 3),
                                            col1="dis_15", # Ethnicity or culture
                                            col2 = "msvic",
                                            col1_num=dis_10_num, col1_labels=dis_10_labels,
                                            col2_num=msvic_num, col2_labels=msvic_labels,
                                            plot_title="Ethnicity or culture Discrimination VS Crime", 
                                            plot_subtitle="Very high crime rate for robbery, and high crime rate for many other crimes",
                                            plot_xlab="Crime", 
                                            plot_ylab="Percentage", 
                                            plot_fill_lab="Ethnicity or culture Discrimination")

race_skin_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_20 < 3), 
                                              col1="dis_20", # race and skin color
                                              col2 = "msvic",
                                              col1_num=dis_10_num, col1_labels=dis_10_labels,
                                              col2_num=msvic_num, col2_labels=msvic_labels,
                                              plot_title="Race and Skin Color Discrimination VS Crime", 
                                              plot_subtitle="Relatively high crime rate in many crimes",
                                              plot_xlab="Crime", 
                                              plot_ylab="Percentage", 
                                              plot_fill_lab="Race and Skin Color Discrimination")

physical_appearance_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_25 < 3),
                                                        col1="dis_25", # Physical appearance
                                                        col2 = "msvic",
                                                        col1_num=dis_10_num, col1_labels=dis_10_labels,
                                                        col2_num=msvic_num, col2_labels=msvic_labels,
                                                        plot_title="Physical appearance Discrimination VS Crime",
                                                        plot_subtitle="Very high attempted robbery, high robbery and sexual assault",
                                                        plot_xlab="Crime", 
                                                        plot_ylab="Percentage", 
                                                        plot_fill_lab="Physical appearance Discrimination")

religion_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_30 < 3),
                                             col1="dis_30", # Religion
                                             col2 = "msvic",
                                             col1_num=dis_10_num, col1_labels=dis_10_labels,
                                             col2_num=msvic_num, col2_labels=msvic_labels,
                                             plot_title="Religion Discrimination VS Crime", 
                                             plot_subtitle="Relatively low for all crimes", 
                                             plot_xlab="Crime", 
                                             plot_ylab="Percentage", 
                                             plot_fill_lab="Religion Discrimination")

sexual_orientation_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_35 < 3),
                                                       col1="dis_35", # Sexual orientation
                                                       col2 = "msvic",
                                                       col1_num=dis_10_num, col1_labels=dis_10_labels,
                                                       col2_num=msvic_num, col2_labels=msvic_labels,
                                                       plot_title="Sexual orientation Discrimination VS Crime", 
                                                       plot_subtitle="Very low for all crimes except for attempted robbery and sexual assault",
                                                       plot_xlab="Crime",
                                                       plot_ylab="Percentage",
                                                       plot_fill_lab="Sexual orientation Discrimination")


age_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_40 < 3),
                                        col1="dis_40", # Age
                                        col2 = "msvic",
                                        col1_num=dis_10_num, col1_labels=dis_10_labels,
                                        col2_num=msvic_num, col2_labels=msvic_labels,
                                        plot_title="Age Discrimination VS Crime",
                                        plot_subtitle="High (attempted) robbery, and attempted theft of household property",
                                        plot_xlab="Crime",
                                        plot_ylab="Percentage",
                                        plot_fill_lab="Age Discrimination")

physical_mental_disability_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_45 < 3),
                                                               col1="dis_45", # Physical or mental disability
                                                               col2 = "msvic",
                                                               col1_num=dis_10_num, col1_labels=dis_10_labels,
                                                               col2_num=msvic_num, col2_labels=msvic_labels,
                                                               plot_title="Physical or mental disability Discrimination VS Crime", 
                                                               plot_subtitle="High Attempted Robbery", 
                                                               plot_xlab="Crime",
                                                               plot_ylab="Percentage",
                                                               plot_fill_lab="Physical or mental disability Discrimination")


language_crime_plot <- cross_compare_barplot(data=gss_data %>% filter(msvic < 900) %>% filter(dis_50 < 3), 
                                             col1="dis_50", # Language
                                             col2 = "msvic",
                                             col1_num=dis_10_num, col1_labels=dis_10_labels,
                                             col2_num=msvic_num, col2_labels=msvic_labels,
                                             plot_title="Language Discrimination VS Crime", 
                                             plot_subtitle="Low crime rate for all crimes", 
                                             plot_xlab="Crime",
                                             plot_ylab="Percentage",
                                             plot_fill_lab="Language Discrimination")






