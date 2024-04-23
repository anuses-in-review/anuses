table_albm_quan <- matrix(NA, nrow = nrow(albm_quan), ncol = 4)
table_albm_quan <- as.data.frame(table_albm_quan)
colnames(table_albm_quan) <- c("Rank", "Album", "Artist", "Appearances")

table_albm_quan[, 2] <- albm_quan[, 1] # Album
table_albm_quan[, 3] <- albm_quan[, 2] # Artist
table_albm_quan[, 4] <- as.numeric(albm_quan[, 3]) # Appearances

table_albm_quan <- brackets_to_list(table_albm_quan, 3)
table_albm_quan <- add_rank(table_albm_quan, 1, 4, TRUE)
table_albm_quan <- top_list(table_albm_quan, 10, 1, 4)

# View(table_albm_quan)

num <- ncol(albm_quan_uniq) + 1
table_albm_quan_uniq <- matrix(NA, nrow = nrow(albm_quan_uniq), ncol = num)
table_albm_quan_uniq <- as.data.frame(table_albm_quan_uniq)
colnames(table_albm_quan_uniq) <- c("Rank", "Album", "Artist", "Inclusion", "Delete")

table_albm_quan_uniq[, 2] <- albm_quan_uniq[, 1] # Album
table_albm_quan_uniq[, 3] <- albm_quan_uniq[, 2] # Artist
table_albm_quan_uniq[, 4] <- as.numeric(albm_quan_uniq[, 3]) # Included
table_albm_quan_uniq[, 5] <- as.numeric(albm_quan_uniq[, 4]) # Total (deleted later)

table_albm_quan_uniq <- brackets_to_list(table_albm_quan_uniq, 3)
table_albm_quan_uniq <- add_rank(table_albm_quan_uniq, 1, 4, TRUE)
table_albm_quan_uniq <- top_list(table_albm_quan_uniq, 20, 1, 4)

# Create Included / Total
for (i in nrow(table_albm_quan_uniq):1) {
    table_albm_quan_uniq[i, 4] <- paste0(table_albm_quan_uniq[i, 4], " / ", table_albm_quan_uniq[i, 5])
}

table_albm_quan_uniq <- table_albm_quan_uniq[, -5] # Remove Delete column

# View(table_albm_quan_uniq)
