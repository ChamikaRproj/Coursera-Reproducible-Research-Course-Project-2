# 
# #Analysis of Fatalities with Event type
# storm$EVTYPE<-as.factor(storm$EVTYPE)
# aggr.fatalites<-aggregate(FATALITIES ~ EVTYPE, data = storm,  FUN="sum") #aggregates fatalities
# top10.fatalities<-aggr.fatalites[order(-aggr.fatalites$FATALITIES), ][1:10, ] #order top 10
# 
# #Analysis of Injuries with Event type
# aggr.injuries<-aggregate(INJURIES ~ EVTYPE, data = storm,  FUN="sum") #aggregates injuries
# top10.injuries<-aggr.injuries[order(-aggr.injuries$INJURIES), ][1:10, ] #order top 10
# # 
# #plotting of fatalaty vs Evtype chart
# par(mfrow = c(1,2), mar = c(12, 4, 3, 2), mgp = c(3, 1, 0), cex = 0.8)
# barplot(top10.injuries$INJURIES, names.arg = top10.injuries$EVTYPE, las = 3, main = "10 Injuries Highest Events", ylab = "Number of Injuries")
# barplot(top10.fatalities$FATALITIES, names.arg = top10.fatalities$EVTYPE, las = 3, main = "10 Fatalities Highest Events", ylab = "Number of Fatalities", ylim=c(0,max(top10.injuries$INJURIES)))
# 

source("data examination.R")

#Economic analysis

#dsiplay unique values & assign its values to the same exponential
#Property Damage
unique(storm$PROPDMGEXP)
storm$PROPDMGEXP <- mapvalues(storm$PROPDMGEXP, from=unique(storm$PROPDMGEXP), to =c(
  10^3,# "K" 
  10^6,# "M" 
  1,# ""  
  10^9,# "B" 
  10^6,# "m" 
  10^0,# "+" 
  10^0,# "0" 
  10^5,# "5" 
  10^6,# "6" 
  10^0,# "?" 
  10^4,# "4" 
  10^2,# "2" 
  10^3,# "3" 
  10^2,# "h" 
  10^7,# "7" 
  10^2,# "H" 
  10^1,# "-" 
  10^1,# "1" 
  10^8# "8"
))
storm$PROPDMGEXP <- as.numeric(as.character(storm$PROPDMGEXP))
storm$PROPDMGTOTAL <- (storm$PROPDMG * storm$PROPDMGEXP)/1000000000
#Crop Damage
storm$CROPDMGEXP<-mapvalues(storm$CROPDMGEXP, from = unique(storm$CROPDMGEXP), to = c(
10^0,  # ""  
10^6,  # "M" 
10^3,  # "K" 
10^6,  # "m" 
10^9,  # "B" 
10^0,  # "?" 
10^0,  # "0" 
10^3,  # "k" 
10^2  # "2"
)
                            )
storm$CROPDMGEXP <- as.numeric(as.character(storm$CROPDMGEXP))
storm$CROPDMGTOTAL <- (storm$CROPDMG * storm$CROPDMGEXP)/1000000000


#Calculate property damage & Display top 10 events causing highest property damage

sumPropertyDamage <- aggregate(PROPDMGTOTAL ~ EVTYPE, data = storm,  FUN="sum")
propdmg10Total <- sumPropertyDamage[order(-sumPropertyDamage$PROPDMGTOTAL), ][1:10, ]
propdmg10Total

#Calculate crop damage & Display top 10 events causing highest crop damage
sumCropDamage <- aggregate(CROPDMGTOTAL ~ EVTYPE, data = storm,  FUN="sum")
cropdmg10Total <- sumCropDamage[order(-sumCropDamage$CROPDMGTOTAL), ][1:10, ]
cropdmg10Total


#plotting crop & property damage by weather event
par(mfrow = c(1,2), mar = c(12, 4, 3, 2), mgp = c(3, 1, 0), cex = 0.8)
barplot(cropdmg10Total$CROPDMGTOTAL, names.arg = cropdmg10Total$EVTYPE, las = 2, main = "10 Crop Damages Highest Events", ylab = "Damage Crop Values (in Billions) ", ylim=c(0,max(propdmg10Total$PROPDMGTOTAL)))
barplot(propdmg10Total$PROPDMGTOTAL, names.arg = propdmg10Total$EVTYPE, las = 3, main = "10 Property Damages Highest Events", ylab = "Damage Property Values (in Billions)")