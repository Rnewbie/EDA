library(RCurl)
library(ggplot2)
library(cowplot)

link <- "https://raw.githubusercontent.com/cdmbi/FPD/master/data/FPD-non-redundant-processed.csv"
x <- getURL(link)
data <- read.csv(text = x, header = TRUE)
species <- data$species
excitation <- data$excitation_new
emission <- data$emission_new
excitation_color <- data$excitation_color_new
emission_color <- data$emission_color_new
oligomerization <- data$oligomerization_state

df <- data.frame(excitation, emission, species, excitation_color, emission_color, oligomerization)
head(df, 5)
label <- c("Excitation (nm)", "Emission (nm)", "Species", "Excitation Color", "Emission Color", "Oligomerization")
colnames(df) <- label
df_new <- na.omit(df)

Species_plot <- ggplot(df_new, aes(x= df_new[, 1], y = df_new[, 2])) + 
  geom_point(aes(color = factor(df_new[, 3]))) + 
  xlab("Excitation (nm)") + ylab("Emission (nm)")

Emission <- ggplot(df_new, aes(x = df_new[, 1], y = df_new[, 2])) + 
  geom_point(aes(color = factor(df_new[, 5]))) + 
  xlab("Excitaiton (nm)") +
  ylab("Emission (nm)")

Excitation <- ggplot(df_new, aes(x = df_new[, 1], y = df_new[, 2])) +
  geom_point(aes(color = factor(df_new[, 4]))) + 
  xlab("Excitation (nm)") + 
  ylab("Emission (nm)")

unique(species)
