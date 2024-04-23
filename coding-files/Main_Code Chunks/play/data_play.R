## data_play Play data with net plays calculated ##

data_play <- data_anuses

# Remove anuses without play data
for (i in nrow(data_play):1) {
  if (is.na(data_play[i, 11])) {
    data_play <- data_play[-i, ]
  }
}

# Check for the same nrow to make sure all data are there
# data_play <- na.omit(data_play)

# Calculate PlaysN (net play) measure
for (i in nrow(data_play):1) {
  data_play[i, 13] <- as.numeric(data_play[i, 12]) - as.numeric(data_play[i, 11]) # Plays1 - Plays0
}

colnames(data_play)[13] <- "PlaysN" # Replace Note with PlaysN

# View(data_play)

data_play_lack <- data_anuses

# Remove anuses with play data
for (i in nrow(data_play):1) {
  if (!is.na(data_play[i, 11])) {
    data_play_lack <- data_play_lack[-i, ]
  }
}

# View(data_play_lack)

rm(i)