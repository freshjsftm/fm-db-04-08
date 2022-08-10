
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