brackets_to_list <- function(data, colReplace) { # Removes []s and adds commas
    for (i in nrow(data):1) {
        # Replace ][ with ,
        pattern1 <- "\\]\\["
        data[i, colReplace] <- ifelse(grepl(pattern1, data[i, colReplace]), gsub(pattern1, ", ", data[i, colReplace]), data[i, colReplace])
        
        # Remove [s
        pattern2 <- "\\["
        data[i, colReplace] <- ifelse(grepl(pattern2, data[i, colReplace]), gsub(pattern2, "", data[i, colReplace]), data[i, colReplace])
        
        # Remove ]s
        pattern3 <- "\\]"
        data[i, colReplace] <- ifelse(grepl(pattern3, data[i, colReplace]), gsub(pattern3, "", data[i, colReplace]), data[i, colReplace])
    }

    return(data)
}

add_brackets <- function(data, colAdd) { # Adds missing []s resulting from a split
    data <- as.data.frame(data)
    for (i in nrow(data):1) {
        if (!grepl("\\[", data[i, colAdd])) {
            data[i, colAdd] <- paste0("[", data[i, colAdd])
        }
        if (!grepl("\\]", data[i, colAdd])) {
            data[i, colAdd] <- paste0(data[i, colAdd], "]")
        }
    }

    return(data)
}

list_to_brackets <- function(data, colReplace) { # Removes commas and adds brackets
    # Add [ at beginning and ] at end
    data <- add_brackets(data, colReplace)

    # Replace commas
    for (i in nrow(data):1) {
        pattern1 <- ", "
        data[i, colReplace] <- ifelse(grepl(pattern1, data[i, colReplace]), gsub(pattern1, "\\]\\[", data[i, colReplace]), data[i, colReplace])
    }
    
    return(data)
}

top_and_bottom_list <- function(data, top, colRank, colMeasure) { # Makes Top X list with bottom 1
    # Check that `top` isn't too big
    if (top > nrow(data)) {
        top <- nrow(data) # Re-assign to the maximum if too big
    }

    # Allow for ties in colRank
    for (i in 2:nrow(data)) {
        num <- i - 1
        if (data[i, colMeasure] == data[num, colMeasure]) {
            data[i, colRank] <- data[num, colRank]
        }
    }

    # Limit to `top` and bottom 1
    num1 <- top + 1
    if (max(data[, 1], na.rm = TRUE) > num1) {
        for (i in nrow(data):1) {
            max <- as.numeric(max(as.numeric(data[, colRank]), na.rm = TRUE))
            num <- nrow(data) - 1
            data[num, ] <- 0
            if (as.numeric(data[i, colRank]) > as.numeric(top) && as.numeric(data[i, colRank]) < max) {
                data <- data[-i, ]
            }
        }
        data[num, ] <- "..."
    }

    # Re-assign rownames
    rownames(data) <- seq(from = 1, to = nrow(data), by = 1)

    return(data)
}

top_list <- function(data, top, colRank, colMeasure) { # Makes Top X list
    # Check that `top` isn't too big
    if (top > nrow(data)) {
        top <- nrow(data) # Re-assign to the maximum if too big
    }

    # Allow for ties in colRank
    for (i in 2:nrow(data)) {
        num <- i - 1
        if (data[i, colMeasure] == data[num, colMeasure]) {
            data[i, colRank] <- data[num, colRank]
        }
    }

    # Keep those in `top` range
    for (i in nrow(data):1) {
        max <- max(data[, colRank], na.rm = TRUE)
        if (data[i, colRank] > top) {
            data <- data[-i, ]
        }
    }

    # Re-assign rownames
    rownames(data) <- seq(from = 1, to = nrow(data), by = 1)

    return(data)
}

top_list_with_commas <- function(data, top, colRank, colMeasure, colForCommas) { # Makes Top X list with Rank ties merged using commas
    data <- top_list(data, top, colRank, colMeasure)

    for (i in nrow(data):2) {
        num <- i - 1
        if (data[i, colRank] == data[num, colRank]) {
            data[num, colForCommas] <- paste0(data[num, colForCommas], ", ", data[i, colForCommas])
            data <- data[-i, ]
        }
    }

    # Re-assign rownames
    rownames(data) <- seq(from = 1, to = nrow(data), by = 1)

    return(data)
}

add_rank <- function(data, colRank, colMeasure, decreasing) {
    data <- data[order(as.numeric(data[, colMeasure]), decreasing = decreasing), ]
    data[, colRank] <- seq(from = 1, to = nrow(data), by = 1)

    for (i in 2:nrow(data)) {
        num <- i - 1
        if (data[i, colMeasure] == data[num, colMeasure]) {
            data[i, colRank] <- data[num, colRank]
        }
    }

    rownames(data) <- seq(from = 1, to = nrow(data), by = 1)
    return(data)
}

decimal_to_percent <- function(data, rowStart, rowEnd, colStart, colEnd, digits) {
    sample <- data[rowStart:rowEnd, colStart:colEnd]

    # For XX.XX to XX.XX%
    if (max(sample, na.rm = TRUE) > 1) {
        for (i in rowEnd:rowStart) {
            for (j in colEnd:colStart) {
                data[i, j] <- paste0(round(as.numeric(data[i, j]), digits = digits), "%")
            }
        }
    }

    # For 0.XXXX to XX.XX%
    if (max(sample, na.rm = TRUE) <= 1) {
        for (i in rowEnd:rowStart) {
            for (j in colEnd:colStart) {
                data[i, j] <- paste0(round(as.numeric(data[i, j]) * 100, digits = digits), "%")
            }
        }
    }
    
    return(data)
}

add_average_row <- function(data, source_data, colLabel, label, colEnd, colStart, digits, wantPerc) {
    data[nrow(data) + 1, colLabel] <- label

    for (j in colEnd:colStart) {
        if (wantPerc == TRUE) {
            avg <- (as.numeric(sum(source_data[, j], na.rm = TRUE)) / nrow(source_data) * 100)
            data[nrow(data), j] <- round(avg, digits = digits + 2)
        } else {
            avg <- as.numeric(sum(source_data[, j], na.rm = TRUE)) / nrow(source_data)
            data[nrow(data), j] <- round(avg, digits = digits)
        }
    }

    return(data)
}

nowrames <- function(data) {
    rownames(data) <- seq(from = 1, to = nrow(data), by = 1)

    return(data)
}
