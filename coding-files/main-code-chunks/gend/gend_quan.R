## gend_quan Gend variables summed at the Anus level ##

gend_quan_int <- matrix(0, nrow = nrow(data_anuses), ncol = 7)
colnames(gend_quan_int) <- c("Anus", "Order", "Title", "Vocals", "Men", "Women", "Other")
gend_quan_int <- as.data.frame(gend_quan_int)

gend_quan_int[, 1:3] <- data_anuses[, 1:3] # Anus, Order, Title
gend_quan_int[, 4] <- data_anuses[, 10] # Vocals

# Summing Gend variables for each song
for (i in nrow(gend_quan_int):1) {
  for (n in nrow(vocs_quan):1) {
    if (grepl(vocs_quan[n, 1], gend_quan_int[i, 4], fixed = TRUE)) {
      gend_quan_int[i, 5] <- as.numeric(gend_quan_int[i, 5]) + as.numeric(vocs_quan[n, 8]) # Men
      gend_quan_int[i, 6] <- as.numeric(gend_quan_int[i, 6]) + as.numeric(vocs_quan[n, 9]) # Women
      gend_quan_int[i, 7] <- as.numeric(gend_quan_int[i, 7]) + as.numeric(vocs_quan[n, 10]) # Other
    }
  }
}

# View(gend_quan_int)

gend_quan <- matrix(0, nrow = length(unique(gend_quan_int[, 1])), ncol = 4)
colnames(gend_quan) <- c("Anus", "Men", "Women", "Other")
gend_quan <- as.data.frame(gend_quan)

gend_quan[, 1] <- unique(gend_quan_int[, 1]) # Each Anus

# Summing Gend variables for each Anus
for (i in nrow(gend_quan):1) {
  for (n in nrow(gend_quan_int):1) {
    if (grepl(gend_quan_int[n, 1], gend_quan[i, 1], fixed = TRUE)) {
      gend_quan[i, 2] <- as.numeric(gend_quan[i, 2]) + as.numeric(gend_quan_int[n, 5]) # Men
      gend_quan[i, 3] <- as.numeric(gend_quan[i, 3]) + as.numeric(gend_quan_int[n, 6]) # Women
      gend_quan[i, 4] <- as.numeric(gend_quan[i, 4]) + as.numeric(gend_quan_int[n, 7]) # Other
    }
  }
}

# View(gend_quan)

## gend_quan_year Gend variables summed at the Year level ##

gend_quan_year_int <- as.data.frame(gend_quan)

# Remove month from each Anus
for (i in nrow(gend_quan_year_int):1) {
  gend_quan_year_int[i, 1] <- substr(gend_quan_year_int[i, 1], 1, nchar(gend_quan_year_int[i, 1]) - 2)
}

# View(gend_quan_year_int)

gend_quan_year <- matrix(0, nrow = length(unique(gend_quan_year_int[, 1])), ncol = 4)
colnames(gend_quan_year) <- c("Year", "Men", "Women", "Other")
gend_quan_year <- as.data.frame(gend_quan_year)

gend_quan_year[, 1] <- unique(gend_quan_year_int[, 1]) # Each Year without 20

# Summing Gend variables for each Year
for (i in nrow(gend_quan_year):1) {
  for (n in nrow(gend_quan_year_int):1) {
    if (grepl(gend_quan_year_int[n, 1], gend_quan_year[i, 1], fixed = TRUE)) {
      gend_quan_year[i, 2] <- as.numeric(gend_quan_year[i, 2]) + as.numeric(gend_quan_year_int[n, 2]) # Men
      gend_quan_year[i, 3] <- as.numeric(gend_quan_year[i, 3]) + as.numeric(gend_quan_year_int[n, 3]) # Women
      gend_quan_year[i, 4] <- as.numeric(gend_quan_year[i, 4]) + as.numeric(gend_quan_year_int[n, 4]) # Other
    }
  }
  gend_quan_year[i, 1] <- paste0("20", gend_quan_year[i, 1]) # Put 20 into Year
}

gend_quan_year[, 1] <- as.numeric(gend_quan_year[, 1])

# View(gend_quan_year)

rm(gend_quan_year_int)
rm(i)
rm(n)