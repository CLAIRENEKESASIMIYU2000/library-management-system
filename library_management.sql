-- ===============================================
-- Library Management System Database
-- ===============================================

-- Drop tables if they exist
DROP TABLE IF EXISTS Borrowings;
DROP TABLE IF EXISTS BookAuthors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Categories;

-- ===============================================
-- Create Tables
-- ===============================================
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    CategoryID INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    TotalCopies INT NOT NULL DEFAULT 1,
    AvailableCopies INT NOT NULL DEFAULT 1,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE BookAuthors (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20)
);

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role VARCHAR(50) NOT NULL
);

CREATE TABLE Borrowings (
    BorrowingID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ===============================================
-- Insert Sample Data
-- ===============================================

-- Categories
INSERT INTO Categories (CategoryName) VALUES 
('Fiction'), 
('Science'), 
('History');

-- Authors
INSERT INTO Authors (FirstName, LastName) VALUES 
('Jane', 'Austen'), 
('Mark', 'Twain'), 
('Albert', 'Einstein');

-- Books
INSERT INTO Books (Title, CategoryID, ISBN, TotalCopies, AvailableCopies) VALUES
('Pride and Prejudice', 1, '111-222', 5, 5),
('Adventures of Tom Sawyer', 1, '333-444', 3, 3),
('Relativity: The Special and General Theory', 2, '555-666', 2, 2);

-- BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1), 
(2, 2), 
(3, 3);

-- Members
INSERT INTO Members (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john@example.com', '0712345678'),
('Mary', 'Smith', 'mary@example.com', '0723456789');

-- Staff
INSERT INTO Staff (FirstName, LastName, Email, Role) VALUES
('Alice', 'Johnson', 'alice@library.com', 'Librarian'),
('Bob', 'Williams', 'bob@library.com', 'Assistant');

-- Borrowings
INSERT INTO Borrowings (MemberID, BookID, BorrowDate, DueDate) VALUES
(1, 1, '2025-08-15', '2025-08-30'),
(2, 2, '2025-08-16', '2025-08-31');
