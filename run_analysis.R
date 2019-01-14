#C3_S4_proj
#----WORKSPACE
rm(list = ls(all = TRUE)) #clear
root <- "C:/Users/Uusario7/Downloads/cours/UCI HAR Dataset"
setwd(root)

#----LIBRARY
library(tidyr)
library(dplyr)

#----DATA
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,"UCI HAR Dataset.zip")

#----READ FILES
test_data<-tbl_df(read.table("test/X_test.txt"))

test_data<-tbl_df(read.table("test/X_test.txt"))
test_labels<-tbl_df(read.table("test/y_test.txt"))
test_subject<-tbl_df(read.table("test/subject_test.txt"))

train_data<-tbl_df(read.table("train/X_train.txt"))
train_labels<-tbl_df(read.table("train/y_train.txt"))
train_subject<-tbl_df(read.table("train/subject_train.txt"))

col_names<-tbl_df(read.table("features.txt"))
act_names<-tbl_df(read.table("activity_labels.txt"))

#----1: MERGE
names(test_data)<-names(train_data)<-col_names[[2]]
test_data$activity<-test_labels[[1]];test_data$subject<-test_subject[[1]]
train_data$activity<-train_labels[[1]];train_data$subject<-train_subject[[1]]
data<-rbind(test_data,train_data)
dim(data)#Check

#----2:MEAN & STANDAR DEVIATION
vect<-grep("[Mm][Ee][Aa][Nn][[:punct:]][[:punct:]]$|[Ss][Tt][Dd][[:punct:]][[:punct:]]$",names(data))
data2<-data[,c(562,563,vect)]

#----3:ACTIVITIES NAME
data2<-merge(act_names,data2,by.x="V1",by.y="activity")
#Check:
#data2$V1<-as.factor(data2$V1)
#summary(data2[,c(1,2)])
#act_names

#----4:VARIABLES NAME
names(data2)
data2<-rename(data2[-1],activity=V2) #data2[1] have the same info that data2[2] (with different coding)
names(data2)<-c(names(data2[c(1,2)]),
                      "mean.of.time.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "standar.deviation.of.time.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "mean.of.time.of.gravity.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "standar.deviation.of.time.of.gravity.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "mean.of.jerk.signal.of.time.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "standar.deviation.of.jerk.signal.of.time.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "mean.of.time.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "standar.deviation.of.time.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "mean.of.jerk.signal.of.time.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "standar.deviation.of.jerk.signal.of.time.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "mean.of.frequency.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "standar.deviation.of.frequency.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "mean.of.jerk.signal.of.frequency.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "standar.deviation.of.jerk.signal.of.frequency.of.body.acceleration.signal.from.accelerometer.with.euclidian.norm",
                      "mean.of.frequency.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "standar.deviation.of.frequency.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "mean.of.jerk.signal.of.frequency.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm",
                      "standar.deviation.of.jerk.signal.of.frequency.of.body.acceleration.signal.from.gyroscope.with.euclidian.norm")
names(data2)#Check
#----5:AVERAGES
averages<- data2 %>% group_by(activity,subject) %>% summarise_all(mean)
setwd("C:/Users/Uusario7/Downloads/cours")
write.table(averages, file="averages.csv",row.names = F)