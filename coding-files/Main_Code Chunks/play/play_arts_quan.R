data_temp <- data_play[, c(1, 3, 4, 13)]

# View(data_temp)

setDT(data_temp)
play_arts_quan_int <- data_temp[, .(Artist = unlist(strsplit(gsub("[\\[\\]]", "", Artist), "\\]\\["))), by = .(Title, Anus)]

play_arts_quan_int <- add_brackets(play_arts_quan_int, 3) # Bracket Artists
play_arts_quan_int$PlaysN <- NA # Add PlaysN column
colnames(play_arts_quan_int) <- c("Title", "Anus", "Artist", "PlaysN")

for (i in nrow(play_arts_quan_int):1) {
  for (n in nrow(data_temp):1) {
    if (play_arts_quan_int[i, 1] == data_temp[n, 2] # Match Title
      && play_arts_quan_int[i, 2] == data_temp[n, 1] # Match Anus
    ) {
      play_arts_quan_int[i, 4] <- data_temp[n, 4]   
    }
  }
}

# View(play_arts_quan_int)

play_arts_quan <- matrix(as.numeric(0), nrow = length(unique(play_arts_quan_int[, 3])), ncol = 3)
colnames(play_arts_quan) <- c("Ranking", "Artist", "PlaysSum")
play_arts_quan <- as.data.frame(play_arts_quan)

play_arts_quan[, 2] <- unique(play_arts_quan_int[, 3])
for (i in nrow(play_arts_quan_int):1) {
  for (n in nrow(play_arts_quan):1) {
    if (play_arts_quan_int[i, 3] == play_arts_quan[n, 2]) {
      play_arts_quan[n, 3] <- play_arts_quan[n, 3] + as.numeric(play_arts_quan_int[i, 4])
    }
  }
}

play_arts_quan <- add_rank(play_arts_quan, 1, 3, TRUE)

# View(play_arts_quan)

rm(play_arts_quan_int)
rm(data_temp)
