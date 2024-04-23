data_lang <- data_anuses[, c(1, 3, 9)]

# View(data_lang)

setDT(data_anuses)

lang_splt <- data_anuses[, .(Names = unlist(strsplit(gsub("[\\[\\]]", "", Languages), "\\]\\["))), by = .(Title)]

lang_splt <- as.data.frame(lang_splt)
lang_splt <- add_brackets(lang_splt, 2)

# View(lang_splt)

list_lang <- unique(lang_splt[, 2])
# list_lang

list_lang_mult <- unique(data_lang$Languages)
# list_lang_mult

lang_quan <- matrix(NA, nrow = length(list_lang), ncol = 2)
lang_quan[, 1] <- list_lang
lang_quan[, 2] <- 0
colnames(lang_quan) <- c("Language", "Appearances")
lang_quan <- as.data.frame(lang_quan)

lang_quan <- brackets_to_list(lang_quan, 1)

for (i in nrow(lang_quan):1) {
    for (n in nrow(data_lang):1) {
        if (grepl(lang_quan[i, 1], data_lang[n, 3])) {
            lang_quan[i, 2] <- as.numeric(lang_quan[i, 2]) + as.numeric(1)
        }
    }
}

lang_quan <- lang_quan[order(lang_quan[, 1]), ]
rownames(lang_quan) <- seq(from = 1, to = nrow(lang_quan), by = 1)

# View(lang_quan)

rm(lang_splt)
rm(i)