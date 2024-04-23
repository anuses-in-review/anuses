table_song_quan <- matrix(NA, nrow = nrow(song_quan), ncol = 4)
table_song_quan <- as.data.frame(table_song_quan)
colnames(table_song_quan) <- c("Rank", "Song", "Artist", "Appearances")

table_song_quan[, 2] <- song_quan[, 1] # Album
table_song_quan[, 3] <- song_quan[, 2] # Artist
table_song_quan[, 4] <- as.numeric(song_quan[, 3]) # Appearances

table_song_quan <- brackets_to_list(table_song_quan, 3)
table_song_quan <- add_rank(table_song_quan, 1, 4, TRUE)
table_song_quan <- top_list(table_song_quan, 5, 1, 4)

# View(table_song_quan)