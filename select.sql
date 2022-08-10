SELECT *
FROM "users";

SELECT "first_name",
  "last_name",
  "is_male"
FROM "users";

SELECT "first_name"
FROM "users"
WHERE "is_male"=false;

SELECT "first_name", "birthday", "height"
FROM "users"
WHERE "first_name"='Alan' OR "first_name"='David';

SELECT "first_name", "birthday", "height"
FROM "users"
WHERE "first_name" IN ('Alan', 'Alex', 'Debbie');

SELECT "first_name", "birthday", "height"
FROM "users"
WHERE "height">=1.5 AND "height"<=1.6;

SELECT "first_name", "birthday", "height"
FROM "users"
WHERE "height" NOT BETWEEN 1.5 AND 1.6;


SELECT "first_name", "birthday", "height", age("birthday")
FROM "users"
WHERE age("birthday") BETWEEN make_interval(20) AND make_interval(23);

SELECT "first_name", "birthday", "height"
FROM "users"
WHERE EXTRACT("months" from "birthday")=8;


SELECT * FROM "users"
WHERE "is_male" = false AND age("birthday") BETWEEN make_interval(25) AND make_interval(32) AND "height" < 1.8; 

SELECT * FROM "users"
WHERE "is_male" = true AND age("birthday") > make_interval(21)  AND "height" > 1.9;

SELECT "first_name", "email", "birthday"
FROM "users"
WHERE EXTRACT(DAY from "birthday") = 20 AND EXTRACT(MONTH from "birthday") = 3;


SELECT "first_name","email","birthday"
FROM "users"
WHERE "is_male" = true AND EXTRACT ("years" from "birthday") = 1999;

SELECT "id" as "serial number",
       "email" as "contacts",
       "first_name" || ' ' || "last_name" as "full name"
FROM "users" as "u"
WHERE "u"."id" BETWEEN 170 AND 175;  

SELECT "id" as "serial number",
       "email" as "contacts",
       concat("first_name",' ',"last_name") as "full name"
FROM "users" as "u"
WHERE "u"."id" BETWEEN 170 AND 175; 



SELECT "birthday",
    concat("first_name",' ',"last_name") as "full name",
    length(concat("first_name",' ',"last_name")) as "length"
FROM "users"
WHERE length(concat("first_name",' ',"last_name")) < 10;  





SELECT *
FROM (SELECT "birthday",
    concat("first_name",' ',"last_name") as "full name",
    length(concat("first_name",' ',"last_name")) as "length"
FROM "users") AS "fn"
WHERE length("fn"."full name")=13;  

SELECT *
FROM (
      SELECT "birthday",
        concat("first_name",' ',"last_name") as "full name",
        length(concat("first_name",' ',"last_name")) as "length"
      FROM "users"
    ) AS "fn"
WHERE "fn"."length" =20;  

SELECT *
from (
  SELECT length("first_name") as "length",
      "first_name", "is_male", "height"
    FROM "users") as "new_name"
WHERE "new_name"."length">=7
LIMIT 7;


SELECT *
FROM (
    SELECT
      length("email") as "length",
      "email",  
      "birthday" 
      FROM "users"
    ) as "sa"
WHERE "sa"."length">=15 AND "sa"."length"<20;




