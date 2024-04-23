# Convert data.frame to data.table so I can split
setDT(data_anuses)

# Create new data.table with Title and Vocals (split across rows)
vocs_list <- data_anuses[, .(Names = unlist(strsplit(gsub("[\\[\\]]", "", Vocals), "\\]\\["))), by = .(Title)]

# Adding missing []s where missing in vocs_list
vocs_list <- as.data.frame(vocs_list)
vocs_list <- add_brackets(vocs_list, 2)

# Create new matrix with vocs_list names and columns for demographics
vocs_demo <- matrix(NA, nrow = nrow(vocs_list), ncol = 10)
vocs_demo[, 1] <- vocs_list[, 2] # Names (split)
vocs_demo <- vocs_demo[order(vocs_demo[, 1]), ] # Put in alphabetical order

# Create new matrix with vocs_demo unique entries and number of appearances
vocs_quan <- matrix(NA, ncol = ncol(vocs_demo))
vocs_quan <- unique(vocs_demo, by = vocs_demo[, 1]) # Unique names only
vocs_quan[, 2] <- as.numeric(table(vocs_demo[, 1])) # Number of appearances
vocs_quan <- as.data.frame(vocs_quan)
colnames(vocs_quan) <- c("Name", "Appearances", "Skin1", "Skin2", "Skin3", "Skin4", "Skin5", "GendM", "GendW", "GendO")

# Import existing list
temp_route <- here("Excel", "Art_List_Backup.xlsx") # Just in case it fucks up
output_route <- here("Excel", "Art_List.xlsx")
data_vocs <- read.xlsx(output_route, sheet = 1)

# Add existing data to new list and counts
num <- 3:ncol(vocs_quan) # Allows demo variables to be copied over but new list and appearances count are the new ones
for (i in nrow(vocs_quan):1) {
  for (j in nrow(data_vocs):1) {
    if (vocs_quan[i, 1] == data_vocs[j, 1]) {
      vocs_quan[i, num] <- data_vocs[j, num]
    }
  }
}

# Export and replace existing list
write.xlsx(vocs_quan, output_route, sheetName = "Demographics", rowNames = FALSE)

# View(vocs_quan)

rm(vocs_list)
rm(vocs_demo)
rm(num)
rm(output_route)
rm(temp_route)