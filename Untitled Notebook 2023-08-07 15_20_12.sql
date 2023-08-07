-- Databricks notebook source

select * from employee_attrition;

-- COMMAND ----------

select count(EmployeeCount) from employee_attrition;

-- COMMAND ----------

-- DBTITLE 1,Show Employee which are Leaving
select  sum(EmployeeCount),attrition from employee_attrition group by 2;

-- COMMAND ----------

-- DBTITLE 1,Attrition Based On Age 
select sum(EmployeeCount), case when age between 20 and 25  then '20-25'  when age between 26 and 35 then '26-35' when age between 36 and 49 then '36-49' else '50+' end as age_group from employee_attrition where attrition='Yes' group by 2 order by 2;

-- COMMAND ----------

-- DBTITLE 1,Attrition BY Department
select sum(EmployeeCount),department from  employee_attrition where attrition='Yes' group by 2;

-- COMMAND ----------

-- DBTITLE 1,Attrition by Education Column (1- below College,2=college,3=bachelor,4=master,5=doctor)
select sum(EmployeeCount), case when education=1 then 'below College' when education=2 then 'college' when education=3 then 'bachelor' when education=4 then 'master' else  'doctor'  end as Education_detail   from employee_attrition  where attrition='Yes' group by 2;

-- COMMAND ----------

-- DBTITLE 1,Based on Environment Satisfaction(1=low,2=medium,3=high,4=highlysatisfied)
select sum(EmployeeCount), case when EnvironmentSatisfaction=1 then 'low' when EnvironmentSatisfaction=2 then 'medium_satisfy' when EnvironmentSatisfaction=3 then 'satisfied' else 'Highly_satisfies'   end as Education_detail   from employee_attrition  where attrition='Yes' group by 2;

-- COMMAND ----------

-- DBTITLE 1,Based on Travel Frequency
select sum(EmployeeCount),BusinessTravel from employee_attrition where attrition='Yes' group by 2;
