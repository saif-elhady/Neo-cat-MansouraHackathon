# FInTrack

## Description
This project is a backend API built with Node.js, Express, and MongoDB. It includes functionalities for user authentication, goal management, and balance updates.

## Features
- User authentication (sign up, login, logout, password reset)
- Goal management (create, read, update, delete goals)
- Balance updates for users
- JWT-based authentication
- Swagger documentation for API endpoints

## Prerequisites
- Node.js
- MongoDB Atlas account

## Setup

### 1. Clone the repository
```sh
git clone https://github.com/yourusername/yourproject.git
cd yourproject
```
###2. Install dependencies
```sh
npm install
```
###3. Run the application
```sh
npm start
```
##API Documentation
The API documentation is available at the following link:

[API Documentation](https://neo-cat-mansourahackathon-production.up.railway.app/api-docs)

##Project Structure  
.  
├── controllers  
│   ├── goalController.ts  
│   └── userController.ts  
├── middlewares  
│   └── checkAuth.ts  
├── models  
│   ├── goalSchema.ts  
│   └── userSchema.ts  
├── routes  
│   ├── goalRoutes.ts  
│   └── userRoutes.ts  
├── services  
│   └── authService.ts  
├── utils  
│   ├── crudUtils.ts  
│   └── validation  
│       ├── goalValidation.ts  
│       └── userValidation.ts  
├── .env  
├── app.ts  
├── db.ts  
├── package.json  
└── README.md  
