albm_quan_uniq_int <- matrix(NA, nrow = nrow(data_anuses), ncol = 5)
colnames(albm_quan_uniq_int) <- c("Album", "Artist", "Matching", "Song", "Final Matching")

albm_quan_uniq_int[, 1] <- data_anuses$Album # Album
albm_quan_uniq_int[, 2] <- data_anuses$Artist # Artist
albm_quan_uniq_int[, 4] <- data_anuses$Title # Song

# Keep only the main Artist (removes features)
for (i in nrow(albm_quan_uniq_int):1) {
    if (grepl("\\]\\[", albm_quan_uniq_int[i, 2])) {
        albm_quan_uniq_int[i, 2] <- sub("\\]\\[.*", "]", albm_quan_uniq_int[i, 2])
    }
}

# Create Album[Artist]Title Matching variable
for (i in nrow(albm_quan_uniq_int):1) {
    albm_quan_uniq_int[i, 3] <- paste0("[", albm_quan_uniq_int[i, 1], "]", albm_quan_uniq_int[i, 2], albm_quan_uniq_int[i, 4])
    albm_quan_uniq_int[i, 5] <- paste0("[", albm_quan_uniq_int[i, 1], "]", albm_quan_uniq_int[i, 2])
}

albm_quan_uniq_int <- albm_quan_uniq_int[order(albm_quan_uniq_int[, 3]), ] # Put in alphabetical order

# View(albm_quan_uniq_int)

unique <- unique(albm_quan_uniq_int[, 3])
albm_quan_uniq_int_int <- matrix(NA, nrow = length(unique), ncol = 3)
colnames(albm_quan_uniq_int_int) <- c("Album", "Artist", "Appearances")

albm_quan_uniq_int_int[, 1] <- unique # Matching in Album spot (replaced later)
albm_quan_uniq_int_int[, 3] <- as.numeric(table(albm_quan_uniq_int[, 3])) # Number of appearances of each song individually (for checking)

for (i in nrow(albm_quan_uniq_int_int):1) {
    for (n in nrow(albm_quan_uniq_int):1) {
        if (albm_quan_uniq_int_int[i, 1] == albm_quan_uniq_int[n, 3]) {
            albm_quan_uniq_int_int[i, 1] <- albm_quan_uniq_int[n, 1] # Album
            albm_quan_uniq_int_int[i, 2] <- albm_quan_uniq_int[n, 2] # Artist
        }
    }
}

# Create Album[Artist] Matching variable
for (i in nrow(albm_quan_uniq_int_int):1) {
    albm_quan_uniq_int_int[i, 1] <- paste0("[", albm_quan_uniq_int_int[i, 1], "]", albm_quan_uniq_int_int[i, 2])
}

# View(albm_quan_uniq_int_int)

unique <- unique(albm_quan_uniq_int_int[, 1])
albm_quan_uniq <- matrix(NA, nrow = length(unique), ncol = 4)
colnames(albm_quan_uniq) <- c("Album", "Artist", "Included", "Total")

albm_quan_uniq[, 1] <- unique # Matching in Album spot (replaced later)
albm_quan_uniq[, 3] <- as.numeric(table(albm_quan_uniq_int_int[, 1])) # Included

# View(albm_quan_trks) # Album matching variable | Number of tracks

for (i in nrow(albm_quan_uniq):1) {
    for (n in nrow(albm_quan_trks):1) {
        if (albm_quan_trks[n, 1] == albm_quan_uniq[i, 1]) {
            albm_quan_uniq[i, 4] <- albm_quan_trks[n, 2] # Total
        }
    }
    for (s in nrow(albm_quan_uniq_int):1) {
        if (albm_quan_uniq[i, 1] == albm_quan_uniq_int[s, 5]) {
            albm_quan_uniq[i, 1] <- albm_quan_uniq_int[s, 1] # Album
            albm_quan_uniq[i, 2] <- albm_quan_uniq_int[s, 2] # Artist
        }
    }
}

# View(albm_quan_uniq)
