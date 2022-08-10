--добавить в таблицу юзеров колонку вес от 0 до 250

ALTER TABLE "users"
ADD COLUMN "weight" INT CHECK("weight">0 AND "weight"<=250);

-- ALTER TABLE "users"
-- ADD COLUMN "weight" INT CHECK("weight" BETWEEN SYMMETRIC 250 AND 0);

--CRUD DB         TABLE
--     CREATE     INSERT
--     SELECT     SELECT
--     ALTER      UPDATE
--     DROP       DELETE


UPDATE "users"
SET "weight" = ("height"-1)*100;

UPDATE "users"
SET "weight" = 55
WHERE "first_name"='Alex';

SELECT *
FROM "users"
WHERE "first_name"='Alex';

UPDATE "users"
SET "weight" = 245
WHERE "is_male"=true AND "height">2.2;

UPDATE "users"
SET "weight" = 40
WHERE "is_male"=false AND "height" < 1.4;

UPDATE "users"
SET "last_name" = 'Jolli'
WHERE "id" = 6;

SELECT *
FROM "users"
WHERE "id" = 6;

DELETE FROM "users"
WHERE "id" = 6;

--DELETE FROM "users";
--TRUNCATE TABLE "users";


UPDATE "users"
SET "weight"=88
where "id" = 155
RETURNING "last_name";

DELETE FROM "users"
where "id" = 153
RETURNING *;



UPDATE "users"
SET "height" = "height"-0.05
WHERE length ("first_name") > 7 AND "height" > 1.55
RETURNING *;
