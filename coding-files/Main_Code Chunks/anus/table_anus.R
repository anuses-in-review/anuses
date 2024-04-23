table_names_anus <- ls()
table_names_anus <- table_names_anus[grepl("^anus_data_", table_names_anus)]

for (i in seq_along(table_names_anus)) {
    # Retrieve anus_data_
    name <- table_names_anus[i]
    obj <- get(name)
    
    # Use only those with play data
    if (!is.na(obj$PlaysN[1])) {

        # Order by PlaysN and remove excess
        obj <- obj[order(obj$PlaysN, decreasing = TRUE), ] # Rank by PlaysN

        # Create new table_
        new_frame <- matrix(NA, nrow = nrow(obj), ncol = 5)
        colnames(new_frame) <- c("Rank", "Order", "Title", "Artist", "Net Plays")
        new_frame <- as.data.frame(new_frame)
        
        new_frame[, 2] <- obj$Order # Order
        new_frame[, 3] <- obj$Title # Title
        new_frame[, 4] <- obj$Artist # Artist
        new_frame[, 5] <- obj$PlaysN # Net Plays
        new_frame[, 5] <- as.numeric(new_frame[, 5])

        new_frame <- brackets_to_list(new_frame, 4)
        new_frame <- add_rank(new_frame, 1, 5, TRUE)
        new_frame <- top_and_bottom_list(new_frame, 5, 1, 5)

        # Re-assign rownames and name
        rownames(new_frame) <- seq(from = 1, to = nrow(new_frame), by = 1)
        anus <- substr(name, nchar(name) - 3, nchar(name))
        table_name <- paste0("table_anus_play_", anus)
        assign(table_name, new_frame)
    } 
}

# View(table_anus_play_2402)
