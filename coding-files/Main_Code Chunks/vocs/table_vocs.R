## table_vocs_quan Top 10 Vocalists ordered by Appearances ##

table_vocs_quan_int <- matrix(NA, nrow = nrow(vocs_quan), ncol = 3)
table_vocs_quan_int <- as.data.frame(table_vocs_quan_int)
colnames(table_vocs_quan_int) <- c("Rank", "Artist", "Appearances")

table_vocs_quan_int[, 2] <- vocs_quan[, 1] # Artist
table_vocs_quan_int[, 3] <- as.numeric(vocs_quan[, 2]) # Appearances

table_vocs_quan_int <- brackets_to_list(table_vocs_quan_int, 2)

table_vocs_quan_int <- add_rank(table_vocs_quan_int, 1, 3, TRUE)

# View(table_vocs_quan_int)

table_vocs_quan <- top_list_with_commas(table_vocs_quan_int, 10, 1, 3, 2)

# View(table_vocs_quan)

rm(table_vocs_quan_int)