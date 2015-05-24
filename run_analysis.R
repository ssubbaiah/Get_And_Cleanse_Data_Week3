###################################################################################
#Prog Name      	Author         Date       Description
#run_analysis.R		Som Subbaiah - 5/23/2015 - Getting and Cleaning Data - Week 3 
###################################################################################
##set working directory 
setwd("C:/00_SomSubbaiah/DataScience/UCIHARDataset")

## Data File downloaded and unzipped into the working directory

## read labels into vectors
activity_label<-read.table("./activity_labels.txt")
feature_label <- read.table("./features.txt")


## Read Test and Train data and merge them
## Read   X-data and Merge
test_x <- read.table("./test/X_test.txt")
train_x <- read.table("./train/X_train.txt")

all_x <- rbind(test_x,train_x)

## Read  y_data and Merge
test_y <- read.table("./test/Y_test.txt")
train_y <- read.table("./train/Y_train.txt")

all_y <- rbind(test_y,train_y)

# Read subject data and merge
test_sub <- read.table("./test/subject_test.txt")
train_sub <- read.table("./train/subject_train.txt")

all_sub <-  rbind(test_sub,train_sub)


## To subset columns that contain mean or std 
## use grep to find columns that contain pattern "-mean()" or "-std()"
## and store that list into a (index) vector
mean_std_cols <- grep("-(mean|std)\\(\\)",feature_label[,2])


## Use mean_std_cols vector to subset x_data with column names containing 
## mean or std 
all_x <- all_x[, mean_std_cols]

## Replace activity ID with Activity names
all_y[,1] <- activity_label[all_y[,1],2]

## replace the default names with more meaningful names
## subject data - simple label for column name
colnames(all_sub)<-"subject"  

## y-data - simple label for column name
colnames(all_y)<-"activity"
colnames(all_x) <- feature_label[mean_std_cols,2]

## combine all data
full_data <- cbind(all_sub, all_y,all_x)

## Write to output file in working directory
write.table(full_data,"averages_data.txt",row.name=FALSE, quote=FALSE)

###################End of run_analysis.R ########################