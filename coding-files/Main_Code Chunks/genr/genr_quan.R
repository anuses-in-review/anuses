# Create Genre_Binary.xlsx

setDT(data_anuses)
genr_list <- cbind(data_anuses$Anus, data_anuses$Title, data_anuses$Genre)

genr_demo <- matrix(NA, nrow = nrow(genr_list), ncol = 3)
genr_demo[, 1] <- genr_list[, 3] # Genre (already split)
genr_demo <- genr_demo[order(genr_demo[, 1]), ] # Put in alphabetical order

# View(genr_demo)

genr_quan <- matrix(NA, ncol = ncol(genr_demo))
colnames(genr_quan) <- c("Genre", "Appearances", "Tags")

genr_quan <- unique(genr_demo, by = genr_demo[, 1]) # Unique names only
genr_quan[, 2] <- as.numeric(table(genr_demo[, 1])) # Number of appearances
genr_quan <- as.data.frame(genr_quan)

# Import existing list
temp_route <- here("Excel", "Genre_Binary_Backup.xlsx") # Just in case it fucks up
output_route <- here("Excel", "Genre_Binary.xlsx")
data_genr <- read.xlsx(output_route, sheet = 1)

# Add existing data to new list and counts
num <- 3:ncol(genr_quan) # Allows demo variables to be copied over but new list and appearances count are the new ones
for (i in nrow(genr_quan):1) {
  for (j in nrow(data_genr):1) {
    if (genr_quan[i, 1] == data_genr[j, 1]) {
      genr_quan[i, num] <- data_genr[j, num]
    }
  }
  if (is.na(genr_quan[i, 3])) {
    genr_quan[i, 3] <- genr_quan[i, 1]
  }
}

# Export and replace existing list
write.xlsx(genr_quan, output_route, sheetName = "Genres", rowNames = FALSE)

# View(genr_quan)

# Genre by Tags
unique <- unique(genr_quan[, 3])
genr_quan_tags <- matrix(0, nrow = length(unique), ncol = 3)
genr_quan_tags <- as.data.frame(genr_quan_tags)
colnames(genr_quan_tags) <- c("Tag", "Appearances", "Genres")

genr_quan_tags[, 1] <- unique

for (i in nrow(genr_quan_tags):1) {
    for (n in 1:nrow(genr_quan)) {
        tag <- genr_quan[n, 3]
        if (grepl(tag, genr_quan_tags[i, 1])) {
            genr_quan_tags[i, 2] <- genr_quan_tags[i, 2] + as.numeric(genr_quan[n, 2])
            genr_quan_tags[i, 3] <- paste0(genr_quan_tags[i, 3], ", ", genr_quan[n, 1])
        }
    }
}

for (i in nrow(genr_quan_tags):1) {
    if (grepl("0, ", genr_quan_tags[i, 3])) {
        genr_quan_tags[i, 3] <- gsub("0, ", "", genr_quan_tags[i, 3])
    }
}

# View(genr_quan_tags)

# if ... then [Spanish]
# if ... then [Alternative]
# for example: Rock y alternativo == [Spanish][Alternative]
# and then do a grepl?

