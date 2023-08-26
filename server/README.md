# SeTiket Server

## Features

- CRUD Event, Ticket, Notification, User
- JWT Based Authentication & Authorization
- Middleware Validation for Input Request and Role
- API testing using Jest and Supertest
- Automated Testing via Github Actions on PR to main
- Automated Deploy via Vercel


## Tech Stack


**Main:** Express, Prisma, Supabase

**Other:**  Jest, Supertest, Swagger


## Run Locally

Clone the project

```bash
  git clone https://github.com/barudak-well/setiket.git
```

Go to the server directory

```bash
  cd server
```

Install dependencies

```bash
  npm install
```

Set Environment Variables

[How to Set Env Variables](#environment-variables)

Start the server

```bash
  npm run dev
```



##  Environment Variables

To run this project, rename .env.example file to .env and fill following environment variables

`PORT`:

Port which server you running, ie: `3000`

`DATABASE_URL`: 

Your database URL for the prisma. If you using Supabase you can search in the connection string also add `?pgbouncer=true` in the end of the url.

`DIRECT_URL`:

If you not using Supabase you can delete this and also delete the one in prisma schema. If you use Supabase you can search it on connection string


`ACCESS_TOKEN_SECRET`:

You can generate this access token with running `require('crypto').randomBytes(256).toString('base64');` on your cli node.

## Running Tests

To run tests, run the following command

```bash
  npm run test
```

To run tests, with logging

```bash
  npm run test -- --silent=false
```

## Documentation


Locally you can go to ***/api-docs*** after running the server for api documentation.
