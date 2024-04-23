## table_gend_quan_year Gend variables summed by Year with averages included ##

table_gend_quan_year <- gend_quan_year
table_gend_quan_year <- add_average_row(table_gend_quan_year, gend_quan_year, 1, "Avg.", ncol(table_gend_quan_year), 2, 0, FALSE)

# View(table_gend_quan_year)

## table_gend_perc_year Gend variables as a percentage by Year with averages included ##

table_gend_perc_year <- gend_perc_year
table_gend_perc_year <- add_average_row(table_gend_perc_year, gend_perc_year, 1, "Avg.", ncol(table_gend_perc_year), 2, 2, FALSE)
table_gend_perc_year <- decimal_to_percent(table_gend_perc_year, 1, nrow(table_gend_perc_year), 2, ncol(table_gend_perc_year), 2)

# View(table_gend_perc_year)
