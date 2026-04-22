
library(emmeans); library(ggplot2); library(ggpubr)

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
plot(warp.emm, PIs = TRUE, comparisons = TRUE)


pigs.lm <- lm(log(conc + 2) ~ source * factor(percent), data = pigs)
pigs.emm <- emmeans(pigs.lm, ~ percent | source, at = list(source = "fish"))
plot(pigs.emm, type = "scale", breaks = seq(20, 100, by = 10),
     facetlab = "label_value") +
  theme_void() + 
  theme_transparent() +  
  theme(legend.position="none")

ggsave("images/logo_plot.png", width = 4.6, height = 4)
