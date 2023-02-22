![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Data Preparation 


## Introduction

In this lab you will work with the dataset that has some issues. Please do everything to be sure that it is ready for the further work.

## Getting Started

In this lab you will learn the data preparation techniques.
Here is the dataset: https://docs.google.com/spreadsheets/d/1CYSDJooG0_58AzbYNRwvtC3gXIUhZNg1/edit?usp=sharing&ouid=109198901319062172979&rtpof=true&sd=true

## Tasks
### Part 1: Upload the data
### Part 2: Analyze your data and create a plan for data preparation

NEED TO KNO HOW OLD THE DATA IS INORDER TO MAKE INFERENCES' PARTICULARLY WITH REGARD TO BIRTHYEAR
We could make assumption that the data is 20 years old, and assume thus that 2013 to 2017 are erroneous and could be replaced by the average.
look for missing values NaN - determine how many were and if they can be replaced or not
look for duplicates - assess any indiscrepencies

look for outliers
look at data types and where they differ

### Part 3: Data cleansing  (missing values, outliers, duplicates, data consistently)

Should start with cleaning data types first, and headings

null values = 4 in total, 2 in birth year, 2 in profession, 
Had a look at duplicate clients and implemented changes to missing and incoherent data (birth year and profession)
    As not many data overall, changes were implemented on case by case basis
        * where birthyear missing in one record but provided in others, previous value implemented
        * where two different years provided for same customer, first record (first transaction) taken to be true
        * Where occupation different, updated to match previous records
                * alternative would be to specify unknown, or take mode, or if enough data get rid of the row.
        * Where occupation only provided in one record, but not others, missing values updated to match previous record
Outliers
    *Birthyear, there are some weird values, but not able to identify via outliers method. 1923, 2013,2015 and 2017 seem suspicious
    *outlier identified in amount, two values around 50000 and one value 2,000,000. decided to keep former as they seem realistic even if outlier, and drop the last because it is extreme. If training a model, then removing this will be better for the model.
    
no more null values left

Removing low variance columns : i didnt do this , but potentially could drop columns with low varaince in this instance dept. but this really depends on the questions you are asking, i thought it was worth keeping in this instance.

### Part 4: Encode categorical data
 now code the categorical data 'Risk' using category-encoders module and its OrdinalEncoder function.
with this the encoding order can be pre-defined using mapping.

as the transformation overwrites the original data, I save the original risk data with the TransactionID(which i understand to be unique), and then merge the encoded dataframe and the original risk labels

### Part 5: Upload the deliverables to GitHub


## Deliverables

- Code in Python
- Readme file with your plan, approaches and summary
- Prepared dataset in csv format

## Submission

Upon completion, add your deliverables to git. Then commit git and push your branch to the remote.

## Resources

[Pandas - data preparation] https://towardsdatascience.com/essential-commands-for-data-preparation-with-pandas-ed01579cf214

[Pandas] https://realpython.com/python-data-cleaning-numpy-pandas/
