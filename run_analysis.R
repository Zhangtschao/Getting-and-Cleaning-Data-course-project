train.x<-read.table("UCI HAR Dataset/train/X_train.txt")
train.y<-read.table("UCI HAR Dataset/train/y_train.txt")
train<-data.frame(train.x,train.y)

test.x<-read.table("UCI HAR Dataset/test/X_test.txt")
test.y<-read.table("UCI HAR Dataset/test/y_test.txt")
test<-data.frame(test.x,test.y)

data<-merge(train,test,all=TRUE)

features<-read.table("UCI HAR Dataset/features.txt")
features.mean=features$V1[grep("mean",as.character(features$V2))]
features.std=features$V1[grep("std",as.character(features$V2))]
features.ms<-c(562,features.mean,features.std)

data.ms<-data[,features.ms]

act.name<-read.table("UCI HAR Dataset/activity_labels.txt")

for(i in 1:nrow(data.ms)){
  for(j in 1:6){
    if(data.ms[i,1]==j) data.ms[i,1]=as.character(act.name[j,2])
  }
}
head(data.ms[,1])

var.name=c("activity",as.character(features$V2[grep("mean",as.character(features$V2))]),as.character(features$V2[grep("std",as.character(features$V2))]))
colnames(data.ms)<-var.name

data.ms.mean<-colMeans(data.ms[,2:80])
data.ms.mean
write.table(data.ms.mean,file="mean.txt",row.name=FALSE)
