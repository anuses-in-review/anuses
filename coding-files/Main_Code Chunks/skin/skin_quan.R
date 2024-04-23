## skin_quan Skin variables summed at the Anus level ##

# Same process as for gend_quan

skin_quan_int <- matrix(0, nrow = nrow(data_anuses), ncol = 9)
colnames(skin_quan_int) <- c("Anus", "Order", "Title", "Vocals", "Skin1", "Skin2", "Skin3", "Skin4", "Skin5")
skin_quan_int <- as.data.frame(skin_quan_int)

skin_quan_int[, 1:3] <- data_anuses[, 1:3]
skin_quan_int[, 4] <- data_anuses[, 10]

for (i in nrow(skin_quan_int):1) {
  for (n in nrow(vocs_quan):1) {
    if (grepl(vocs_quan[n, 1], skin_quan_int[i, 4], fixed = TRUE)) {
      skin_quan_int[i, 5] <- as.numeric(skin_quan_int[i, 5]) + as.numeric(vocs_quan[n, 3])
      skin_quan_int[i, 6] <- as.numeric(skin_quan_int[i, 6]) + as.numeric(vocs_quan[n, 4])
      skin_quan_int[i, 7] <- as.numeric(skin_quan_int[i, 7]) + as.numeric(vocs_quan[n, 5])
      skin_quan_int[i, 8] <- as.numeric(skin_quan_int[i, 8]) + as.numeric(vocs_quan[n, 6])
      skin_quan_int[i, 9] <- as.numeric(skin_quan_int[i, 9]) + as.numeric(vocs_quan[n, 7])
    }
  }
}

# View(skin_quan_int)

skin_quan <- matrix(0, nrow = length(unique(skin_quan_int[, 1])), ncol = 6)
colnames(skin_quan) <- c("Anus", "Skin1", "Skin2", "Skin3", "Skin4", "Skin5")
skin_quan <- as.data.frame(skin_quan)

skin_quan[, 1] <- unique(skin_quan_int[, 1])

for (i in nrow(skin_quan):1) {
  for (n in nrow(skin_quan_int):1) {
    if (grepl(skin_quan_int[n, 1], skin_quan[i, 1], fixed = TRUE)) {
      skin_quan[i, 2] <- as.numeric(skin_quan[i, 2]) + as.numeric(skin_quan_int[n, 5])
      skin_quan[i, 3] <- as.numeric(skin_quan[i, 3]) + as.numeric(skin_quan_int[n, 6])
      skin_quan[i, 4] <- as.numeric(skin_quan[i, 4]) + as.numeric(skin_quan_int[n, 7])
      skin_quan[i, 5] <- as.numeric(skin_quan[i, 5]) + as.numeric(skin_quan_int[n, 8])
      skin_quan[i, 6] <- as.numeric(skin_quan[i, 6]) + as.numeric(skin_quan_int[n, 9])
    }
  }
}

# View(skin_quan)

## skin_quan_year Skin variables summed at the Year level ##

# Same process as for gend_quan_year

skin_quan_year_int <- as.data.frame(skin_quan)

for (i in nrow(skin_quan_year_int):1) {
  skin_quan_year_int[i, 1] <- substr(skin_quan_year_int[i, 1], 1, nchar(skin_quan_year_int[i, 1]) - 2)
}

# View(skin_quan_year_int)

skin_quan_year <- matrix(0, nrow = length(unique(skin_quan_year_int[, 1])), ncol = 6)
colnames(skin_quan_year) <- c("Year", "Skin1", "Skin2", "Skin3", "Skin4", "Skin5")
skin_quan_year <- as.data.frame(skin_quan_year)

skin_quan_year[, 1] <- unique(skin_quan_year_int[, 1])

for (i in nrow(skin_quan_year):1) {
  for (n in nrow(skin_quan_year_int):1) {
    if (grepl(skin_quan_year_int[n, 1], skin_quan_year[i, 1], fixed = TRUE)) {
      skin_quan_year[i, 2] <- as.numeric(skin_quan_year[i, 2]) + as.numeric(skin_quan_year_int[n, 2])
      skin_quan_year[i, 3] <- as.numeric(skin_quan_year[i, 3]) + as.numeric(skin_quan_year_int[n, 3])
      skin_quan_year[i, 4] <- as.numeric(skin_quan_year[i, 4]) + as.numeric(skin_quan_year_int[n, 4])
      skin_quan_year[i, 5] <- as.numeric(skin_quan_year[i, 5]) + as.numeric(skin_quan_year_int[n, 5])
      skin_quan_year[i, 6] <- as.numeric(skin_quan_year[i, 6]) + as.numeric(skin_quan_year_int[n, 6])
    }
  }
  skin_quan_year[i, 1] <- paste0("20", skin_quan_year[i, 1])
}

skin_quan_year[, 1] <- as.numeric(skin_quan_year[, 1])

# View(skin_quan_year)

rm(skin_quan_year_int)
rm(skin_quan_int)
rm(n)
rm(i)