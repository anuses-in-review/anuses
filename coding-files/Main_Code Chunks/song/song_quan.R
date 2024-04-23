## song_quan ##

song_quan_int <- matrix(NA, nrow = nrow(data_anuses), ncol = 3)
colnames(song_quan_int) <- c("Song", "Artist", "Matching")

song_quan_int[, 1] <- data_anuses$Title # Song
song_quan_int[, 2] <- data_anuses$Artist # Artist
song_quan_int <- song_quan_int[order(song_quan_int[, 1], song_quan_int[, 2]), ] # Put in alphabetical order

# Create Album[Artist] Matching variable
for (i in nrow(song_quan_int):1) {
    song_quan_int[i, 3] <- paste0(song_quan_int[i, 1], song_quan_int[i, 2])
}

# View(song_quan_int)

unique <- unique(song_quan_int[, 3])
song_quan <- matrix(NA, nrow = length(unique), ncol = 3)
colnames(song_quan) <- c("Song", "Artist", "Appearances")

song_quan[, 1] <- unique # Matching in Song spot (replaced later)
song_quan[, 3] <- as.numeric(table(song_quan_int[, 3])) # Number of appearances

for (i in nrow(song_quan):1) {
    for (n in nrow(song_quan_int):1) {
        if (song_quan[i, 1] == song_quan_int[n, 3]) {
            song_quan[i, 1] <- song_quan_int[n, 1] # Song
            song_quan[i, 2] <- song_quan_int[n, 2] # Artist
        }
    }
}

# View(song_quan)
