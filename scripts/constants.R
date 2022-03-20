library(hash)
msvic_num <- c(101, 202, 203, 304, 405, 406, 507, 508, 509, 609, 610, 711, 712, 813, 994, 995, 996, 997, 998, 999)
msvic_labels <- c("Sexual assault", "Robbery", "Attempted robbery", "Assault", "Break and enter", "Attempted break and enter", "Motor vehicle theft", "Part of a motor vehicle theft", "Attempted motor vehicle (parts) theft", "Theft of personal property", "Attempted theft of personal property", "Theft of household property", "Attempted theft of household property", "Vandalism", "Not asked - no crime reported", "Unclassifiable", "Valid skip", "Don't know", "Refusal", "Not stated")
msvic_num_2_label <- hash(msvic_num, msvic_labels)

names(msvic_num)=msvic_labels
