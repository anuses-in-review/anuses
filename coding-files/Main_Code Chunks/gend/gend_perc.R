## gend_perc Gend variables as a percentage at the Anus level ##

gend_perc <- gend_quan

# Converting gend_quan to percentage
for (i in nrow(gend_perc):1) {
  total <- sum(gend_perc[i, 2:ncol(gend_perc)], na.rm = TRUE) # Anus total
  for (j in ncol(gend_perc):2) {
    gend_perc[i, j] <- (gend_perc[i, j] / total)
  }
}

# View(gend_perc)

## gend_perc_year Gend variables as a percentage at the Year level ##

gend_perc_year <- as.data.frame(gend_quan_year)
colnames(gend_perc_year) <- c("Year", "Men", "Women", "Other")

# Converting gend_quan_year to percentage
for (i in nrow(gend_perc_year):1) {
  total <- sum(gend_quan_year[i, 2:ncol(gend_quan_year)], na.rm = TRUE) # Year total
  for (j in ncol(gend_perc_year):2) {
    gend_perc_year[i, j] <- (gend_quan_year[i, j] / total)
  }
}

# View(gend_perc_year)

rm(i)
rm(j)
rm(total)