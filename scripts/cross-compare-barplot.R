library(tidyverse)
library(dplyr)
library(ggplot2)


cross_compare_barplot <- function(data, col1, col2, 
                                  col1_num, col1_labels,
                                  col2_num, col2_labels, 
                                  plot_title, plot_subtitle, plot_xlab, 
                                  plot_ylab, plot_fill_lab) {
  freq_data <- data %>% count(.data[[col1]], .data[[col2]]) %>% rename(freq=n)
  # count total by col 2 (msvic)
  sum_freq <- aggregate(freq_data$freq, by=list(col2=freq_data[[col2]]), FUN=sum)
  freq_data <- rename(merge(x=freq_data, y=sum_freq, by.x =col2, by.y="col2", all = TRUE), total=x)
  freq_data$perc = freq_data$freq / freq_data$total
  
  col_1_num_label_df <- as.data.frame(list(num=col1_num, label=col1_labels))
  col1_label_name <- paste(col1, "_label", sep="")
  names(col_1_num_label_df) = c(col1, col1_label_name)
  
  col_2_num_label_df <- as.data.frame(list(num=col2_num, label=col2_labels))
  col2_label_name <- paste(col2, "_label", sep="")
  names(col_2_num_label_df) = c(col2, col2_label_name)
  
  
  freq_data <- freq_data %>% left_join(col_2_num_label_df, by.x=col2, by.y=col2) %>%
    left_join(col_1_num_label_df, by.x=col1, by.y=col1)
  
  barplot <- ggplot(freq_data, aes(x = .data[[col2_label_name]], y = perc, fill=.data[[col1_label_name]])) + 
    geom_bar(stat = "identity") + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
    xlab(plot_xlab) +
    ylab(plot_ylab) +
    labs(title = plot_title, subtitle = plot_subtitle, fill=plot_fill_lab)
  return(barplot)
}























