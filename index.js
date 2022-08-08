const { Client } = require("pg");

const config = {
  user: "postgres",
  password: "postgres",
  host: "localhost",
  port: 5432,
  database: "fm_test",
};

const users = [
  {
    first_name: "Bred",
    last_name: "Pit",
    email: "pit2@gmail.com",
    is_male: true,
    birthday: "1963-06-28",
    height: 1.92,
  },
  {
    first_name: "Bred",
    last_name: "Pit",
    email: "pit3@gmail.com",
    is_male: true,
    birthday: "1963-06-28",
    height: 1.92,
  },
  {
    first_name: "Bred",
    last_name: "Pit",
    email: "pit4@gmail.com",
    is_male: true,
    birthday: "1963-06-28",
    height: 1.92,
  },
];
const client = new Client(config);
start();

async function start() {
  await client.connect();

  const result = await client.query(`
  INSERT INTO "users"("first_name","last_name","email","is_male","birthday","height") 
  VALUES ${mapUsers(users)};
  `);
  
  await client.end();
}

function mapUsers(users) {
  return users
    .map(
      (user) =>
        `('${user.first_name}', '${user.last_name}', '${user.email}', '${user.is_male}', '${user.birthday}', '${user.height}')`
    )
    .join(",");
}
