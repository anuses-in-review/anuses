table_lang_quan <- matrix(NA, nrow = length(unique(lang_quan[, 1])), ncol = 3)
colnames(table_lang_quan) <- c("Rank", "Language", "Appearances")
table_lang_quan[, 2] <- lang_quan[, 1] # Languages
table_lang_quan[, 3] <- as.numeric(lang_quan[, 2]) # Appearances

table_lang_quan <- add_rank(table_lang_quan, 1, 3, TRUE)
table_lang_quan <- top_list_with_commas(table_lang_quan, nrow(table_lang_quan), 1, 3, 2)

# View(table_lang_quan)
