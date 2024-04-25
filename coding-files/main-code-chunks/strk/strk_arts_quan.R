# View(data_anuses)

data_temp <- data_anuses[, .(Artist = unlist(strsplit(gsub("[\\[\\]]", "", Artist), "\\]\\["))), by = .(Anus)]

data_temp <- add_brackets(data_temp, 2)
data_temp <- data_temp[order(data_temp[, 2], data_temp[, 1]), ]
data_temp <- nowrames(data_temp)

# View(data_temp)

unique <- unique(data_temp[, 2])
strk_arts_quan <- matrix(NA, nrow = length(unique), ncol = 5)
colnames(strk_arts_quan) <- c("Artist", "Streak", "Start", "End", "Appearances")
strk_arts_quan <- as.data.frame(strk_arts_quan)

strk_arts_quan[, 1] <- unique

# View(strk_arts_quan)

for (i in nrow(strk_arts_quan):1) {
    for (n in nrow(data_temp):1) {
        new_frame1 <- data_temp
        for (s in seq_along(unique)) {
            if (data_temp[n, 2] != unique[s]) {
                new_frame1 <- new_frame1[-n, ]
            }
        }
    }
}

View(new_frame1)

# Artist | Anus

# Make unique(Artist) | Streak | Start | End | Total Appearances (this is the final product) strk_arts_quan Streak defaults to 1?

# Create new_frame1 for each artist Artist | Anus

# Remove multiple appearances (no 2004, 2004, 2004, 2005, etc.)

# Create a new_frame2 for that artist's list of streaks: Artist | Streak | Start | End

# For 2:nrow(new_frame1) if the Anus == the previous + 1, then add 1 to the streak in new_frame2

    # If i is greater than 1 + the previous, then start a new row in new_frame2

# If strk_arts_quan$Artist[i] == Artist from new_frame2, then add Streak, Start, and End

# Add Appearances from arts_quan


