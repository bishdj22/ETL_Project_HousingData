Select * FROM zillow_2018_db;
Select * FROM zillow_db;

ALTER TABLE zillow_db RENAME COLUMN "2016_avghomevalue" TO avghomevalue2016;
ALTER TABLE zillow_2018_db RENAME COLUMN "2018_avghomevalue" TO avghomevalue2018;

SELECT zillow_db.zipcode, zillow_db.city, zillow_db.state,
       zillow_db.metro, zillow_db.countyname, zillow_db.avghomevalue2016, zillow_2018_db.avghomevalue2018
	INTO merged_zillow
	FROM zillow_2018_db
    LEFT JOIN zillow_db ON (zillow_db.zipcode = zillow_2018_db.zipcode);
	
Select * FROM merged_zillow;

--Mahesh Query
select * from single_family_property_type where year =2016;
select * from single_family_property_type where year =2018;
select s.year,s.bank,s.tractrat,s.income,s.bocreditscore,s.ltv,s.amount,s.rate,z.zip,z.city 
from single_family_property_type s,zip_table z 
where s.stcountyfp=z.county_fips	

Select * FROM merged_zillow;

Drop Table zillow_db;

SELECT COUNT(*) FROM fhlb_housing_zip;
SELECT COUNT(*) FROM merged_zillow;

SELECT * FROM fhlb_housing_zip;
SELECT * FROM merged_zillow;

---USE INNER JOIN TO MERGE TABLES ON COMMON ZIP CODE VALUES---

DROP TABLE single_fam_data_master;

SELECT fhlb_housing_zip.zip,fhlb_housing_zip.year, fhlb_housing_zip.bank,
	   fhlb_housing_zip.tractrat, fhlb_housing_zip.income, fhlb_housing_zip.bocreditscore, 
	   fhlb_housing_zip.ltv, fhlb_housing_zip.amount, fhlb_housing_zip.rate, merged_zillow.zipcode, merged_zillow.city, merged_zillow.state,
       merged_zillow.metro, merged_zillow.countyname, merged_zillow.avghomevalue2016, 
	   merged_zillow.avghomevalue2018
	INTO single_fam_data_master
	FROM merged_zillow
    INNER JOIN fhlb_housing_zip ON (merged_zillow.zipcode = fhlb_housing_zip.zip);

---TEST QUERY WHOLE TABLE---

SELECT * FROM single_fam_data_master

---CHECKING FOR NULL VALUES---

SELECT * FROM single_fam_data_master WHERE NOT (single_fam_data_master IS NOT NULL);



