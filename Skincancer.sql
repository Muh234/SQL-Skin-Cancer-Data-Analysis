--Getting to know my data

--Total number of cases
select * from table1;
select count(patient_id) from table1;
--1088 cases

--Gender 
select gender,count(gender) as "Gender Count"
from table1
group by gender;

--Age
select min(age) from table1;
select max(age) from table1;

SELECT gender,
    CASE
        WHEN age BETWEEN 6 AND 12 THEN '6-12'
        WHEN age BETWEEN 13 AND 19 THEN '13-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 44 THEN '30-44'
        WHEN age BETWEEN 45 AND 59 THEN '45-59'
        WHEN age BETWEEN 60 AND 74 THEN '60-74'
        WHEN age BETWEEN 75 AND 94 THEN '75-94'
    END AS age_group,
    COUNT(*) AS people_count
FROM table1
group by age_group,gender
ORDER BY min(age);

select  background_father,count(background_father)
from table1
group by background_father
order by count(background_father);


select  background_mother,count(background_mother)
from table1
group by background_mother
order by count(background_mother);

select cancer_history,count(cancer_history)
from table1
group by cancer_history;

select distinct fitspatrick,count(fitspatrick) 
from table2
group by fitspatrick;
--/ 0F-579,1F-46,2F-285,3F-142,4F-28,5F-7,6F-1

select distinct diagnostic,count(diagnostic) 
from table2
group by diagnostic;
--ACK=461,BCC=273,MEL=17,NEV=144,SCC=56,SEK=137

/*select distinct table2.diagnostic,CASE
							        WHEN table1.age BETWEEN 6 AND 17 THEN '6-17'
							        WHEN table1.age BETWEEN 18 AND 29 THEN '18-29'
							        WHEN table1.age BETWEEN 30 AND 41 THEN '30-41'
							        WHEN table1.age BETWEEN 42 AND 53 THEN '42-53'
							        WHEN table1.age BETWEEN 54 AND 65 THEN '54-65'
							        WHEN table1.age BETWEEN 66 AND 77 THEN '66-77'
							        WHEN table1.age BETWEEN 78 AND 89 THEN '78-89'
							        WHEN table1.age BETWEEN 90 AND 101 THEN '90-101'
								 END AS age_group,
								 count(*) AS "people_count"
from table2
join table1 on table1.patient_id=table2.patient_id
group by table2.diagnostic,table1.age;*/

select distinct region,count(region) as "Count of Region"
from table2
group by region
order by "Count of Region" desc;

select biopsed || ' '||diagnostic as "Full diagnosis",count(biopsed) 
from table2
group by "Full diagnosis"
order by count(biopsed) ;

select diameter_1 from table2;




--smoke,drink related to lesions
select t1.smoke,t1.drink,t2.diagnostic
from table1 t1
join table2 t2 on t1.patient_id=t2.patient_id
where t1.smoke='true' and t1.drink='true' and t2.diagnostic='MEL';
--8SCC,5ACK,14BCC,1MEL

--How does lesion type vary across Fitzpatrick skin types (0–6)?
select distinct fitspatrick,diagnostic,count(diagnostic)
from table1 t1
join table2 t2 on t1.patient_id=t2.patient_id
where fitspatrick=6
group by fitspatrick,diagnostic;

/*The population reduces across the spectrum of fitspatrick skin type
 fitspatrick 0 mostly affected by ACK NEV and SEK with a number of 328,128 and 123 respectively
 Total=579
 Around of half of the population affected were from the fitspatrick of 0

 fitspatrick 1 mostly affected by BCC,ACK,SCC,SEK and NEV with a number of 32,6,5,2,1 respectively
 Total=46
 4% of the population affected were from fitspatrick of 1

 fitspatrick 2 mostly affected by BCC,ACK,SCC,MEL SEK and NEV with a number of 156,74,32,11,7,5 respectively
 Total=285
 26% of the population affected were from fitspatrick of 2

 fitspatrick 3 mostly affected by BCC,ACK,SCC,MEL SEK and NEV with a number of 71,43,17,4,2,5 respectively
 Total=142
 13% of the population affected were from fitspatrick of 3

 fitspatrick 4 mostly affected by BCC,ACK,SCC,NEV,MEL with a number of 12,8,4,2,2 respectively
 Total=28
 2.5% of the population affected were from fitspatrick of 3

 fitspatrick 5 mostly affected by BCC,ACK,SCC,NEV  with a number of 2,2,2,1respectively
 Total=7
 2.5% of the population affected were from fitspatrick of 3

 fitspatrick 6 mostly affected by SEK with a number of 1
 */

--trying to identify lesion feature associated with malignancy(MEL,SCC,BCC) 

--For itch
select distinct diagnostic,itch,count(itch)
from table2
where diagnostic='BCC'
group by diagnostic,itch 
--12 no itch but had MEL,5 with itch had MEL
--13 with no itch had SCC while 43 with itch had SCC
--61 with no itch had BCC while 212 with itch had BCC;

--lesion growth
select distinct diagnostic,grew,count(grew)
from table2
where diagnostic='BCC'
group by diagnostic,grew;
-- 1 did not grow but had MEL,16 grew and had MEL
--19 did not grow but had SCC,37 grew and had SCC
--67 did not grow but had BCC,206 grew and had BCC

--hurt/causes pain
select distinct diagnostic,hurt,count(hurt)
from table2
where diagnostic='BCC'
group by diagnostic,hurt;

--17 did not cause pain but had MEL
--37 does not hurts but had SCC while 19 hurts but had SCC
--164 does not hurts but had BCC while 109 hurts and had BCC

--changed color
select distinct diagnostic,changed,count(changed)
from table2
where diagnostic='BCC'
group by diagnostic,changed;

--3 does not change color but had MEL,14 changed color and had MEL
--43 does not change color but had SCC,13 changed color but had SCC
--237 does not change color but had BCC,36 changed color and had BCC

--bleeds.
select distinct diagnostic,bleed,count(bleed)
from table2
where diagnostic='BCC'
group by diagnostic,bleed;

--17 did not bleed but had MEL
--39 did not bleed but had SCC,17 bled and had SCC
--110 did not bleed but had BCC while 163 bled and had BCC

--elevation
select distinct diagnostic,elevation,count(elevation)
from table2
where diagnostic='BCC'
group by diagnostic,elevation;

--12 did not elevate but had MEL,5 elevated and had MEL
--11 did not elevate but had SCC,45 elevated and had SCC
--37 did not elevate but had BCC,236 elevated and had BCC

--trying to identify lesion feature associated with non-malignancy(NEV,SEK) 

--For itch
select distinct diagnostic,itch,count(itch)
from table2
where diagnostic='SEK'
group by diagnostic,itch 
--127 no itch but had NEV,17 with itch had NEV
--94 with no itch had SEK while 43 with itch had SEK

--lesion growth
select distinct diagnostic,grew,count(grew)
from table2
where diagnostic='SEK'
group by diagnostic,grew
--44 with no lesion growth but had NEV,100 with lesion growth had NEV
--63 with no lesion growth had SEK while 74 with lesion growth had SEK

--hurt/causes pain
select distinct diagnostic,hurt,count(hurt)
from table2
where diagnostic='SEK'
group by diagnostic,hurt;

--141 did not cause pain but had NEV and 3 had pain and NEV
--135 does not hurts but had SEK, while 2 hurts and had SCC


--changed color
select distinct diagnostic,changed,count(changed)
from table2
where diagnostic='SEK'
group by diagnostic,changed;

--130 does not change color but had NEV,14 changed color and had NEV
--132 does not change color but had SEK,5 changed color but had SEK


--bleeds.
select distinct diagnostic,bleed,count(bleed)
from table2
where diagnostic='SEK'
group by diagnostic,bleed;

--143 did not bleed but had NEV and 1 bled but had NEV
--134 did not bleed but had SEK,3 bled and had SEK


--elevation
select distinct diagnostic,elevation,count(elevation)
from table2
where diagnostic='SEK'
group by diagnostic,elevation;

--41 did not elevate but had NEV,103 elevated and had NEV
--37 did not elevate but had SEK,100 elevated and had SEK


--ACK
--For itch
select distinct diagnostic,itch,count(itch)
from table2
where diagnostic='ACK'
group by diagnostic,itch 
--111 no itch but had ACK,350 with itch had ACK

--lesion growth
select distinct diagnostic,grew,count(grew)
from table2
where diagnostic='ACK'
group by diagnostic,grew
--384 with no lesion growth but had ACK,77 with lesion growth had ACK

--hurt/causes pain
select distinct diagnostic,hurt,count(hurt)
from table2
where diagnostic='ACK'
group by diagnostic,hurt;

--443 did not cause pain but had ACK and 18 had pain and ACK



--changed color
select distinct diagnostic,changed,count(changed)
from table2
where diagnostic='ACK'
group by diagnostic,changed;

--444 does not change color but had ACK,17 changed color and had ACK



--bleeds.
select distinct diagnostic,bleed,count(bleed)
from table2
where diagnostic='ACK'
group by diagnostic,bleed;

--423 did not bleed but had ACK and 38 bled but had ACK



--elevation
select distinct diagnostic,elevation,count(elevation)
from table2
where diagnostic='ACK'
group by diagnostic,elevation;

--339 did not elevate but had ACK,122 elevated and had ACK



--smokers vs non-smokers
select distinct smoke,count(smoke)
from table1
group by smoke;

--drink vs non-drinkers
select distinct drink ,count(drink)
from table1
group by drink;

--Is smoking associated with higher SCC (especially lip/face lesions)?
select smoke,diagnostic,region
from table2
join table1 on table1.patient_id=table2.patient_id
where smoke='true';
--Just 2 people smoking has mel

--Out of 62 smokers,what is count of each type of lesion
select distinct diagnostic,count(diagnostic)
from table2
join table1 on table1.patient_id=table2.patient_id
group by diagnostic,smoke
having smoke='true';
--ACK=13,BCC=30,MEL=2,SCC=15,NEV=1,SEK=1

--Out of 138 drinkers,what is the count of each type of lesion
select distinct diagnostic,count(diagnostic)
from table2
join table1 on table1.patient_id=table2.patient_id
group by diagnostic,drink
having drink='true';
--ACK=33,BCC=77,MEL=5,NEV=3,SCC=16,SEK=4

--Is pesticide exposure linked to higher cancer risk?
select distinct diagnostic,count(diagnostic)
from table2
join table1 on table1.patient_id=table2.patient_id
group by diagnostic,pesticide
having pesticide='true';

--Does access (or lack) of piped water / sewage system relate to skin cancer risk in this dataset?
select distinct has_piped_water ,count(has_piped_water)
from table1
group by has_piped_water;


select distinct diagnostic,count(diagnostic)
from table2
join table1 on table1.patient_id=table2.patient_id
group by diagnostic,has_piped_water
having has_piped_water='false';
--Piped water:BCC-150 SCC=36 MEL=9
--Non-piped water:BCC-123 SCC-20 MEL-8

--sewage system
select distinct has_sewage_system  ,count( has_sewage_system)
from table1
group by has_sewage_system;
--815 don't have access to sewage system
--273 have access to sewage system


select distinct diagnostic,count(diagnostic)
from table2
join table1 on table1.patient_id=table2.patient_id
group by diagnostic,has_sewage_system
having has_sewage_system='true';

--Non-sewage system:ACK=378,BCC=146,MEL=8,NEV=134,SCC=21,SEK=128
--Sewage system:ACK=83,BCC=127,MEL=9,NEV=10,SCC=35,SEK=9


