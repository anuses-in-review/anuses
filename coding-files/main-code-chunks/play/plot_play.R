## plot_play_quan Average PlaysN at the Anus level bar and line chart ##

data <- play_quan
data[, 1] <- as.character(data[, 1])

color_bar <- c("#C21807")
color_line <- c("#0047AB")

coeff_plot_play_quan <- max(data[, 3], na.rm = TRUE) / max(data[, 4], na.rm = TRUE)

plot_play_quan <- ggplot(data, aes(x = Anus)) +
  geom_bar(aes(y = Avg), stat = "identity", fill = color_bar) +
  geom_line(aes(y = Count / coeff_plot_play_quan, group = 1), color = color_line, linewidth = 1) +
  scale_y_continuous(
    name = "Average Net Plays (Per Song)",
    sec.axis = sec_axis(~.*coeff_plot_play_quan, name = "Number of Songs")
  ) +
  theme(
    aspect.ratio = 2.625 / 3.75,
    axis.title.y = element_text(color = color_bar),
    axis.title.y.right = element_text(color = color_line),
    axis.text.x = element_text(size = 6, angle = 45, hjust = 1)
  ) +
  ggtitle("Average Net Plays by Anus") +
  ggeasy::easy_center_title()

# plot_play_quan

## plot_play_quan_year Average PlaysN at the Year level bar and line chart ##

data <- play_quan_year
data[, 1] <- as.character(data[, 1])

color_bar <- c("#C21807")
color_line <- c("#0047AB")

coeff_plot_play_quan_year <- max(data[, 5], na.rm = TRUE) / max(data[, 4], na.rm = TRUE)

plot_play_quan_year <- ggplot(data, aes(x = Year)) +
  geom_bar(aes(y = PlaysNAvg), stat = "identity", fill = color_bar) +
  geom_line(aes(y = CountAvg / coeff_plot_play_quan_year, group = 1), color = color_line, linewidth = 1) +
  scale_y_continuous(
    name = "Average Net Plays (Per Song)",
    sec.axis = sec_axis(~.*coeff_plot_play_quan_year, name = "Average Number of Songs")
  ) +
  theme(
    aspect.ratio = 2.625 / 3.75,
    axis.title.y = element_text(color = color_bar),
    axis.title.y.right = element_text(color = color_line)
  ) +
  ggtitle("Average Net Plays by Year") +
  ggeasy::easy_center_title()

# plot_play_quan_year

## plot_play_quan_hist PlaysN histogram ##

data <- as.numeric(data_play$PlaysN)
data <- as.data.frame(data)

color_bar <- c("#c21807")
color_border <- c("#ebebeb")

plot_play_quan_hist <- ggplot(data, aes(x = data)) + 
  geom_histogram(
    binwidth = 10, 
    fill = color_bar,
    color = color_border
  ) +
  labs(
    x = "Frequency",
    y = "Net Plays"
  ) +
  theme(
    aspect.ratio = 2.625 / 3.75
  ) +
  ggtitle("Net Plays Frequency Distribution") +
  ggeasy::easy_center_title()


# plot_play_quan_hist

