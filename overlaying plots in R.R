require("datasets")
data("chickwts")
view(chickwts)
chickwts

##plots
plot(chickwts$feed)
glimpse("chickwts")

feeds <- table(chickwts$feed)
feeds
feeds_graph <- barplot(feeds[order(feeds)],
                       horiz = TRUE,
                       col = c(1,2,3,4,5,6),
                       main = "the bargraph of in chickwts",
                       las = 1,
                       xlab = "no. of chicks",
                       border = NA)
feeds_graph

feeds_piechart <- pie(feeds[order(feeds,decreasing=TRUE)],
                      unit.angle = 90,
                      col = c(9,8,7,6,5,4),
                      clockwise = TRUE,
                      main = "the piechart\n to consider")
feeds_piechart
#
rm(list = ls())

## histogram
require(datasets)
data(lynx)
hist(lynx, xlab= "number of lynx trapped", 
     ylab = "frequeny of lynx data", 
     main=" histogram of Lynx\ndata plus",
     freq = FALSE,
     col = c(3, 4, 5, 6, 2, 7,9),
     breaks = 11)
#breaks = seq(0, 7000, by = 100)
#breaks = c(0, 100, 300, 500, 3000,3500, 7000))
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col= "red",
      lwd = 2,
      add = TRUE )
## modifying a boxplot for data visualization
data("USJudgeRatings")
boxplot(USJudgeRatings,
        horizontal = TRUE,
        xlab = "judges Ratings", 
        ylim  = c(0,10),
        las = 1,
        notch = TRUE,
        col = "purple",
        boxwex = 0.6,
        whisklty = 1,
        main = " the USJudges ratings on a box plot",
        outpch = 16,
        outcol = "red") 

##overlaying plots in R
swiss #examining the dataset
str(swiss) #  the stracture of the dataset
#plottting a histogram of the swiss datasetr with variation on it.
fertility <- swiss$Fertility
fertility
hist_swiss <- hist(fertility,
                   prob = TRUE,
                   ylim = c(0, 0.04),
                   xlim = c(30, 100),
                   breaks = 11,
                   col = "gray",
                   border = 0,
                   main = "Fertility fir 47 Freanch-Speaking \nSwiss Provinces, c. 1888")
# plot2 ;normal curve if probability = True
curve(dnorm(x, mean = mean(fertility),  sd= sd(fertility)),
      col = ("blue"),
      lwd = 3.5,
      add = TRUE)
##add density lines
lines(density(fertility, col = "red"))
lines(density(fertility,adjust = 3), col = "yellow")

# Rug, line plot under histogram
rug(fertility,col = "red")
