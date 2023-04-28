# Covid-Cases-and-Deaths-Analysis
### Overview:
The main objective of the project is carry out the analysis of Covid-19 data of United States. The data set includes information of
* Cases = Total Cases, Confirmed, Probable Cases,  New Cases, Probable New Cases
* Deaths = Total Deaths, Confirmed Deaths, Probable Deaths, New Deaths, Probable New Deaths.
* Consent = Consent Cases, Consent Deaths
<br>for each state over time.
<p>This dataset is deployed in Microsoft SQL server and integrated as well as visualised on Tableau Desktop

### About Dataset:
The Covid-19 data is reported by CDC and is updated daily online. CDC’s COVID Data Tracker are based on the most recent number reported by states, territories and other jurisdictions.
<br>The dataset is segregated into three the tables using Microsoft SQL Server namely COVID Consent, COVID Deaths and COVID Cases to get the detailed analysis of each entity. 
<br>Data is merged by creating a view again after assigning primary and foreign keys to the tables. Data cleaning is performed for better visualization of the data

<br> Locate Dataset here : https://healthdata.gov/dataset/United-States-COVID-19-Cases-and-Deaths-by-State-o/hiyb-zgc2

<br> SQL queries are used to merge and manipulate data tables. View is created to merge all the three tables creating submission number as a primary key. (Please see
Final_project.sql file for the same)

<p> Here is the snapshot of ER diagram explaining relation between the table attributes and created view. 
<br>![image](https://user-images.githubusercontent.com/68314057/235028267-bc2786a5-c23e-4a4a-900d-e4b664d5188e.png)<br>


### Dependecies:
Microsoft SQL Server
Tableau Desktop

### Visualisation:
Visualisation is carried out leveraging Tableau Dashboard. 
<br> Dashboards are created to track Confirmed & Probable cases as well as Confirmed & Probable deaths. (Definition of Confirmed Cases and Deaths as well as Probable Cases and Deaths can be found on CDC website).

### Instruction:
The above project is a part of UMBC Data Science Graduate program's Data Management class curriculum.



