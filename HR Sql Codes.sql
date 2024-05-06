CREATE DATABASE COMPANY

USE COMPANY

Select * from attrition


-- Find Out how many employess have left the company and how many total employess are there in the Company
Select Count(Case When Attrition = '1' Then 1 End) As Attrition_Count,
       Count(*) As Total_Emp
From attrition

--Presence Of Overtime and Correlation In Attrition
Select Overtime, Count(*) As Total_emp
From attrition
Where Attrition = 1 
Group by Overtime


--Gender Distribution In the Company
Select Gender, Count(*) From attrition
Group By Gender

Select Gender, Count(*) From attrition
Where Attrition = 1
Group By Gender


-- There is a Negative Correlation Amongst Perfomance Rating and Attrition
Select Performancerating, COUNT(Case When Attrition = 1 Then 1 End) As Attrition_Count
From attrition
Group By PerformanceRating


--Attrition Count based on Job Role
Select Department, Jobrole, Count(*) As Attritiion_count
From Attrition
Where Attrition = 1
Group BY Department , JobRole
Order By Attritiion_count Desc


-- Attrition Count Based on Distance from Home
Select Distancefromhome, Count(*) As Attrition_Count
From attrition
Where Attrition = 1
Group By DistanceFromHome
Order By Attrition_Count Desc


--Relation Between Salary And Attrition
Select PercentSalaryHike, Count(*) As Attrition_Count
From attrition
Where Attrition = 1
Group By PercentSalaryHike
Order By Attrition_Count Desc

-- Education Field Is Related to Attrition or not'
Select EducationField, Count(*) As Attrition_Count
From attrition
Where Attrition = 1
Group By EducationField
Order By Attrition_Count Desc

-- Relation Between Years in Current Role and Attrition 
Select Yearsincurrentrole, Count(Case When Attrition = 1 Then 1 End) As Attrition_Count
From Attrition
Where YearsInCurrentRole >(Select AVG(Yearsincurrentrole) From attrition)
Group By YearsInCurrentRole
Order BY Attrition_Count Desc
-- Employees who are working in the company for the last 5-10 years have the highest attrition count


-- Job Satisfaction and Monthly Income
Select Jobsatisfaction , Count(*) As Attrition_count
From attrition
Where Attrition = 1 And MonthlyIncome < ( Select AVG(MonthlyIncome) From attrition) 
Group By JobSatisfaction
--Monthly Income Plays a vital role in Attrition Count irrespective of Job Satisfaction is on the higher Side


-- Employee Attrition Based on Age Range
Select Case When Age <= 29 Then '18-29'
                           When Age >= 30 and Age <= 39 Then '30-39'
						   When Age >= 40 And Age <= 49 Then '40-49'
						   When Age >= 50 And Age <= 59 Then '50-59'
						   Else '60+'
						   End As 'Age Range' , Count(*)  As 'Number Of Attrition Based on Age Range'
From attrition
Where Attrition = 1 and YearsAtCompany > 1
Group by Case When Age <= 29 Then '18-29'
                           When Age >= 30 and Age <= 39 Then '30-39'
						   When Age >= 40 And Age <= 49 Then '40-49'
						   When Age >= 50 And Age <= 59 Then '50-59'
						   Else '60+'
						   End


Select MAX(DailyRate)
From attrition
Where Attrition = 1

Select MIN(DailyRate)
From attrition
Where Attrition = 1

Select MAX(MonthlyRate)
From attrition
Where Attrition = 1

Select MIN(DailyRate)
From attrition
Where Attrition = 1

Select COUNT(*) AS Attrition_Count
From attrition
Where Attrition = 1 And DailyRate < (Select AVG(DailyRate) From attrition )
                    And MonthlyRate < (Select AVG(MonthlyRate) From attrition)
					And MonthlyIncome < (Select Avg(MonthlyIncome) From attrition)

Select COUNT(*) AS Attrition_Count
From attrition
Where Attrition = 1 And MonthlyIncome < (Select Avg(MonthlyIncome) From attrition)


Select COUNT(*) AS Attrition_Count
From attrition
Where Attrition = 1 And DailyRate < (Select AVG(DailyRate) From attrition )
                   

Select COUNT(*) AS Attrition_Count
From attrition
Where Attrition = 1 And MonthlyRate < (Select AVG(MonthlyRate) From attrition)


Select EnvironmentSatisfaction , RelationshipSatisfaction , Count(*) As Attrition_Count
From attrition
Where Attrition = 1 And MonthlyIncome < (Select AVG(MonthlyIncome) From attrition)
Group By EnvironmentSatisfaction, RelationshipSatisfaction
Order By Attrition_Count Desc


Select MaritalStatus , Count(*) As Attrition_Count
From attrition
Where  Attrition = 1
Group By MaritalStatus

