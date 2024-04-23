data <- skin_perc_year
data_melt <- melt(data, id.vars = "Year")

colors <- c(
  "Skin1" = "#FAD6AD",
  "Skin2" = "#F6B05F",
  "Skin3" = "#D1750A",
  "Skin4" = "#5D3404",
  "Skin5" = "#361E02"
)

plot_skin_perc_year <- ggplot(data_melt, aes(x = Year, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(x = "Year",
       y = "Percentage",
       fill = "Groups") +
  scale_fill_manual(values = colors, name = "Skin Tones") +
  scale_y_continuous(labels = scales::percent) +
  theme(
        # legend.position = c(0.98, 0.20),
        # legend.justification = c("right", "top"),
        legend.position = "none",
        aspect.ratio = 2.625 / 3.75
    ) +
  ggtitle("Skin Tone by Year") +
  ggeasy::easy_center_title()

# plot_skin_perc_year

data <- skin_perc
data_melt <- melt(data, id.vars = "Anus")
data_melt[, 1] <- as.character(data_melt[, 1])

plot_skin_perc <- ggplot(data_melt, aes(x = Anus, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(x = "Anus",
       y = "Percentage",
       fill = "Groups") +
  scale_fill_manual(values = colors, name = "Skin Tones") +
  scale_y_continuous(labels = scales::percent) +
  theme(
        # legend.position = c(0.98, 0.20),
        # legend.justification = c("right", "top"),
        legend.position = "none",
        aspect.ratio = 2.625 / 6,
        axis.text.x = element_text(size = 4, angle = 45, hjust = 1)
    ) +
  ggtitle("Skin Tone by Anus") +
  ggeasy::easy_center_title()

# plot_skin_perc