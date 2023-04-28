--CASES

/*
--To update the sub_num as NULL:
UPDATE p1
SET p1.sub_num = NULL
FROM project.dbo.cases as p1
*/

select * from project.dbo.cases;

select count(1) from project.dbo.cases;

drop table if exists temp_update_cases
SELECT 
submission_date
,state
,ROW_NUMBER() OVER (ORDER BY SUBMISSION_DATE, STATE) AS RN1
INTO temp_update_cases
FROM project.dbo.cases;

select * from temp_update_cases;

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM Project.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cases';

ALTER TABLE project.dbo.cases ALTER COLUMN sub_num int;
ALTER TABLE Project.dbo.cases ALTER COLUMN tot_cases int;
ALTER TABLE Project.dbo.cases ALTER COLUMN conf_cases int;
ALTER TABLE Project.dbo.cases ALTER COLUMN prob_cases int;
ALTER TABLE Project.dbo.cases ALTER COLUMN new_case int;
ALTER TABLE Project.dbo.cases ALTER COLUMN pnew_case int;


UPDATE p1
SET p1.sub_num = t1.RN1
FROM project.dbo.cases as p1
INNER JOIN temp_update_cases as t1 
ON p1.submission_date = t1.submission_date and p1.state = t1.state;

select * from project.dbo.cases order by submission_date, state;


--CONSENT

/*
--To update the sub_num as NULL:
UPDATE p2
SET p2.sub_num = NULL
FROM project.dbo.consent as p2
*/

select * from project.dbo.consent;

select count(1) from project.dbo.consent;

drop table if exists temp_update_consent
SELECT 
submission_date
,state
,ROW_NUMBER() OVER (ORDER BY SUBMISSION_DATE, STATE) AS RN2
INTO temp_update_consent
FROM project.dbo.consent;

select * from temp_update_consent;

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM Project.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'consent';

ALTER TABLE project.dbo.consent ALTER COLUMN sub_num int;


UPDATE p2
SET p2.sub_num = t2.RN2
FROM project.dbo.consent as p2
INNER JOIN temp_update_consent as t2
ON p2.submission_date = t2.submission_date and p2.state = t2.state;

select * from project.dbo.consent order by submission_date, state;

--DEATH

/*
--To update the sub_num as NULL:
UPDATE p3
SET p3.sub_num = NULL
FROM project.dbo.death as p3
*/

select * from project.dbo.death;

select count(1) from project.dbo.death;

drop table if exists temp_update_death
SELECT 
submission_date
,state
,ROW_NUMBER() OVER (ORDER BY SUBMISSION_DATE, STATE) AS RN3
INTO temp_update_death
FROM project.dbo.death;

select * from temp_update_death;

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM Project.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'death';

ALTER TABLE project.dbo.death ALTER COLUMN sub_num int;
ALTER TABLE Project.dbo.death ALTER COLUMN tot_death int;
ALTER TABLE Project.dbo.death ALTER COLUMN conf_death int;
ALTER TABLE Project.dbo.death ALTER COLUMN prob_death int;
ALTER TABLE Project.dbo.death ALTER COLUMN new_death int;
ALTER TABLE Project.dbo.death ALTER COLUMN pnew_death int;

UPDATE p3
SET p3.sub_num = t3.RN3
FROM project.dbo.death as p3
INNER JOIN temp_update_death as t3
ON p3.submission_date = t3.submission_date and p3.state = t3.state;

select * from project.dbo.death order by submission_date, state;

--JOINING CONDITIONS AND CREATION OF VIEW:

USE Project;  
GO
DROP VIEW IF EXISTS US_Covid19;

USE Project;  
GO 
CREATE VIEW US_Covid19 AS
SELECT 
c.sub_num as submission_num
,c.submission_date
,c.state
,a.tot_cases as total_cases
,a.conf_cases as confirmed_cases
,a.prob_cases as probable_cases
,a.new_case as new_cases
,a.pnew_case as probable_new_cases
,b.consent_cases
,b.consent_deaths
,c.tot_death as total_deaths
,c.conf_death as confirmed_deaths
,c.prob_death as probable_deaths
,c.new_death as new_deaths
,c.pnew_death as probable_new_deaths
from 
project.dbo.cases a
inner join project.dbo.consent b on a.sub_num = b.sub_num
inner join project.dbo.death c on b.sub_num = c.sub_num;

select v.* 
from Project.dbo.US_Covid19 v;

/*
--Checking the N/A values in consent_cases and consent_deaths
select v.* from 
Project.dbo.US_Covid19 v
where consent_cases = 'N/A' or consent_deaths = 'N/A';
*/

--Modifying the VIEW

Update v
SET consent_cases = NULL
,consent_deaths = NULL
FROM Project.dbo.US_Covid19 v
where consent_cases = 'N/A' or consent_deaths = 'N/A';

select v.* 
from Project.dbo.US_Covid19 v;

--INFORMATION SCHEMA:
SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM Project.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'US_Covid19';
