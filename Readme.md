<h1 align="center"> Authentication_APP - ExpressJs</h1>

This is a simple Database Administrator application specially for backend only. Built with NodeJs using the ExpressJs Framework.
Express.js is a web application framework for Node.js. [More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.18.3-green.svg?style=rounded-square)](https://nodejs.org/)
[![postgresql](https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg)

## Tech Stack

**Client:** Postman

**Server:** NodeJs, ExpressJs, PostgreSql

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## Installation

Install my-project with npm

```bash
  npm install IMP_test
  cd IMP_test
```

```bash
  for install database
  cd src/database file database_source.sql
  import to your local database
```

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm start`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Open Postman desktop application or Chrome web app extension that has installed before
6. Choose HTTP Method and enter request url.(ex. localhost:8080/)
7. You can see all the end point [here](#end-point)

## Features

- SignUp User
- Login User
- List User
- Pagination , Search and Sorting

## API Reference

you can see [here](https://documenter.getpostman.com/view/15102825/2s93RXrqG6) postman collection

#### SIGN UP

```http
  POST /auth/signup
```

| Parameter  | Type     | Description                       |
| :--------- | :------- | :-------------------------------- |
| `username` | `string` | **Required**. Your username field |
| `password` | `string` | **Required**. Your password field |
| `fullname` | `string` | **Required**. Your fullname field |

#### LOGIN

```http
  POST /auth/login
```

| Parameter  | Type     | Description                       |
| :--------- | :------- | :-------------------------------- |
| `username` | `string` | **Required**. Your username field |
| `password` | `string` | **Required**. Your password field |

## Authors

- [@Nugroho-00](https://github.com/Nugroho-00)
