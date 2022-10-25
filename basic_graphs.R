## Mirkka Puente
## October 25th, 2022
############################ EXERCISES #############################
#1. Plot a cheat-sheet with values of color and point type (col =,and 
#pch = ) from 1 to 25, and export it as a jpeg of 15 cm wide, 6 cm
#high and resolution 100 points per cm.
jpeg(filename = "cheat-sheet-R.jpeg", width = 15, height = 6,
     units = "cm", res = 100)  
plot(0, 0, xlim = c(0, 25), ylim = c(0.5, 1.5), ylab = "", xlab = "",
     yaxt = "n", cex = 2)
axis(2, 1, labels = c("col and pch"))
for (i in 1:25) {
  points(i, 1, pch = i, col = i, cex = 2)
}
dev.off()


#2. Plot into a graph ten Poisson distributions with lambda ranging 
#from 1 to 10. Put legend and title. Export it as a .tiff file 
#with size of 15x15 cm

tiff("Poisson_distribution.tiff", width = 15, height = 15, units = "cm", 
     bg = "transparent", res = 150)
# Sequence
x <- seq(0, 25, 1)  
y <- dpois(x, lambda = 1:10)
#empty graph
plot(x, y, type = "n")

for (i in 1:10) {
  y <- dpois(x, lambda = i)
  lines(x, y, col=i) 
}

legend("topright", legend = paste("lambda =", 1:10),lty = 1, col = 1:10)
title(main = "Poisson distributions with lambda = 1-10")
dev.off()

#3. Import data from this article: https://peerj.com/articles/328/

#Importing data
Webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
Data <- read.table(Webcsv, header = T, sep = ",", skip = 2)
str(Data)                    

#With these data, using for(), plot graphs to represent the effect 
#of all the numerical variables, from “richness” to “mean_quality” 
#on “yield”. Choose the type of graph that you think better 
#represents this effect for the different species. Create only 
#one pdf with all the graphs inside.
pdf("MP_pdf.pdf", height = 20, width = 10)
x <- Data$mean_yield 
y <- Data[6:12]
name = colnames(y)

#empty graph
for (i in 1:7) {
  plot(x, y[[i]], xlab = "Mean yield", ylab = name[i])
}
dev.off()

