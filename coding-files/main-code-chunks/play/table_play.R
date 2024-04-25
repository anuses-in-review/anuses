## table_play_quan_year Summed and Average PlaysN at the Year level ##

table_play_quan_year <- play_quan_year
colnames(table_play_quan_year) <- c("Year", "Total Net Plays", "Song Count", "Per Song Avg.", "Avg. Song Count")

table_play_quan_year[nrow(table_play_quan_year) + 1, 1] <- "Avg."
for (j in ncol(table_play_quan_year):2) {
  table_play_quan_year[nrow(table_play_quan_year), j] <- round(sum(play_quan_year[, j], na.rm = TRUE) / nrow(play_quan_year), digits = 0)
}

table_play_quan_year[, 2] <- comma(table_play_quan_year[, 2])

# View(table_play_quan_year)

## table_play_quan_song Top 5 and Bottom 1 Songs ordered by PlaysN ##

num <- ncol(play_quan_song) + 1
table_play_quan_song <- matrix(NA, nrow = nrow(play_quan_song), ncol = num)
colnames(table_play_quan_song) <- c("Rank", "Anus", "Title", "Net Plays")

table_play_quan_song[, 2] <- play_quan_song[, 1]
table_play_quan_song[, 3] <- play_quan_song[, 2]
table_play_quan_song[, 4] <- as.numeric(play_quan_song[, 3])

table_play_quan_song <- add_rank(table_play_quan_song, 1, 4, TRUE)

table_play_quan_song <- top_and_bottom_list(table_play_quan_song, 5, 1, 4)

# View(table_play_quan_song)

## table_play_quan Top 5 and Bottom 1 Anuses ordered by PlaysN ##

table_play_quan_int <- play_quan
table_play_quan_int <- table_play_quan_int[order(table_play_quan_int[, 4], decreasing = TRUE), ]

table_play_quan_int <- na.omit(table_play_quan_int)

# View(table_play_quan_int)

table_play_quan <- table_play_quan_int
colnames(table_play_quan) <- c("Rank", "Anus", "Per Song Avg.", "Total Net Plays")

table_play_quan[, 1] <- seq(from = 1, to = nrow(table_play_quan), by = 1)
table_play_quan[, 2] <- table_play_quan_int[, 1]
table_play_quan[, 3] <- table_play_quan_int[, 4]
table_play_quan[, 4] <- table_play_quan_int[, 2]
table_play_quan[, 4] <- comma(table_play_quan[, 4])

table_play_quan <- top_and_bottom_list(table_play_quan, 5, 1, 3)

# View(table_play_quan)

## table_play_arts_quan Top 10 Artists ordered by PlaysSum ##

table_play_arts_quan <- play_arts_quan
colnames(table_play_arts_quan) <- c("Rank", "Artist", "Total Plays")
table_play_arts_quan <- brackets_to_list(table_play_arts_quan, 2)
table_play_arts_quan[, 3] <- comma(table_play_arts_quan[, 3])

table_play_arts_quan <- top_list(table_play_arts_quan, 10, 1, 3)

# View(table_play_arts_quan)

rm(table_play_quan_int)
rm(j)
