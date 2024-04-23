table_skin_quan_year <- skin_quan_year
table_skin_quan_year[nrow(table_skin_quan_year) + 1, 1] <- "Avg."
for (j in ncol(table_skin_quan_year):2) {
  table_skin_quan_year[nrow(table_skin_quan_year), j] <- round(sum(skin_quan_year[, j], na.rm = TRUE) / nrow(skin_quan_year), digits = 0)
}

# View(table_skin_quan_year)

## table_skin_perc_year Skin variables as a percentage by Year with averages included ##

table_skin_perc_year <- skin_perc_year
for (i in nrow(table_skin_perc_year):1) {
  for (j in ncol(table_skin_perc_year):2) {
    table_skin_perc_year[i, j] <- paste0(round(as.numeric(table_skin_perc_year[i, j]), digits = 2), "%")
  }
}
table_skin_perc_year[nrow(table_skin_perc_year) + 1, 1] <- "Avg."
for (j in ncol(table_skin_perc_year):2) {
  table_skin_perc_year[nrow(table_skin_perc_year), j] <- paste0(round(sum(skin_perc_year[, j], na.rm = TRUE) / nrow(skin_perc_year), digits = 2), "%")
}

# View(table_skin_perc_year)

rm(i)
rm(j)