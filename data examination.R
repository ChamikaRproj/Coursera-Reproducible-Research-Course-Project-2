# #Data examination
# dim(storm.data)  #Check Dimentions
# names(storm.data) #Check headers
# str(storm.data) #Check the structure
# head(storm.data) #Check first few lines
# tail(storm.data) #Cheack last few lines


#Dataset Cropdown
storm <- select(storm.data,c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP"))
dim(storm) #Check Dimentions
names(storm) #Check headers
str(storm) #Check the structure
head(storm) #Check first few lines
tail(storm) #Cheack last few line