CREATE DATABASE lab14_normal WITH TEMPLATE lab14;
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- A table named authors created in the lab14_normal database.
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
-- A subquery to retrieve unique author values from the books table and insert each one into the authors table in the name column.
ALTER TABLE books ADD COLUMN author_id INT;
-- Adding a column to the books table named author_id to connect each book to a specific author in the other table.
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
-- Preparing a connection between tables books and authors.
ALTER TABLE books DROP COLUMN author;
-- Modifying the books table by removing the column named author.
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
-- This query will modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table.
