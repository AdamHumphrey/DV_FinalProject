require("gplots")
require("ggplot2")
library("plyr")
library("dplyr")
library("tidyr")

tradeplot1 <- PercentOfUSA_AircraftTrades %>% select(AIRCRAFT_COUNTRY_AREA,PERCENT_OF_USA_TRADE) %>% filter(.,PERCENT_OF_USA_TRADE>.71)

tradeplot1 <- ggplot(tradeplot1, aes(x = AIRCRAFT_COUNTRY_AREA, y = PERCENT_OF_USA_TRADE)) + geom_area(colour="dodgerblue2") + labs(y = "Percentage of Total Number of Leather Trades", x = "Countries") + ggtitle("Ratio of Aircraft Trades") + theme(plot.title=element_text(size=20, face="bold", vjust=2)) 

tradeplot1



tradeplot2 <- PercentOfUSA_AmmoTrades %>% select(AMMO_COUNTRY_AREA,PERCENT_OF_USA_TRADE) %>% filter(.,PERCENT_OF_USA_TRADE>.705)

tradeplot2 <- ggplot(tradeplot2, aes(x = AMMO_COUNTRY_AREA, y = PERCENT_OF_USA_TRADE)) + geom_area(colour="red") + labs(y = "Percentage of Total Number of Leather Trades", x = "Countries") + ggtitle("Ratio of Ammo Trades") + theme(plot.title=element_text(size=20, face="bold", vjust=2))

tradeplot2



tradeplot3 <- PercentOfUSA_AlTrades %>% select(AL_COUNTRY_AREA,PERCENT_OF_USA_TRADE) %>% filter(.,PERCENT_OF_USA_TRADE>.9)


tradeplot3 <- ggplot(tradeplot3, aes(x = AL_COUNTRY_AREA, y = PERCENT_OF_USA_TRADE)) + geom_area(colour="chocolate") + labs(y = "Percentage of Total Number of Leather Trades", x = "Countries") + ggtitle("Ratio of Article Leather Trades") + theme(plot.title=element_text(size=20, face="bold", vjust=2))

tradeplot3

