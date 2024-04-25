## skin_perc Skin variables as a percentage at the Anus level ##

# Same process as for gend_perc

skin_perc <- skin_quan

for (i in nrow(skin_perc):1) {
  total <- sum(skin_perc[i, 2:ncol(skin_perc)], na.rm = TRUE)
  for (j in ncol(skin_perc):2) {
    skin_perc[i, j] <- (skin_perc[i, j] / total) * 100
  }
}

# View(skin_perc)

## skin_perc_year Skin variables as a percentage at the Year level ##

# Same process as for gend_perc_year

skin_perc_year <- as.data.frame(skin_quan_year)
colnames(skin_perc_year) <- colnames(skin_quan_year)

for (i in nrow(skin_perc_year):1) {
  total <- sum(skin_quan_year[i, 2:ncol(skin_quan_year)], na.rm = TRUE)
  for (j in ncol(skin_perc_year):2) {
    skin_perc_year[i, j] <- (skin_quan_year[i, j] / total) * 100
  }
}

# View(skin_perc_year)

rm(i)
rm(j)
rm(total)