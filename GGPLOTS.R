# DATA VISUALIZATION BY GGPLOT
# setting a working directory
#import dataset
library(gridExtra)
library(ggplot2)
> setwd("D:/AAAAA  MASIBO/Packt.Learning.R.for.Data.Visualization/2890OS_Code")
Data <- read.table(file = "EPA_Data.CSV",
                   sep = ",",
                   header = TRUE,
                   colClasses = c("Date","factor",rep("numeric",5)),
                   na.strings = "NA")

str(Data)
#plotting a histogram
ggplot(data = Data, aes(x = NO2)) + 
  geom_histogram(binwidth = 1)+
  theme_classic()+
  facet_wrap(~State)+
  geom_vline(xintercept = mean(California$NO2),
             colours = "yellow",
             linetype = "longdash")+
  geom_text(aes(label="mean",angle=0,x=18,y=20),colours = "red")
(state <- Data$State)
# ggplot boxplot
ordered <- c("Maine","Iowa","Texas","California","Ohio","New York")
ggplot(data = Data, aes(x =State ,y = NO2))+geom_boxplot()+ scale_x_discrete(limits = ordered)

# barplot
Pollution_1stOct2013<- Data[Data$Date == "2013-10-01",]
str(Pollution_1stOct2013)
ggplot(data = Pollution_1stOct2013, aes(x = State , y = SO2)) + geom_bar(stat = "identity")
#order the columns
ordered <-Pollution_1stOct2013[order(Pollution_1stOct2013$SO2),]
ordered
ggplot(data =Pollution_1stOct2013,
       aes(x=State,
    y = SO2))+geom_bar(stat ="identity")+scale_x_discrete(limits= ordered$State)

# creating simple scatter plot
California <- Data[Data$State== "California", ]
plot1 <- ggplot(data = California,aes(x=NO2,y=CO,
         colour =Temperature,size=CO))+
         geom_point()+
         scale_colour_gradient(low="blue",high="red")+
         labs(title = "Scatter plot\n modified",
         colour = "Temp.(0C)")+
         xlab("NO2 (ppm)")+
         ylab("CO (ppm)")+
         geom_line(method = "lm",se = TRUE)
plot1
#have a list of colours or specify the high and low colours.

#time series plots
ggplot(data = California,aes(x=Date,y=NO2,colour=CO))+geom_line(size =1)

# dealing with uncertainities in data
setwd("D:/AAAAA  MASIBO/Packt.Learning.R.for.Data.Visualization/2890OS_Code/Data")
Weekly_Values <- read.table(file ="Weekly_Values.csv",sep = "," ,header = TRUE)
Weekly_Values
ordered_weekly_values <-Weekly_Values [order(Weekly_Values$SO2.mean),]
str(ordered_weekly_values)

plot2 <- ggplot(data= Weekly_Values,aes(x=State,y=SO2.mean))+
  geom_bar(stat="identity",fill="grey")+
  scale_x_discrete(limits=ordered_weekly_values$State)+
  geom_errorbar(data = Weekly_Values,
                aes(ymin=SO2.mean-(2*SO2.se),
                    ymax=SO2.mean+(2*SO2.se)),
                width=0.1)
plot2
#using gridExtra package for multiple plots
grid.arrange(plot1,plot2, nrow=2)

