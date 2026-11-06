# College Lab Equipment Management System

This version follows the three tables shown in your project specification exactly:
1. `equipment`
2. `users`
3. `issue_records`

## Technology
HTML, CSS, JavaScript, Node.js, Express, MySQL, JWT authentication and bcrypt password hashing.

## Features
- Student, Faculty and Admin login
- Student/faculty account registration
- Admin dashboard and inventory management
- Add, edit, delete and update equipment status
- Students/faculty can submit equipment requests
- Admin can approve/reject requests
- Approval creates an issue by setting issue_date and status
- Admin can record normal returns or damaged returns
- Users can view only their own issue/request history; Admin can view all records

## Setup
1. Install Node.js 18+ and MySQL 8+.
2. Run `database.sql` in MySQL Workbench.
3. Copy `.env.example` to `.env` and set your MySQL password and a private JWT_SECRET.
4. Open terminal in this folder and run `npm install`.
5. Run `npm start`.
6. Open `http://localhost:3000`.

## Demo admin login
Email: `admin@college.com`
Password: `Admin@123`

The server creates this demo admin account automatically if it does not exist. Change the demo password before using the project beyond a classroom demo.

## How the three tables work
- `equipment`: stores the equipment master list and current stock.
- `users`: stores student, faculty and administrator accounts. Passwords are stored as bcrypt hashes.
- `issue_records`: stores both requests and issue/return transactions. `Pending` means request awaiting review; `Issued`, `Returned`, `Damaged`, and `Rejected` represent workflow states. `issue_date` and `return_date` are nullable until those events occur.

No separate request table is added, so the project stays aligned with the schema in your image.
