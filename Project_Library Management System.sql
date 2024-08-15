CREATE DATABASE library;
USE library;

# Create a database named library and following TABLES in the database: 
-- Table Name Branch
CREATE TABLE  Branch(
Branch_No INT PRIMARY KEY,
Manager_Id INT,
Branch_Address VARCHAR(100),
Contact_No BIGINT
);

-- Table Name Employee
CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(255),
Position VARCHAR(100),
Salary DECIMAL(10, 2),
Branch_no INT, FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Table Books
CREATE TABLE Books (
ISBN VARCHAR(13) PRIMARY KEY,
Book_title VARCHAR(255),
Category VARCHAR(100),
Rental_Price DECIMAL(10, 2),
Status ENUM('yes', 'no') DEFAULT 'yes',
Author VARCHAR(100),
Publisher VARCHAR(100)
);

-- Table customer
CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(100),
Customer_address VARCHAR(255),
Reg_date DATE
);

-- Table issueStatus
CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(255),
Issue_date DATE,
Isbn_book VARCHAR(13),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Table ReturnStatus
CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(255),
Return_date DATE,
Isbn_book2 VARCHAR(13),
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Inserting data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'MG Road, Bengaluru, Karnataka', '08012345678'),
(2, 102, 'Connaught Place, New Delhi, Delhi', '01123456789'),
(3, 103, 'Park Street, Kolkata, West Bengal', '03312345678'),
(4, 104, 'Marine Drive, Mumbai, Maharashtra', '02223456789');

SELECT* FROM BRANCH;

-- Inserting data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Ravi Sharma', 'Manager', 70000, 1),
(102, 'Sneha Kapoor', 'Librarian', 50000, 1),
(103, 'Rahul Das', 'Asst Librarian', 30000, 1),
(104, 'Vikas Singh', 'Attender', 20000, 1),
(105, 'Aarti Jain', 'Cleaning Staff', 15000, 1),

(106, 'Suresh Nair', 'Manager', 70000, 2),
(107, 'Pooja Mehta', 'Librarian', 50000, 2),
(108, 'Aman Verma', 'Asst Librarian', 30000, 2),
(109, 'Neha Gupta', 'Attender', 20000, 2),
(110, 'Kiran Patil', 'Cleaning Staff', 15000, 2),

(111, 'Amit Bhattacharya', 'Manager', 70000, 3),
(112, 'Anjali Roy', 'Librarian', 50000, 3),
(113, 'Rohit Sen', 'Asst Librarian', 30000, 3),
(114, 'Priya Chakraborty', 'Attender', 20000, 3),
(115, 'Sunita Ghosh', 'Cleaning Staff', 15000, 3),

(116, 'Rajesh Kulkarni', 'Manager', 70000, 4),
(117, 'Vidya Deshmukh', 'Librarian', 50000, 4),
(118, 'Sameer Reddy', 'Asst Librarian', 30000, 4),
(119, 'Megha Iyer', 'Attender', 20000, 4),
(120, 'Ritika Sharma', 'Cleaning Staff', 15000, 4);

SELECT* FROM employee;

-- Inserting data into Books table (50 books)
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9780143442295', 'The God of Small Things', 'Fiction', 50.00, 'yes', 'Arundhati Roy', 'Penguin India'),
('9780670081465', 'A Suitable Boy', 'Fiction', 75.00, 'yes', 'Vikram Seth', 'Penguin Books'),
('9780195643160', 'The Guide', 'Fiction', 40.00, 'yes', 'R.K. Narayan', 'Indian Thought Publications'),
('9780679405379', 'Midnight\'s Children', 'Fiction', 60.00, 'yes', 'Salman Rushdie', 'Jonathan Cape'),
('9789350293478', 'The White Tiger', 'Fiction', 55.00, 'no', 'Aravind Adiga', 'HarperCollins India'),
('9780345803407', 'Life of Pi', 'Fiction', 50.00, 'yes', 'Yann Martel', 'Canongate Books'),
('9780670083879', 'The Inheritance of Loss', 'Fiction', 60.00, 'yes', 'Kiran Desai', 'Penguin Books'),
('9780140258793', 'Interpreter of Maladies', 'Short Stories', 45.00, 'no', 'Jhumpa Lahiri', 'Houghton Mifflin Harcourt'),
('9789382618443', 'Five Point Someone', 'Fiction', 30.00, 'yes', 'Chetan Bhagat', 'Rupa Publications'),
('9780143418768', 'The Namesake', 'Fiction', 50.00, 'yes', 'Jhumpa Lahiri', 'Houghton Mifflin Harcourt'),
('9780060597184', 'The Alchemist', 'Fiction', 40.00, 'yes', 'Paulo Coelho', 'HarperCollins'),
('9780670090778', 'Train to Pakistan', 'Fiction', 55.00, 'no', 'Khushwant Singh', 'Penguin Books'),
('9780670914912', 'The Kite Runner', 'Fiction', 50.00, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('9788129124913', 'The Immortals of Meluha', 'Mythology', 45.00, 'yes', 'Amish Tripathi', 'Westland Press'),
('9789385152180', 'Sita: Warrior of Mithila', 'Mythology', 55.00, 'yes', 'Amish Tripathi', 'Westland Press'),
('9780099428435', 'Harry Potter and the Philosopher\'s Stone', 'Fantasy', 60.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855652', 'Harry Potter and the Chamber of Secrets', 'Fantasy', 60.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855669', 'Harry Potter and the Prisoner of Azkaban', 'Fantasy', 60.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855676', 'Harry Potter and the Goblet of Fire', 'Fantasy', 65.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855683', 'Harry Potter and the Order of the Phoenix', 'Fantasy', 65.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855690', 'Harry Potter and the Half-Blood Prince', 'Fantasy', 65.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9781408855706', 'Harry Potter and the Deathly Hallows', 'Fantasy', 70.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9780143418973', 'The Great Indian Novel', 'Satire', 50.00, 'yes', 'Shashi Tharoor', 'Penguin Books'),
('9780143032400', 'In Custody', 'Fiction', 45.00, 'no', 'Anita Desai', 'Penguin Books'),
('9780143424761', 'The Suitable Boy', 'Fiction', 75.00, 'yes', 'Vikram Seth', 'Penguin Books'),
('9788184001653', 'Shiva Trilogy: Box Set', 'Mythology', 120.00, 'yes', 'Amish Tripathi', 'Westland'),
('9780143064426', 'Swami and Friends', 'Fiction', 35.00, 'yes', 'R.K. Narayan', 'Indian Thought Publications'),
('9780195649872', 'Malgudi Days', 'Short Stories', 40.00, 'yes', 'R.K. Narayan', 'Indian Thought Publications'),
('9780143421036', 'The Lowland', 'Fiction', 50.00, 'yes', 'Jhumpa Lahiri', 'Knopf'),
('9780143333644', 'The Blue Umbrella', 'Children', 25.00, 'yes', 'Ruskin Bond', 'Penguin Books'),
('9789385724837', 'I Too Had a Love Story', 'Romance', 35.00, 'no', 'Ravinder Singh', 'Srishti Publishers'),
('9789385152142', 'Half Girlfriend', 'Romance', 40.00, 'yes', 'Chetan Bhagat', 'Rupa Publications'),
('9781408855967', 'The Fault in Our Stars', 'Romance', 45.00, 'yes', 'John Green', 'Penguin Books'),
('9780671027360', 'Angels & Demons', 'Thriller', 55.00, 'yes', 'Dan Brown', 'Pocket Books'),
('9780552161237', 'The Da Vinci Code', 'Thriller', 60.00, 'yes', 'Dan Brown', 'Bantam Press'),
('9780140278760', '1984', 'Dystopian', 50.00, 'yes', 'George Orwell', 'Secker & Warburg'),
('9788172234980', 'India After Gandhi', 'Non-Fiction', 70.00, 'yes', 'Ramachandra Guha', 'HarperCollins'),
('9789351361985', 'The Accidental Prime Minister', 'Non-Fiction', 60.00, 'yes', 'Sanjaya Baru', 'Penguin Books');

SELECT* FROM books;

-- Inserting data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Amit Kumar', 'MG Road, Bengaluru, Karnataka', '2023-01-15'),
(2, 'Priya Reddy', 'Indiranagar, Bengaluru, Karnataka', '2023-02-20'),
(3, 'Rajesh Singh', 'Koramangala, Bengaluru, Karnataka', '2023-03-05'),
(4, 'Sneha Verma', 'Connaught Place, New Delhi, Delhi', '2023-04-12'),
(5, 'Vikram Mehta', 'Karol Bagh, New Delhi, Delhi', '2023-05-18'),
(6, 'Ritu Sharma', 'Dwarka, New Delhi, Delhi', '2023-06-25'),
(7, 'Sunil Das', 'Park Street, Kolkata, West Bengal', '2023-07-14'),
(8, 'Anjali Nair', 'Salt Lake, Kolkata, West Bengal', '2023-08-03'),
(9, 'Kiran Patil', 'Gariahat, Kolkata, West Bengal', '2023-09-09'),
(10, 'Manoj Bhatt', 'Marine Drive, Mumbai, Maharashtra', '2023-10-11'),
(11, 'Swati Joshi', 'Andheri, Mumbai, Maharashtra', '2023-11-19'),
(12, 'Rohit Sharma', 'Bandra, Mumbai, Maharashtra', '2023-12-22'),
(13, 'Nisha Gupta', 'Powai, Mumbai, Maharashtra', '2024-01-06'),
(14, 'Ajay Rao', 'Jayanagar, Bengaluru, Karnataka', '2024-01-15'),
(15, 'Madhuri Rao', 'Vasant Vihar, New Delhi, Delhi', '2024-02-20'),
(16, 'Naveen Ghosh', 'Ballygunge, Kolkata, West Bengal', '2024-03-18'),
(17, 'Megha Kapoor', 'Colaba, Mumbai, Maharashtra', '2024-04-25'),
(18, 'Ramesh Iyer', 'Thane, Mumbai, Maharashtra', '2024-05-30'),
(19, 'Shalini Desai', 'Hinjewadi, Pune, Maharashtra', '2024-06-18'),
(20, 'Pooja Bansal', 'Viman Nagar, Pune, Maharashtra', '2024-07-22');

SELECT* FROM CUSTOMER;

-- Inserting data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The God of Small Things', '2024-01-10', '9780143442295'),
(2, 2, 'The Alchemist', '2024-02-05', '9780060597184'),
(3, 3, 'The White Tiger', '2024-02-20', '9789350293478'),
(4, 4, 'Harry Potter and the Philosopher\'s Stone', '2024-03-15', '9780099428435'),
(5, 5, 'Train to Pakistan', '2024-04-02', '9780670090778'),
(6, 6, 'The Immortals of Meluha', '2024-04-22', '9788129124913'),
(7, 7, 'Five Point Someone', '2024-05-05', '9789382618443'),
(8, 8, 'Life of Pi', '2024-05-19', '9780345803407'),
(9, 9, 'Midnight\'s Children', '2024-06-10', '9780679405379'),
(10, 10, 'The Great Indian Novel', '2024-06-25', '9780143418973');

SELECT * FROM IssueStatus;

-- inserting data in to ReturnStatus table

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES
(1, 1, 'The God of Small Things', '2023-10-15', '9780143442295'),
(2, 2, 'The Alchemist', '2023-10-18', '9780060597184'),
(3, 3, 'The White Tiger', '2023-10-20', '9789350293478'),
(4, 4, 'Harry Potter and the Philosopher''s Stone', '2023-10-22', '9780099428435'),
(5, 5, 'Train to Pakistan', '2023-10-25', '9780670090778');

 select* from ReturnStatus;
 
 -- 1. Retrieve the book title, category, and rental price of all available books. 
 SELECT Book_title, Category, Rental_Price FROM books;
 
-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM employee ORDER BY Salary ASC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT books.Book_title, issuestatus.Issued_cust, customer.Customer_name
FROM issuestatus
INNER JOIN books ON issuestatus.Isbn_book = books.ISBN
INNER JOIN customer ON issuestatus.Issued_cust = customer.Customer_Id;  -- Assuming Issued_cust matches Customer_Id

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position,Salary FROM employee WHERE Salary>50000;

 -- 6. List the customer names who registered before 2023-07-01 and have not issued any books yet
SELECT customer.Customer_name,customer.Reg_date
FROM customer
LEFT JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
WHERE customer.Reg_date < '2023-07-01'
AND issuestatus.issue_id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
--  here Customer_id = Issued_cust
SELECT DISTINCT customer.Customer_name,issuestatus.Issue_date
FROM customer
INNER JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
WHERE YEAR(issuestatus.Issue_date) = 2024
AND MONTH(issuestatus.Issue_date) = 6;

-- 9. Retrieve book_title from book table containing history.
-- Note here there is not books in the catergory History  , hence Ficton has been considered here

SELECT*FROM books;
SELECT Book_title,Category FROM books WHERE Category= 'Fiction';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT*FROM employee;
-- note here 5 employee are there in all 4 batches so the result would be null
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM employee
GROUP BY Branch_no
HAVING COUNT(*) > 4;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses
SELECT*FROM branch;
SELECT*FROM employee;
-- Here Manager_Id= Emp_Id
SELECT employee.Emp_name AS Manager_Name, branch.Branch_Address
FROM employee
INNER JOIN branch ON employee.Emp_Id = branch.Manager_Id;

-- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25
-- issuestatus.Issued_cust=customer.Customer_Id
-- issuestatus.Isbn_book=books.ISBN
SELECT*FROM issuestatus; 
SELECT*FROM customer;
SELECT*FROM books;
SELECT DISTINCT customer.Customer_name,issuestatus.Issued_book_name,books.Rental_Price
FROM customer
INNER JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
INNER JOIN books ON issuestatus.Isbn_book = books.ISBN
WHERE books.Rental_Price > 25;







