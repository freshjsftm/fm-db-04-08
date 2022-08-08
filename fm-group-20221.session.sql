DROP TABLE "users";

CREATE TABLE "users"(
  "id" BIGSERIAL PRIMARY KEY,
  "first_name" VARCHAR(32) NOT NULL CHECK ("first_name" != ''),
  "last_name" VARCHAR(32) NOT NULL CHECK ("last_name" != ''),
  "email" VARCHAR(256) NOT NULL CHECK ("email" != ''),
  "is_male" BOOLEAN NOT NULL,
  "birthday" DATE NOT NULL CHECK ("birthday" < current_date),
  "height" NUMERIC(3,2) NOT NULL CHECK ("height" > 1.2 AND "height" < 2.5)
);

INSERT INTO "users"("first_name","last_name","email","is_male","birthday","height") 
VALUES 
('Elon', 'Musk', 'muske@gmail.com', TRUE, '1971-06-28', 1.8),
('Elen', 'Musk', 'musk2@gmail.com', FALSE, '1951-04-18', 1.58),
('Tom', 'Musk', 'qwe@qwe.com', TRUE, '1991-06-28', 1.98),
('Rob', 'Bob', 'muskrob@gmail.com', TRUE, '1971-06-28', 2.08);

-- ALTER TABLE "users"
-- ADD UNIQUE("email");

-- ALTER TABLE "users"
-- DROP CONSTRAINT "users_height_check";


CREATE TABLE "products"(
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(512) NOT NULL CHECK ("name" != ''),
  "category" VARCHAR(128) NOT NULL CHECK ("category" != ''),
  "price" DECIMAL(16,2) NOT NULL CHECK ("price" >0),
  "quantity" INT NOT NULL CHECK ("quantity">0),
  UNIQUE("name", "category")
);

INSERT INTO "products"("name","category","price","quantity") 
VALUES 
('milk', 'food', 25.12, 20),
('egg', 'food', 2.12, 200000),
('coffee', 'food', 95.12, 200),
('sony', 'phone', 2512, 5);

CREATE TABLE "orders"(
  "id" BIGSERIAL PRIMARY KEY,
  "customerId" INTEGER REFERENCES "users" ("id"),
  "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp
);

INSERT INTO "orders"("customerId") 
VALUES (1),(2),(1);

CREATE TABLE "products_to_orders"(
  "productId" BIGINT REFERENCES "products" ("id"),
  "orderId" BIGINT REFERENCES "orders" ("id"),
  "quantity" INT NOT NULL CHECK ("quantity">0),
  PRIMARY KEY ("productId", "orderId")
);

INSERT INTO "products_to_orders"("productId","orderId" , "quantity" ) 
VALUES (1,2,10),(4,1,1),(3,2,3);

