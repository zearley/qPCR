# Code for automating qPCR analysis
# By Zach Earley 2017
{aa <- readline(prompt = "input file name: ") # The code first asks to input the data file which is the output for the Roche qPCR machine
a <- readline(prompt = "Set housekeeping gene start: ") # Set your housekeeping gene start and end value
a <- as.numeric(a)
b <- readline(prompt = "Set housekeeping gene end: ")
b <- as.numeric(b)
c <- readline(prompt = "Set target gene start: ")
c <- as.numeric(c)
d <- readline(prompt = "Set target gene end: ") # Set your target gene start and end value
d <- as.numeric(d)
e <- readline(prompt = "Set group 1: ") # Define group 1
f <- readline(prompt = "Set group 1 start: ") # Define group 1 start and end to calculate how many samples you have
f <- as.numeric(f)
g <- readline(prompt = "Set group 1 end: ")
g <- as.numeric(g)
gg <- (g - f) + 1
h <- readline(prompt = "Set group 2: ") # Define group 2
i <- readline(prompt = "Set group 2 start: ") # Define group 2 start and end to calculate how many samples you have
i <- as.numeric(i)
j <- readline(prompt = "Set group 2 end: ")
j <- as.numeric(j)
jj <- (j - i) + 1}
qPCR = read.csv(aa, header = TRUE) # the code reads the input file
housekeeping <- qPCR$MeanCp[a:b] # pulls out the MeanCp from the housekeeping and target values you defined
target <- qPCR$MeanCp[c:d]
dct <- target - housekeeping # calculates the dCT 
fold <- 2^(dct)
relative <- ((1/fold)*1000) # calculates the relative expression
group <- rep(c(e, h), times = c(gg,jj))
relative_expression <- relative[f:j]
z <- data.frame(group,relative_expression) # Builds a data frame from the relative expression values for each sample and assigns the corresponding group name to it
library(ggplot2)
p = ggplot(z, aes(group,relative_expression))
p1 = p + geom_boxplot()
p2 <- p1 + geom_point(position = position_jitter(width = .1)) # Makes a boxplot plotting group and relative expression with individual data points for each sample 
print(z) # Print the data frame for the group name and the relative expression values
print(p2) # Print the boxplot