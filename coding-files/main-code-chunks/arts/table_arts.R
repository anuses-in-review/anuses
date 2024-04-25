## table_arts_quan Top 10 Artists by Appearances ##

table_arts_quan_int <- matrix(NA, nrow = nrow(arts_quan), ncol = 3)
table_arts_quan_int <- as.data.frame(table_arts_quan_int)
colnames(table_arts_quan_int) <- c("Rank", "Artist", "Appearances")

table_arts_quan_int[, 2] <- arts_quan[, 1]
table_arts_quan_int[, 3] <- as.numeric(arts_quan[, 2])

table_arts_quan_int <- brackets_to_list(table_arts_quan_int, 2)

table_arts_quan_int <- table_arts_quan_int[order(table_arts_quan_int[, 3], decreasing = TRUE), ]
table_arts_quan_int[, 1] <- seq(from = 1, to = nrow(table_arts_quan_int), by = 1) # Rank

# View(table_arts_quan_int)

table_arts_quan <- top_list_with_commas(table_arts_quan_int, 10, 1, 3, 2)

# View(table_arts_quan)

rm(table_arts_quan_int)