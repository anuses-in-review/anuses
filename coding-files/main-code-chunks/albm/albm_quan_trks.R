# Create new matrix with albm_demo unique entries and number of appearances
albm_quan_trks <- matrix(NA, nrow = nrow(albm_quan), ncol = 2)
colnames(albm_quan_trks) <- c("Album", "Tracks")
albm_quan_trks <- as.data.frame(albm_quan_trks)

for (i in nrow(albm_quan_trks):1) {
  albm_quan_trks[i, 1] <- paste0("[", albm_quan[i, 1], "]", albm_quan[i, 2]) # Album[Artist]matching variable
}

# View(albm_quan_trks)

# Import existing list
# temp_route <- here("coding-files", "Excel", "CollectYourCoin_Backup.xlsx") # Just in case it fucks up
output_route <- here("coding-files", "Excel", "CollectYourCoin.xlsx")
data_albm <- read.xlsx(output_route, sheet = 1)

# Add existing data to new list and counts
num <- 2:ncol(albm_quan_trks) # Allows demo variables to be copied over but new list and appearances count are the new ones
for (i in nrow(albm_quan_trks):1) {
  for (j in nrow(data_albm):1) {
    if (albm_quan_trks[i, 1] == data_albm[j, 1]) {
      albm_quan_trks[i, num] <- data_albm[j, num]
    }
  }
}

# Export and replace existing list
write.xlsx(albm_quan_trks, output_route, sheetName = "Albums", rowNames = FALSE)

# View(albm_quan_trks)
