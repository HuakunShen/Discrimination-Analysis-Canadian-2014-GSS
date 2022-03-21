university_crime_count <- gss_data %>% filter(msvic < 900) %>% filter(eor_01c == 1) %>% 
  left_join(as.data.frame(list(msvic=msvic_num, msvic_label=msvic_labels))) %>%
  ggplot(aes(as.factor(msvic_label))) + geom_histogram(stat="count") + 
  theme(plot.title = element_text(size=10), axis.text.x = element_text(angle = 60, hjust = 1)) + xlab("Crime") +
  labs(title = "University Education Crime Count")


college_crime_count <- gss_data %>% filter(msvic < 900) %>% filter(eor_01b == 1) %>% 
  left_join(as.data.frame(list(msvic=msvic_num, msvic_label=msvic_labels))) %>%
  ggplot(aes(as.factor(msvic_label))) + geom_histogram(stat="count") + 
  theme(plot.title = element_text(size=10), axis.text.x = element_text(angle = 60, hjust = 1)) + xlab("Crime") +
  labs(title = "College Education Crime Count")


elementary_crime_count <- gss_data %>% filter(msvic < 900) %>% filter(eor_01a == 1) %>% 
  left_join(as.data.frame(list(msvic=msvic_num, msvic_label=msvic_labels))) %>%
  ggplot(aes(as.factor(msvic_label))) + geom_histogram(stat="count") + 
  theme(plot.title = element_text(size=10), axis.text.x = element_text(angle = 60, hjust = 1)) + xlab("Crime") +
  labs(title = "Elementary Education Crime Count")