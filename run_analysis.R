setwd("C:/Users/Administrator/Desktop/data/UCI HAR Dataset")
## set the working Directory
               
data_test<-read.table("./test/x_test.txt")
data_train<-read.table("./train/x_train.txt")
data=rbind(data_train,data_test)
## combine the test set and the train set 

mean_x<-rowMeans(data)
std_x<-apply(data,1,function(x)sqrt(var(x)))
## compute the mean and the std. of each data

sub_train<-data.frame(act=read.table("./train/y_train.txt")
                      ,sub=read.table("./train/subject_train.txt"))
## put the subject,activiety,x into sub_train

sub_test<-data.frame(act=read.table("./test/y_test.txt")
                     ,sub=read.table("./test/subject_test.txt"))
## combine the descriptive data set

sub=rbind(sub_train,sub_test)
out<-data.frame(mean_x,std_x,sub)

names(out)<-c("mean","std","act","sub")
head(out)

mean_act<-tapply(out$mean,out$act,mean)
mean_sub<-tapply(out$mean,out$sub,mean)
std_act<-tapply(out$std,out$act,mean)
std_sub<-tapply(out$std,out$sub,mean)
## use function "tapply" to compute the average of 
## each variable for each activity and each subject

mean_all<-c(mean_act,mean_sub)
std_all<-c(std_act,std_sub)
## combine the activieties and person together
str1<-c("1 WALKING","2 WALKING_UPSTAIRS","3 WALKING_DOWNSTAIRS","4 SITTING","5 STANDING","6 LAYING")
str2<-paste("person",1:30)
str=c(str1,str2)
## write the row.names vector

sta_all<-data.frame(mean=mean_all,std=std_all,row.names=str)
## get the tidy data set

sta_all
## show it
