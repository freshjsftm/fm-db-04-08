
CREATE TABLE "chats"(
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(256) NOT NULL CHECK ("name" != ''),
  "adminId" BIGINT REFERENCES "users"("id"),
  "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO "chats"("name","adminId")
VALUES ('react', 1), ('db', 3);

CREATE TABLE "users_to_chats"(
  "userId" BIGINT REFERENCES "users"("id"),
  "chatId" BIGINT REFERENCES "chats"("id"),
  PRIMARY KEY ("userId", "chatId")
);

INSERT INTO "users_to_chats"("chatId", "userId")
VALUES (1,1), (2,3), (1,3), (1,2), (2,4);

CREATE TABLE "messages"(
  "id" BIGSERIAL PRIMARY KEY,
  "body" VARCHAR(1024) NOT NULL CHECK ("body" != ''),
  "userId" BIGINT, 
  "chatId" BIGINT, 
  FOREIGN KEY ("userId", "chatId") REFERENCES "users_to_chats" ("userId", "chatId")
);

INSERT INTO "messages"("body", "userId" , "chatId")
VALUES ('hi',1,1), ('hi', 3,2), ('hi',1,1);