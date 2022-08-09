const { Client } = require("pg");
const axios = require("axios");

const http = axios.create({
  baseURL:'https://randomuser.me/api/'
})

const loaderUsers = async () =>{
  const {data:{results}} = await http.get('?results=500&seed=fm&page=1&nat=gb');
  return results;
}

const config = {
  user: "postgres",
  password: "postgres",
  host: "localhost",
  port: 5432,
  database: "fm_test",
};

const client = new Client(config);
start();

async function start() {
  await client.connect();
  const users = await loaderUsers(); 
  const result = await client.query(`
  INSERT INTO "users"("first_name","last_name","email","is_male","birthday","height") 
  VALUES ${mapUsers(users)};
  `);
  
  await client.end();
}

function mapUsers(users) {
  return users
    .map(
      ({name:{first, last}, email, gender, dob:{date}}) =>
        `('${first}', '${last}', '${email}', '${gender==='male'}', '${date}', '${(Math.random()+1.3).toFixed(2)}')`
    )
    .join(",");
}
