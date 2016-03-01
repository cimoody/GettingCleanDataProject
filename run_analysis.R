# run_analysis.R

# Create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#     measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.


install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

# Directories
data.dir <- "./UCI_HAR_Dataset/"
test.dir <- paste0(data.dir, "test/")
train.dir <- paste0(data.dir, "train/")
testIS.dir <- paste0(test.dir, "Inertial_Signals/")
trainIS.dir <- paste0(train.dir, "Inertial_Signals/")

# Reading in the raw files
feature <- read.table("UCI_HAR_Dataset/features.txt",
                      stringsAsFactors = F,
                      col.names = c("col.number", "feature"))
# test
sub_test <- read.table(file = paste0(test.dir, "subject_test.txt"),
                   stringsAsFactors = F, col.names = "subject_test")
X_test <- read.table(file = paste0(test.dir, "X_test.txt"),
                     stringsAsFactors = F)
Y_test <- read.table(file = paste0(test.dir, "Y_test.txt"),
                     stringsAsFactors = F, col.names = "Y_test")
body_acc_x_test <- read.table(file = paste0(testIS.dir, "body_acc_x_test.txt"),
                              stringsAsFactors = F)
body_gyro_x_test <- read.table(file = paste0(testIS.dir,
                                             "body_gyro_x_test.txt"),
                               stringsAsFactors = F)
total_acc_x_test <- read.table(file = paste0(testIS.dir,
                                             "total_acc_x_test.txt"),
                               stringsAsFactors = F)
body_acc_y_test <- read.table(file = paste0(testIS.dir, "body_acc_y_test.txt"),
                              stringsAsFactors = F)
body_gyro_y_test <- read.table(file = paste0(testIS.dir,
                                             "body_gyro_y_test.txt"),
                               stringsAsFactors = F)
total_acc_y_test <- read.table(file = paste0(testIS.dir,
                                             "total_acc_y_test.txt"),
                               stringsAsFactors = F)
body_acc_z_test <- read.table(file = paste0(testIS.dir, "body_acc_z_test.txt"),
                              stringsAsFactors = F)
body_gyro_z_test <- read.table(file = paste0(testIS.dir,
                                             "body_gyro_z_test.txt"),
                               stringsAsFactors = F)
total_acc_z_test <- read.table(file = paste0(testIS.dir,
                                             "total_acc_z_test.txt"),
                               stringsAsFactors = F)
# train
sub_train <- read.table(file = paste0(train.dir, "subject_train.txt"),
                       stringsAsFactors = F, col.names = "subject_train")
X_train <- read.table(file = paste0(train.dir, "X_train.txt"),
                     stringsAsFactors = F)
Y_train <- read.table(file = paste0(train.dir, "Y_train.txt"),
                     stringsAsFactors = F, col.names = "Y_train")
body_acc_x_train <- read.table(file = paste0(trainIS.dir,
                                             "body_acc_x_train.txt"),
                              stringsAsFactors = F)
body_gyro_x_train <- read.table(file = paste0(trainIS.dir,
                                             "body_gyro_x_train.txt"),
                               stringsAsFactors = F)
total_acc_x_train <- read.table(file = paste0(trainIS.dir,
                                             "total_acc_x_train.txt"),
                               stringsAsFactors = F)
body_acc_y_train <- read.table(file = paste0(trainIS.dir,
                                             "body_acc_y_train.txt"),
                              stringsAsFactors = F)
body_gyro_y_train <- read.table(file = paste0(trainIS.dir,
                                             "body_gyro_y_train.txt"),
                               stringsAsFactors = F)
total_acc_y_train <- read.table(file = paste0(trainIS.dir,
                                             "total_acc_y_train.txt"),
                               stringsAsFactors = F)
body_acc_z_train <- read.table(file = paste0(trainIS.dir,
                                             "body_acc_z_train.txt"),
                              stringsAsFactors = F)
body_gyro_z_train <- read.table(file = paste0(trainIS.dir,
                                             "body_gyro_z_train.txt"),
                               stringsAsFactors = F)
total_acc_z_train <- read.table(file = paste0(trainIS.dir,
                                             "total_acc_z_train.txt"),
                               stringsAsFactors = F)
