## play_quan_song PlaysN at the Song level ##

play_quan_song <- data_play[, c(1, 3, 13)]
play_quan_song <- as.data.frame(play_quan_song)

# View(play_quan_song)

## play_quan PlaysN summed at the Anus level ##

play_quan <- matrix(0, nrow = length(unique(play_quan_song[, 1])), ncol = 4)
colnames(play_quan) <- c("Anus", "PlaysN", "Count", "Avg")
play_quan <- as.data.frame(play_quan)

play_quan[, 1] <- unique(play_quan_song[, 1]) # Anus

for (i in nrow(play_quan_song):1) {
  for (n in nrow(play_quan):1) {
    if (as.numeric(play_quan_song[i, 1]) == as.numeric(play_quan[n, 1])) {
      play_quan[n, 2] <- as.numeric(play_quan[n, 2]) + as.numeric(play_quan_song[i, 3]) # PlaysSum
      play_quan[n, 3] <- as.numeric(play_quan[n, 3]) + as.numeric(1) # Count
    }
  }
}

for (i in nrow(play_quan):1) {
  play_quan[i, 4] <- round(play_quan[i, 2] / play_quan[i, 3], digits = 0) # Avg
}

# View(play_quan)

## play_quan_year PlaysN summed at the Year level ##

play_quan_year_int <- as.data.frame(play_quan)

for (i in nrow(play_quan_year_int):1) {
  play_quan_year_int[i, 1] <- substr(play_quan_year_int[i, 1], 1, nchar(play_quan_year_int[i, 1]) - 2)
}

# View(play_quan_year_int)

play_quan_year <- matrix(0, nrow = length(unique(play_quan_year_int[, 1])), ncol = 5)
colnames(play_quan_year) <- c("Year", "PlaysN", "Count", "PlaysNAvg", "CountAvg")
play_quan_year <- as.data.frame(play_quan_year)

play_quan_year[, 1] <- unique(play_quan_year_int[, 1])

play_quan_year_int <- na.omit(play_quan_year_int)

for (i in nrow(play_quan_year):1) {
  for (n in nrow(play_quan_year_int):1) {
    if (grepl(play_quan_year_int[n, 1], play_quan_year[i, 1], fixed = TRUE)) {
      play_quan_year[i, 2] <- as.numeric(play_quan_year[i, 2]) + as.numeric(play_quan_year_int[n, 2])
      play_quan_year[i, 3] <- as.numeric(play_quan_year[i, 3]) + as.numeric(play_quan_year_int[n, 3])
    }
  }
  play_quan_year[i, 1] <- paste0("20", play_quan_year[i, 1])
}

play_quan_year[, 1] <- as.numeric(play_quan_year[, 1])

for (i in nrow(play_quan_year):1) {
  play_quan_year[i, 4] <- round(play_quan_year[i, 2] / play_quan_year[i, 3], digits = 0)
}

setDT(play_quan_year_int)

for (i in nrow(play_quan_year):1) {
  months <- table(play_quan_year_int[, 1])
  play_quan_year[i, 5] <- round(play_quan_year[i, 3] / as.numeric(months[i]), digits = 0)

}

# View(play_quan_year)

rm(play_quan_year_int)
rm(i)
rm(n)
