## albm_quan ##

albm_quan_int <- matrix(NA, nrow = nrow(data_anuses), ncol = 3)
colnames(albm_quan_int) <- c("Album", "Artist", "Matching")

albm_quan_int[, 1] <- data_anuses$Album # Album
albm_quan_int[, 2] <- data_anuses$Artist # Artist
albm_quan_int <- albm_quan_int[order(albm_quan_int[, 1], albm_quan_int[, 2]), ] # Put in alphabetical order

# Keep only the main Artist (removes features)
for (i in nrow(albm_quan_int):1) {
    if (grepl("\\]\\[", albm_quan_int[i, 2])) {
        albm_quan_int[i, 2] <- sub("\\]\\[.*", "]", albm_quan_int[i, 2])
    }
}

# Create Album[Artist] Matching variable
for (i in nrow(albm_quan_int):1) {
    albm_quan_int[i, 3] <- paste0(albm_quan_int[i, 1], albm_quan_int[i, 2])
}

# View(albm_quan_int)

unique <- unique(albm_quan_int[, 3])
albm_quan <- matrix(NA, nrow = length(unique), ncol = 3)
colnames(albm_quan) <- c("Album", "Artist", "Appearances")

albm_quan[, 1] <- unique # Matching in Album spot (replaced later)
albm_quan[, 3] <- as.numeric(table(albm_quan_int[, 3])) # Number of appearances

for (i in nrow(albm_quan):1) {
    for (n in nrow(albm_quan_int):1) {
        if (albm_quan[i, 1] == albm_quan_int[n, 3]) {
            albm_quan[i, 1] <- albm_quan_int[n, 1] # Album
            albm_quan[i, 2] <- albm_quan_int[n, 2] # Artist
        }
    }
}

# View(albm_quan)
