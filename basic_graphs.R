## Mirkka Puente
## October 25th, 2022
############################ EXERCISES #############################
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
#str(Data)                    

#With these data, using for(), plot graphs to represent the effect 
#of all the numerical variables, from “richness” to “mean_quality” 
#on “yield”. Choose the type of graph that you think better 
#represents this effect for the different species. Create only 
#one pdf with all the graphs inside.

#Open PDF
pdf("Mirkka.pdf", height = 11, width = 8.5)

#Independent variable
x <- Data$mean_yield 

#Dpendent variable
y <- Data[6:12]

#Names of the variables we are gonna measure
variable_name <- colnames(y)

#True/False vectors to divide in different species
field_bean <- Data$crop == 'Field bean'
buckwheat <- Data$crop == 'Buckwheat'
oilseed <- Data$crop == 'Oilseed rape'
strawberry <- Data$crop == 'Strawberry'

#Just combine all T/F vactors for the species
all_crops <- c(field_bean, buckwheat, oilseed, strawberry)

#A vector with the name of the species
name_crops <- c('Field Bean', 'Buckwheat', 'Oilseed rape',
                'Strawberry')

#First loop: goes over each crop (4 in total) 
for (i in 1:4) {
  #Second loop: goes over the 7 variables
  #Plot: variable of interest against yield
  for (j in 1:7) {
    plot(x[all_crops[i]], y[[j]][all_crops[i]], col = i, 
         xlab = "Mean yield ",ylab = variable_name[j])
    title(paste0(name_crops[i]," ",variable_name[j], " scatterplot"))
  }
}
#Close PDF
dev.off()

