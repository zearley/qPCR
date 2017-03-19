# qPCR
qPCR code
qPCR.R is a code written in R to automate qPCR analysis and plot the values
I waste so much time taking the raw data from the qPCR machine, importing it into excel, and doing all the manipulations necssary to be able to plot the values in prism. This code automates everything and gives me the same answer that I would get 15 minutes later if I did this all in excel. 

To run this code use the file titled IFNgceliac.csv this is an example experiment where I measured the expression of an inflammatory cytokine, IFNg, in patients who have active celiac disease or in healthy control patients. 
The code will then ask a few questions fill in the following values as indicated:
input file name: IFNgceliac.csv
Set housekeeping gene start: 1
Set housekeeping gene end: 22
Set target gene start: 49
Set target gene end: 70
Set group 1: Control
Set group 1 start: 1
Set group 1 end: 11
Set group 2: Celiac
Set group 2 start: 12
Set group 2 end: 22

The output is a dataframe of the group name and relative expression values and a boxplot with indiviual data points.
- Zach
