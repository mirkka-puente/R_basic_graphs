# MP
# October 18th, 2022

#Install packages (to be run first and one time only)
#install.packages("writexl")
library(writexl)

#################### EXERCISES ###################
#1. Open the data frame in iris {datasets}. Use the help to know 
#about this data. In which units are measured the length and width 
#of sepals and petals? How many variables and observations are there
#in iris?

#Open the data frame
iris
data(iris)
#Help to know more about the data
help(iris)
#which units are measured the length and width of sepals and petals?
# Solution: centimeters
#How many variables and observations?
# Solution: observation = 150  and variables = 5

#2. Create a vector with the species names. Remember that genus should 
#be with capital letters and species in small letters 
#(e.g. “Iris setosa”).

#vector with species name only (use levels)
species_name <- levels(iris$Species)

#vector with genus and species
genus_species_name <- paste0("Iris ", species_name)

#3.Create a vector with the name of all quantitative variables

#names of columns
cols <- colnames(iris, do.NULL = TRUE, prefix = "col")

#select the quantitative variables
quantitative_variables <- cols[1:4]

#4. Make a data frame with the combination of the two previous vectors
#Repeat the names of the genus
a <- c(rep(genus_species_name[1], times = 4))
b <- c(rep(genus_species_name[2], times = 4))
c <- c(rep(genus_species_name[3], times = 4))

#create the vector with all of the vectors of repetition
all_genus_species <- c(a, b, c)

#create the vector with the quantitative vector repetition
all_quantitative_variables <- rep(quantitative_variables[1:4], 3)

#Create the data frame
data <- data.frame(all_genus_species, all_quantitative_variables)


#5. Using data frame from exercise 4, make a data frame with the following variables:

#Species.
#Variable.
#Mean, the mean for each variable and species.
#Standard_error, the standard error for each variable and species.
#Median, the median for each variable and species.
#Minimum, the minimum for each variable and species.
#Maximum, the maximum for each variable and species.

#Create the data table
dt <- as.data.frame(matrix(nrow = 12, ncol = 7))
names(dt) <- c("Species",'Variables', "Mean", 
                 "Standard_error",
                 "Median",
               'Minimum',
               'Maximum')


#Empty vector for variables
means <- c()
standard_errors <- c()
medians <- c()
mins <- c()
maxs <- c()

#Length of the vector for species
l <- length(iris$Species)/length(species_name)

#For loops to get variables for columns
for (sp in levels(iris$Species)){
  for (i in 1:4){
    #True and False vector to know the location
    TF <- iris$Species == sp
    #Mean
    means <- c(means,mean(iris[[i]][TF]))
    #Standard error
    s <- sd(iris[[i]][TF])
    se <- s/sqrt(l)
    standard_errors <- c(standard_errors,se)
    #median
    medians <- c(medians, median(iris[[i]][TF]))
    #Minimun
    mins <- c(mins, min(iris[[i]][TF]))
    #Maximum
    maxs <- c(maxs, max(iris[[i]][TF]))
    rm(TF)
  }
}

#Adding the vectors to data frame
dt[1] <- data$all_genus_species
dt[2] <- data$all_quantitative_variables
dt[3] <- means
dt[4] <- standard_errors
dt[5] <- medians
dt[6] <- mins
dt[7] <- maxs

#removing variables that will not be used anymore
rm(means, standard_errors, medians, mins, maxs, a, b, c, i , s, 
   se, sp, l)

#6. Install the package “writexl” and use the command write_xlsx 
#to create a “yourname.xlsx” file with your data frame.

#Name of the file I want to create
p <- 'Mirkka.xlsx'

#Actually create the excel file
#Running library
write_xlsx(dt,p)
rm(p)
