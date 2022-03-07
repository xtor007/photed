const fastify = require('fastify')({ logger: true });
const request = require('request');
//const fetch = require('node-fetch');
//const node-fetch = require('node-fetch');
import fetch from "node-fetch";

var server_port = process.env.PORT || 8000;
var server_host = process.env.YOUR_HOST || 'localhost';

function queryFetch(inQuery, inVariables) {
  return fetch('https://humble-redbird-47.hasura.app/v1/graphql',{
    method: 'POST',
    headers: {
                'content-type': 'application/json',
                'x-hasura-admin-secret': 'gqENi8lKIYqOYqSqET3CphWp3ozWDDKd61Er1smVjWoJPzKIFxcAlfqgrTT6IHi6'
             },
    body: JSON.stringify({
      query: inQuery,
      variables: inVariables
    })
  }).then(res => res.json())
}

fastify.get('/logins', async (request, reply) => {
  console.log(queryFetch(`query MyQuery {
  PhotedDB_Logins(order_by: {}) {
    login
  }
}`))
  return "jhbkdvknjg"
})

const start = async () => {
  try {
    await fastify.listen(server_port,server_host)
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}
start()
