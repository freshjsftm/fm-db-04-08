CREATE EXTENSION "uuid-ossp";

DROP TABLE "message";

CREATE TABLE "message"(
  "id" BIGSERIAL PRIMARY KEY,
  "body" VARCHAR(2048) NOT NULL CHECK("body"!=''), 
  "author" VARCHAR(256) NOT NULL CHECK("author"!=''), 
  "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp, 
  "isRead" BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO "message"("author", "body")
VALUES 
('Elon Musk','text message qwerty'),
('Elon Musk','text message qwerty'),
('Elon Musk','text message qwerty');


DROP TABLE a;
CREATE TABLE a(
  b int, 
  c int,
  CONSTRAINT "UNIQUE_PAIR" PRIMARY KEY (b,c),
  CONSTRAINT "B_MORE_C" CHECK (b>c)
  );
INSERT INTO a VALUES(10,1),(20,1),(10,3);
