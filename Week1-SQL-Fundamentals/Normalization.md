# Database Normalization  
Normalization helps reduce redundancy and improve data integrity.

## 1st Normal Form (1NF)
- Ensure each column contains atomic values.
e.g Split multiple values into separate rows.

## 2nd Normal Form (2NF)
- Remove partial dependencies.
e.g Move repeated data to another table.

## 3rd Normal Form (3NF)
- Remove transitive dependencies.
e.g Ensure all non-key columns relate only to the primary key.

#Indexing

An index is like a table of contents in a book. Instead of scanning every row, the database quickly finds the relevant data.

🔹 Without an Index: Searching for a value means scanning the entire table (full table scan).
🔹 With an Index: The database quickly locates the data, making queries much faster.

🔹 Step 2: Types of Indexes
#Clustered Index - Sorts and stores rows physically in the table.	
e.g One per table (usually on the Primary Key).

#Non-Clustered Index - Stores pointers to the actual data.	
e.g Used for faster searching on frequently queried columns.

#Unique Index - Ensures no duplicate values.	
e.g Used for email, usernames, IDs, etc.

🔹 Step 3: Creating an Index
Let’s create some indexes on our normalized database.

1️. Clustered Index (Default on Primary Key)

CREATE CLUSTERED INDEX idx_Customers_ID 
ON Customers(CustomerID);

✅ This makes CustomerID the main way SQL organizes the table.

2️. Non-Clustered Index (For Faster Searches)

CREATE NONCLUSTERED INDEX idx_CustomerEmail 
ON Customers(CustomerEmail);

✅ Now, queries filtering by email will be much faster.

Example Query Using the Index:

SELECT * FROM Customers WHERE CustomerEmail = 'alice@email.com';
🔹 Without an index: Full table scan (slow).
🔹 With an index: SQL quickly finds the email.

3️. Unique Index (Prevent Duplicates)

CREATE UNIQUE INDEX idx_Unique_CustomerEmail 
ON Customers(CustomerEmail);

✅ Prevents duplicate emails from being inserted.






