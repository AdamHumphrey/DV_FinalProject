library("plyr")
library("dplyr")
library("tidyr")


S1 <- aircraft %>% group_by(AIRCRAFT_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS=n()); 
S2 <- ammo %>% group_by(AMMO_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS=n()); S3 <- leather %>% group_by(AL_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS=n());
G1 <- full_join(S1,S2,by="NUMBER_DATAPOINTS") %>% full_join(.,S3,by="NUMBER_DATAPOINTS") %>% arrange(NUMBER_DATAPOINTS) %>% select(NUMBER_DATAPOINTS,AIRCRAFT_COUNTRY_AREA,AMMO_COUNTRY_AREA,AL_COUNTRY_AREA);

aircrafttrades <- G1 %>% select(NUMBER_DATAPOINTS, AIRCRAFT_COUNTRY_AREA) %>% filter(!is.na(AIRCRAFT_COUNTRY_AREA))
tbl_df(aircrafttrades)

ammotrades <- G1 %>% select(NUMBER_DATAPOINTS, AMMO_COUNTRY_AREA) %>% filter(!is.na(AMMO_COUNTRY_AREA))
tbl_df(ammotrades)

altrades <- G1 %>% select(NUMBER_DATAPOINTS, AL_COUNTRY_AREA) %>% filter(!is.na(AL_COUNTRY_AREA)) 
tbl_df(altrades)

USA_AIRCRAFT_TRADES <- aircraft %>% select(AIRCRAFT_COUNTRY_AREA) %>% filter(AIRCRAFT_COUNTRY_AREA== "USA") %>% group_by(AIRCRAFT_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS = n());
tbl_df(USA_AIRCRAFT_TRADES)

USA_AMMO_TRADES <- ammo %>% select(AMMO_COUNTRY_AREA) %>% filter(AMMO_COUNTRY_AREA== "USA") %>% group_by(AMMO_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS = n()); 
tbl_df(USA_AMMO_TRADES)

USA_LEATHER_TRADES <- leather %>% select(AL_COUNTRY_AREA) %>% filter(AL_COUNTRY_AREA == "USA") %>% group_by(AL_COUNTRY_AREA) %>% summarise(NUMBER_DATAPOINTS = n()); 
tbl_df(USA_LEATHER_TRADES)

Percent1 <- aircrafttrades[1][1]/max(USA_AIRCRAFT_TRADES[2]);
names(Percent1)[1] <-"PERCENT_OF_USA_TRADE";
PercentOfUSA_AircraftTrades <-  bind_cols(aircrafttrades,Percent1)
tbl_df(PercentOfUSA_AircraftTrades)

Percent2 <- ammotrades[1][1]/max(USA_AMMO_TRADES[2]);
names(Percent2)[1] <-"PERCENT_OF_USA_TRADE";
PercentOfUSA_AmmoTrades <- bind_cols(ammotrades,Percent2)
tbl_df(PercentOfUSA_AmmoTrades)

Percent3 <- altrades[1][1]/max(USA_LEATHER_TRADES[2]);
names(Percent3)[1] <-"PERCENT_OF_USA_TRADE";
PercentOfUSA_AlTrades <- bind_cols(altrades,Percent3)
tbl_df(PercentOfUSA_AlTrades)
