## Mirkka Puente
## October 28th, 2022

############################ EXERCISES #############################
#install.packages("ggplot2")

#1. Plot a cheat-sheet with values of color and point type (col =,and 
#pch = ) from 1 to 25, and export it as a jpeg of 15 cm wide, 6 cm
#high and resolution 100 points per cm.

#Open file to create my jpeg
jpeg(filename = "cheat-sheet-R.jpeg", width = 15, height = 6,
     units = "cm", res = 100) 

#Create a cheat-sheet
plot(0, 0, xlim = c(0, 25), ylim = c(0.5, 1.5), ylab = "", xlab = "",
     yaxt = "n", cex = 2)
axis(2, 1, labels = c("col and pch"))

#Put the points
for (i in 1:25) {
  points(i, 1, pch = i, col = i, cex = 2)
}

#close the jpeg image
dev.off()


#2. Plot into a graph ten Poisson distributions with lambda ranging 
#from 1 to 10. Put legend and title. Export it as a .tiff file 
#with size of 15x15 cm

#Open a tiff file
tiff("Poisson_distribution.tiff", width = 15, height = 15, units = "cm", 
     bg = "transparent", res = 150)
# Sequence for the distribution
x <- seq(0, 25, 1)
#Poisson distribution (for empty plot)
y <- dpois(x, lambda = 1:10)
#empty plot
plot(x, y, type = "n")

for (i in 1:10) {
  y <- dpois(x, lambda = i)
  lines(x, y, col=i) 
}

#legend and title for the plot
legend("topright", legend = paste("lambda =", 1:10),lty = 1, col = 1:10)
title(main = "Poisson distributions with lambda = 1-10")

#close the tiff file
dev.off()

#3. Import data from this article: https://peerj.com/articles/328/

#Name of the file
Webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"

#Importing data
Data <- read.table(Webcsv, header = T, sep = ",", skip = 2)
#Verify if the info was exported
#str(Data)                    

#With these data, using for(), plot graphs to represent the effect 
#of all the numerical variables, from richness to mean_quality
#on yield. Choose the type of graph that you think better 
#represents this effect for the different species. Create only 
#one pdf with all the graphs inside.

#Open PDF
pdf("Scatterplots_MP.pdf", height = 11, width = 8.5)

#Independent variable
x <- Data$mean_yield 

#Dependent variables
y <- Data[6:12]

#Names of the variables we are gonna measure
variable_name <- colnames(y)


#Vector with the name of the crops as factors
Crops <- as.factor(Data$crop)

#call ggplot lib
library("ggplot2")

#Scatterplot for mean yield vs. richness

a <- ggplot(Data, aes(x=x, y=y[[1]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

a + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[1]), 
         x = "Mean yield", 
         y = variable_name[1], 
         color = "Crops")
 
#Scatterplot for mean yield vs. Total visits

b <- ggplot(Data, aes(x=x, y=y[[2]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

b + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[2]), 
         x = "Mean yield", 
         y = variable_name[2], 
         color = "Crops")


#Scatterplot for mean yield vs. honeybee visits

c <- ggplot(Data, aes(x=x, y=y[[3]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

c + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[3]), 
         x = "Mean yield", 
         y = variable_name[3], 
         color = "Crops")

#Scatterplot for mean yield vs. Bumblebee visits

d <- ggplot(Data, aes(x=x, y=y[[4]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

d + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[4]), 
         x = "Mean yield", 
         y = variable_name[4], 
         color = "Crops")

#Scatterplot for mean yield vs. Hoverfly visits

e <- ggplot(Data, aes(x=x, y=y[[5]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

e + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[5]), 
         x = "Mean yield", 
         y = variable_name[5], 
         color = "Crops")

#Scatterplot for mean yield vs. Wild bee visits

f <- ggplot(Data, aes(x=x, y=y[[6]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

f + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[6]), 
         x = "Mean yield", 
         y = variable_name[6], 
         color = "Crops")

#Scatterplot for mean yield vs. mean quality

g <- ggplot(Data, aes(x=x, y=y[[7]], color=factor(Crops))) +
  geom_point() + 
  geom_smooth(method=lm, se = FALSE)+
  scale_shape_manual(values=c(3, 16, 17, 19))+ 
  scale_color_manual(values=c('black','red', 'blue', "green"))+
  theme(legend.position="right")+
  scale_color_brewer(palette="Dark2")

g + labs(title = paste0("Scatterplot of Mean yield vs. ", 
                        variable_name[7]), 
         x = "Mean yield", 
         y = variable_name[7], 
         color = "Crops")

#Close PDF
dev.off()