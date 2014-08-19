if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# The code below reads and loads the activity labels
data_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# The code identifies the main column names
column_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

# The code below calculates the Mean and Standard Deviation of the data elements.
standard_mean <- grepl("mean|std", column_names)

# Extracting and processing X_test & y_test data included in the dataset.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = column_names

#The code below presents the Mean and Standard Deviation of the data elements
X_test = X_test[,standard_mean]

# The code below reads and loads the activity labels
y_test[,2] = data_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Extract and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = column_names

# The code below presents the Mean and Standard Deviation of the data elements.
X_train = X_train[,standard_mean]

# The code below reads and loads the activity labels
y_train[,2] = data_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
