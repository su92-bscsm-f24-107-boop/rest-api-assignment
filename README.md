# REST API Assignment (Express.js + MVC + MySQL/XAMPP)

This version uses MySQL from XAMPP instead of MongoDB. The app automatically creates the `course_api_db` database and its three tables when it first connects, so you do not need to run a SQL script manually.

## Requirements
- Node.js installed
- XAMPP installed
- Postman

## Run it
1. Extract the ZIP.
2. Open `rest-api-assignment-xampp` in File Explorer.
3. Double-click `START-WINDOWS.bat` to create `.env` and install dependencies.
4. Open XAMPP Control Panel and click **Start** next to **MySQL**. Apache is not required for the API itself.
5. Open `.env` and verify these values match your XAMPP MySQL setup:
   ```
   PORT=5000
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=course_api_db
   JWT_SECRET=change_this_to_a_long_random_secret_before_use
   ```
   Standard XAMPP often uses user `root` with a blank password. If you set a MySQL password, enter it in `DB_PASSWORD`.
6. Double-click `START-SERVER.bat`.
7. Expected output:
   - `MySQL connected; database "course_api_db" and tables are ready.`
   - `Server running at http://localhost:5000`

If port 3306 is busy, check XAMPP's MySQL port and change `DB_PORT` accordingly.

## Endpoints

### Auth (public)
- `POST /api/auth/register`
- `POST /api/auth/login`

### Categories (Bearer JWT required)
- `POST /api/categories`
- `GET /api/categories`
- `GET /api/categories/:id`
- `PUT /api/categories/:id`
- `DELETE /api/categories/:id`

### Courses (Bearer JWT required)
- `POST /api/courses`
- `GET /api/courses`
- `GET /api/courses/:id`
- `PUT /api/courses/:id`
- `DELETE /api/courses/:id`

## Postman requests

### 1. Register
`POST http://localhost:5000/api/auth/register`
Body > raw > JSON:
```json
{
  "name": "Test Student",
  "email": "student@example.com",
  "password": "Student123"
}
```
Expected: `201 Created`. Use a new email if already registered.

### 2. Login
`POST http://localhost:5000/api/auth/login`
Body > raw > JSON:
```json
{
  "email": "student@example.com",
  "password": "Student123"
}
```
Expected: `200 OK`. Copy the returned token.

### 3. Create category
`POST http://localhost:5000/api/categories`
Authorization > Bearer Token > paste login token.
Body > raw > JSON:
```json
{
  "name": "Web Development",
  "description": "Courses about web technologies"
}
```
Expected: `201 Created`. The response contains a numeric category `id`.

### 4. Get categories
`GET http://localhost:5000/api/categories`
Authorization: Bearer Token.
Expected: `200 OK`.

### 5. Validation error
`POST http://localhost:5000/api/categories`
Authorization: Bearer Token.
Body:
```json
{
  "description": "Category name intentionally missing"
}
```
Expected: `400 Bad Request`.

### 6. Unknown route
`GET http://localhost:5000/api/unknown`
Expected: `404 Not Found`.

### Create a course
`POST http://localhost:5000/api/courses`
Authorization: Bearer Token.
Use the numeric category `id` returned by category creation:
```json
{
  "title": "MERN Stack Development",
  "description": "Learn full-stack web development",
  "instructor": "Ali Ahmed",
  "price": 5000,
  "category_id": 1
}
```
Replace `category_id` with your actual category ID. Expected: `201 Created`.

## Required evidence
Capture real Postman screenshots that show the URL, method, relevant headers, status and response body. Print your own name and roll number at the top of each page:
1. Register and login success.
2. POST category — `201 Created`.
3. GET categories — `200 OK`.
4. Missing category name — `400 Bad Request`.
5. Unknown URL — `404 Not Found`.

Keep `.env` and JWT tokens private. Do not upload secrets to GitHub.
