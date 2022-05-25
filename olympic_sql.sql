CREATE DATABASE DB9;  		-- database
USE DB9;					-- using database


------------------------------------------------
# creating table of name
CREATE TABLE name(
s_no VARCHAR(3) PRIMARY KEY,
name VARCHAR(20),
age VARCHAR(5), 
country varchar(15), 
total_medal int(5));


# inserting values in name table
INSERT INTO name VALUES(1,"Michael Phelps",23, "United States",	8);
INSERT INTO name
VALUES (2,"Michael Phelps",19,"United States",8);

INSERT INTO name
VALUES (3,"Michael Phelps",27,"United States",6);

INSERT INTO name
VALUES ( 4,"Natalie Coughlin",25,"Russia",6);

INSERT INTO name
VALUES( 5,"Alicia Coutts",24,"Australia",5);

INSERT INTO name
VALUES (6,"Missy Franklin",17,"United States",5);

INSERT INTO name
VALUES( 7,"Ryan Lochte",27,"United States",5);

INSERT INTO name
VALUES( 8,"Allison Schmitt",22,"United States",5);

INSERT INTO name
VALUES( 9,"Natalie Coughlin",21,"United States",5);


# checking name table
SELECT * FROM name;
----------------------------------------------------------


# creating sports table
CREATE TABLE sports(
s_no VARCHAR(3),
sport_no VARCHAR(3) PRIMARY KEY,
year varchar(10), 
date_given varchar(15), 
sports varchar(20), 
gold_medal varchar(3));


# inserting row value in sports column
INSERT INTO sports
VALUES(1,"sp1",2008,"8/24/2008","Swimming",8);

INSERT INTO sports
VALUES (2,"sp2",2004,"8/29/2004","Swimming",6);

INSERT INTO sports
VALUES( 3,"sp3",2012,"8/12/2012","Swimming",4);

INSERT INTO sports
VALUES( 4,"sp4",2008,"8/24/2008","Swimming",1);

INSERT INTO sports
VALUES( 5,"sp5",2000,"10/1/2000","Gymnastics",2);

INSERT INTO sports
VALUES( 6,"sp6",2012,"8/12/2012","Swimming",1);

INSERT INTO sports
VALUES( 7,"sp7",2012,"8/12/2012","Swimming",4);

INSERT INTO sports
VALUES( 8,"sp8",2012,"8/12/2012","Swimming",2);

INSERT INTO sports
VALUES( 9,"sp9",2012,"8/12/2012","Swimming",3);


SELECT * FROM sports;

------------------------------------------------------------

# creating medal table
CREATE TABLE medal(
sport_no VARCHAR(3) PRIMARY KEY,
gold_medal  varchar(5),
silver_medal varchar(5),
bronze_medal varchar(5),
total_medal varchar(5));


# inserting row value in medal table
INSERT INTO medal
VALUES ("sp1",8,0,0,8);

INSERT INTO medal
VALUES ("sp2",6,0,2,8);


INSERT INTO medal
VALUES ("sp3",4,2,0,6);

INSERT INTO medal
VALUES ("sp4",1,2,3,6);

INSERT INTO medal
VALUES("sp5",2,1,3,6);

INSERT INTO medal
VALUES ("sp6",1,3,1,5);

INSERT INTO medal
VALUES ("sp7",4,0,1,5);

INSERT INTO medal
VALUES ("sp8",2,2,1,5);

INSERT INTO medal
VALUES ("sp9",3,1,1,5);

# medal table checking
SELECT * FROM medal;

------------------------------------------------------------------

-- Queries

# 1) Find the average number of medals won by each country
SELECT country, AVG(total_medal) FROM name
GROUP BY country; 

# 2) Display the countries and the number of gold medals they have won in decreasing order
SELECT name.country, sports.gold_medal FROM name
INNER JOIN sports ON name.s_no = sports.s_no
ORDER BY sports.gold_medal DESC;

# 3) Display the list of people and the medals they have won in descending order, grouped by their country
SELECT name, total_medal, country FROM name
GROUP BY country
ORDER BY total_medal DESC;

# 4) Display the list of people with the medals they have won according to their their age
SELECT name.name, name.age, medal.gold_medal, medal.silver_medal, medal.bronze_medal, medal.total_medal 
FROM medal
INNER JOIN sports ON sports.sport_no = medal.sport_no
INNER JOIN name ON name.s_no = sports.s_no;

# 5) Which country has won the most number of medals (cumulative)
SELECT country, MAX(total_medal) FROM name;
