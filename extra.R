
library(emmeans); library(ggplot2); library(ggpubr)

# warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
# warp.emm <- emmeans(warp.lm, ~ tension | wool)
# plot(warp.emm, PIs = TRUE, comparisons = TRUE)


pigs.lm <- lm(log(conc + 2) ~ source * factor(percent), data = pigs)
pigs.emm <- emmeans(pigs.lm, ~ percent | source, at = list(source = "fish"))
plot(pigs.emm, type = "scale", breaks = seq(20, 100, by = 10),
     facetlab = "label_value") +
  theme_void() + 
  theme_transparent() +  
  theme(legend.position="none")

ggsave("images/logo_plot.png", width = 4.6, height = 4)




id = "#FDDC5C"
ia = "#ffcd00"

dat <- data.frame(x = c(1,1), y = c(1, 2), label = c("Iowa", "Idaho"))

# Plotting
ggplot(dat, aes(x = x, y = y, fill = label)) +
  geom_tile(width = 0.9, height = 0.9) +  
  scale_fill_manual(values = c(id, ia)) + 
  coord_fixed() + 
  guides(fill = "none") + 
  geom_text(aes(label = label), fontface = "bold", size = 12) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "transparent", color = NA),
        plot.background = element_rect(fill = "transparent", colour = NA))

ggsave("images/colors.png", width = 3.2, height = 5, bg = "transparent")
