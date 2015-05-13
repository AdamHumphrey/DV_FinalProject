require("jsonlite")
require("RCurl")

RANK_AIRCRAFT <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT DISTINCT AIRCRAFT_COUNTRY_AREA, TRADE_SUM, rank() 
OVER (ORDER BY TRADE_SUM desc) as Trade_USD_RANK 
FROM (SELECT DISTINCT AIRCRAFT_COUNTRY_AREA, sum(AIRCRAFT_TRADE_USD) over 
(PARTITION BY AIRCRAFT_COUNTRY_AREA ) as
TRADE_SUM from AIRCRAFT_REVISED) ORDER BY Trade_USD_RANK asc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_das3734', PASS='orcl_das3734', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

head(RANK_AIRCRAFT)


RANK_AMMO <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT DISTINCT AMMO_COUNTRY_AREA, TRADE_SUM, rank() 
OVER (ORDER BY TRADE_SUM desc) as Trade_USD_RANK 
FROM (SELECT DISTINCT AMMO_COUNTRY_AREA, sum(AMMO_TRADE_USD) over 
(PARTITION BY AMMO_COUNTRY_AREA ) as
TRADE_SUM from AMMO_REVISED) ORDER BY Trade_USD_RANK asc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_das3734', PASS='orcl_das3734', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

head(RANK_AMMO)


RANK_LEATHER <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT DISTINCT AL_COUNTRY_AREA, TRADE_SUM, rank() 
OVER (ORDER BY TRADE_SUM desc) as Trade_USD_RANK 
FROM (SELECT DISTINCT AL_COUNTRY_AREA, sum(AL_TRADE_USD) over 
(PARTITION BY AL_COUNTRY_AREA ) as
TRADE_SUM from ARTICLELEATHER_REVISED) ORDER BY Trade_USD_RANK asc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_das3734', PASS='orcl_das3734', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

head(RANK_LEATHER)