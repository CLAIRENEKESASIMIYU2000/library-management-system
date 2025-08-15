 LIBRARY MANAGEMENT SYSTEM

PROJECT TITLE

Library Management System Database

DESCRIPTION OF WHAT THE PROJECT DOES

This project is a complete relational database for managing library operations using **MySQL**.
It is designed to store and manage information about:

* Books and their categories
* Authors and their books
* Library members and staff
* Borrowing transactions

The system ensures **data integrity** and **accuracy** using:

* **Primary Keys (PK)**
* **Foreign Keys (FK)**
* **NOT NULL** constraints
* **UNIQUE** constraints

It supports multiple relationship types:

* **One-to-Many**: A category can have many books, but each book belongs to only one category.
* **Many-to-Many**: A book can have multiple authors, and an author can write multiple books (handled through a junction table).
* **One-to-Many**: A member can borrow multiple books, but each borrowing record belongs to one member only.

The database includes **sample data** for quick testing and demonstration of the system’s functionality.

---

## HOW TO RUN / SETUP THE PROJECT

### REQUIREMENTS

* MySQL installed on your computer
* MySQL Workbench or command line access

---

### STEP 1 – CREATE THE DATABASE

```sql
CREATE DATABASE LibraryDB;
USE LibraryDB;
```

---

### STEP 2 – IMPORT THE SQL FILE

**Option 1 – Using MySQL Workbench**

1. Open **MySQL Workbench**
2. Click **File → Open SQL Script**
3. Browse to `library_management.sql` and open it
4. Click the **Run** button (lightning icon)

**Option 2 – Using Command Line**

1. Open your command prompt or terminal
2. Navigate to the folder containing `library_management.sql`
3. Run:

   ```
   mysql -u root -p LibraryDB < library_management.sql
   ```
4. Enter your MySQL password when prompted

---

### STEP 3 – VERIFY INSTALLATION

```sql
SHOW TABLES;
SELECT * FROM Books;
```

---

## ERD (ENTITY RELATIONSHIP DIAGRAM)

![Library Management ERD](https://github.com/CLAIRENEKESASIMIYU2000/library-management-system/blob/main/ERD.png?raw=true)
