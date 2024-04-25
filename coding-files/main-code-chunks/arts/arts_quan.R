## arts_quan ##

# Process is the same as for Art_List without Export steps

setDT(data_anuses)

arts_splt <- data_anuses[, .(Names = unlist(strsplit(gsub("[\\[\\]]", "", Artist), "\\]\\["))), by = .(Title)]

arts_splt <- as.data.frame(arts_splt)
for (i in nrow(arts_splt):1) {
  if (!grepl("\\[", arts_splt[i, 2])) {
    arts_splt[i, 2] <- paste0("[", arts_splt[i, 2])
  }
  if (!grepl("\\]", arts_splt[i, 2])) {
    arts_splt[i, 2] <- paste0(arts_splt[i, 2], "]")
  }
}

# View(arts_splt)

arts_demo <- matrix(NA, nrow = nrow(arts_splt), ncol = 2)
arts_demo[, 1] <- arts_splt[, 2] # Names (split)
arts_demo <- arts_demo[order(arts_demo[, 1]), ] # Put in alphabetical order

# View(arts_demo)

arts_quan <- matrix(NA, ncol = ncol(arts_demo))
arts_quan <- unique(arts_demo, by = arts_demo[, 1]) # Unique names only
arts_quan[, 2] <- as.numeric(table(arts_demo[, 1])) # Number of appearances
arts_quan <- as.data.frame(arts_quan)
colnames(arts_quan) <- c("Name", "Appearances")

# View(arts_quan)

rm(arts_splt)
rm(arts_demo)
rm(i)