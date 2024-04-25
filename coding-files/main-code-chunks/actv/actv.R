# View(data_actv)

data_actv[, 1] <- as.Date(data_actv[, 1], origin = "1899-12-30") # Date
data_actv[, 6] <- as.Date(data_actv[, 6], origin = "1899-12-30") # MostRecDate


