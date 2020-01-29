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
	
select * from single_family_property_type where year =2016;
select * from single_family_property_type where year =2018;
select s.year,s.bank,s.tractrat,s.income,s.bocreditscore,s.ltv,s.amount,s.rate,z.zip,z.city 
from single_family_property_type s,zip_table z 
where s.stcountyfp=z.county_fips	

