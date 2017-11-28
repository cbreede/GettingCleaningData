The purpose of this project is to take data collected from the accelerometers from the Samsung Galaxy S smartphone and aggregate the data into comprehensive, tidy data sets.

## Variables
* wd: character variable containing the working directory for all the files saved locally used to create the datasets
* activity: dataframe containing the activity labels (sitting, walking, standing, etc.)
* xtest: dataframe containing the x-values (movement measurements) for the test data
* ytest: dataframe containing the y-values (i.e., the activities) for the test data
* stest: dataframe containing the ID's for the subjects of the measurements for the test data
* xtraining: dataframe containing the x-values (movement measurements) for the training data
* ytraining: dataframe containing the y-values (i.e., the activities) for the training data
* straining: dataframe containing the ID's for the subjects of the measurements for the training data
* i: a simple integer column counter
* mynames: dataframe with the column names for the test and training datasets for the x- and y-values
* filter1: an integer vector with the column position for all mean values
* filter2: an integer vector with the column position for all standard deviation values
* xval: dataframe with the combined data from xtest and xtraining
* xval2: dataframe removing any unneeded columns from xval
* yval: dataframe with the combined data from ytest and ytraining, using the data labels from the activity dataframe
* sval: dataframe with the combined data from stest and straining
* finaldf: dataframe combining the columns from xval2, yval and sval
* cnames: character vector with the column names for finaldf
* summdf: dataframe calculating the means for each x-value variable, grouped by subject ID and activity

## Data
* activity_labels.txt: Links the class labels with their activity name
* features.txt: List of all features
* X_test.txt: Test set
* X_train.txt: Training set
* y_test.txt: Test labels
* y_train.txt: Training labels
* subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 
* subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
* finaldf.csv: file with data from finaldf dataframe from above
* summdf.csv: file with calculated means for each x-value variable, grouped by subject ID and activity

## Transformations/Data Clean Up
* Get the activity labels; associate an ID for each
* Get the x, y and subject test tables
* Convert x-values for test from character to numeric
* Get the x- and y-training tables
* Convert x-values for training from character to numeric
* Get the column names and create column filters for mean and std
* Combine the x-value test and training datasets and keep mean and std columns
* Combine the y-value test and training datasets and combine result into final dataset
* Combine the subject test and training datasets
* Combine x-value, y-value and subject results into final dataset
* Create an independent tidy data set with the average of each variable for each activity and subject