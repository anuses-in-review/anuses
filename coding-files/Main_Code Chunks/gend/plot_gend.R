## plot_gend_perc_year Gender by Year stacked bar chart ##

data <- gend_perc_year
data_melt <- melt(data, id.vars = "Year")

colors <- c(
  "Men" = "#3475F8",
  "Women" = "#E24E98",
  "Other" = "#7BC62D")

plot_gend_perc_year <- ggplot(data_melt, aes(x = Year, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(x = "Year",
       y = "Percentage",
       fill = "Groups") +
  scale_fill_manual(values = colors, name = "Genders") +
  scale_y_continuous(labels = scales::percent) +
  theme(
        # legend.position = c(0.98, 0.20),
        # legend.justification = c("right", "top"),
        legend.position = "none",
        aspect.ratio = 2.625 / 3.75
    ) +
  ggtitle("Gender by Year") +
  ggeasy::easy_center_title()

# plot_gend_perc_year

## plot_gend_perc Gender by Anus stacked bar chart ##

data <- gend_perc
data_melt <- melt(data, id.vars = "Anus")
data_melt[, 1] <- as.character(data_melt[, 1])

plot_gend_perc <- ggplot(data_melt, aes(x = Anus, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "fill") +
  labs(x = "Anus",
       y = "Percentage",
       fill = "Groups") +
  scale_fill_manual(values = colors, name = "Genders") +
  scale_y_continuous(labels = scales::percent) +
  theme(
        # legend.position = c(0.98, 0.20),
        # legend.justification = c("right", "top"),
        legend.position = "none",
        aspect.ratio = 2.625 / 6,
        axis.text.x = element_text(size = 4, angle = 45, hjust = 1)
    ) +
  ggtitle("Gender by Anus") +
  ggeasy::easy_center_title()

# plot_gend_perc