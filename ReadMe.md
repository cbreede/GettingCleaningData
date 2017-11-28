The purpose of this project is to take data collected from the accelerometers from the Samsung Galaxy S smartphone and aggregate the data into comprehensive, tidy data sets.

The following files were downloaded from the URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:
* activity_labels.txt
* features.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* subject_test.txt
* subject_train.txt

These data were processed with the script contained in the following file:
* run_analysis.R

This R file creates the following two csv data sets:
* finaldf.csv
* summdf.csv

The variables, data and transformations for the above are described in more detail in the following code book:
* CodeBook.md