
SELECT "id", "height", "weight"
FROM "users";

SELECT max("height")
FROM "users";

SELECT avg("height")
FROM "users";

SELECT min("weight") AS "min weight"
FROM users;

SELECT avg("weight") AS "avg weight"
FROM "users"
WHERE "is_male"=TRUE;

SELECT count(*)
FROM "users";


SELECT min("weight") AS "min weight", "first_name"
FROM "users"
WHERE "first_name" IN ('Alex', 'David', 'Max')
GROUP BY "first_name";

SELECT count(*) , sum("weight") AS "sum weight", "first_name"
FROM "users"
WHERE "first_name" IN ('Alex', 'David', 'Max')
GROUP BY "first_name";

SELECT count(*), sum("weight"), "is_male"
FROM "users"
GROUP BY("is_male");



SELECT max("height")
FROM"users"
WHERE "is_male" =true AND "weight">200;





--3
SELECT  min("height") 
FROM "users" 
WHERE EXTRACT("months" FROM "birthday") = 1;

--4
SELECT avg ("height"), "is_male"
FROM "users"
WHERE ...
GROUP BY "is_male";

--6. 
SELECT count(*), EXTRACT ("years" from "birthday") AS "years"
FROM "users"
WHERE EXTRACT ("years" from "birthday") IN (1992,2001)
GROUP BY "years";

SELECT *
FROM (
    SELECT count(*), 
    EXTRACT ("years" from "birthday") AS "years"
    FROM "users" 
    GROUP BY "years"
  ) AS "tuy"
WHERE "tuy"."years" IN (1992,2001);




--7
SELECT sum("height"), 
  EXTRACT("months" FROM "birthday") AS "month" 
FROM "users" 
GROUP BY "month";








SELECT "height",count(*)
FROM "users"
GROUP BY "height"
LIMIT 10;



