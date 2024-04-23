# Objects I'll use below
# View(data_play) # For all data including PlaysN
# View(gend_quan) # For list of unique(Anus)

for (i in nrow(gend_quan):1) {
    new_frame <- data_play
    for (n in nrow(new_frame):1) {
        # Isolate Anus-specific data
        if (new_frame$Anus[n] != gend_quan$Anus[i]) {
            new_frame <- new_frame[-n, ]
        }

        frame_name <- paste0("anus_data_", gend_quan$Anus[i])
        assign(frame_name, new_frame)
    }
}

print("anus_data -- I think that this can be simplified! Why are we using gend_quan specifically?")

rm(new_frame)
rm(frame_name)
