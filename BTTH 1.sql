USE bookworm;

DROP TABLE books;
DROP TABLE authors;
DROP TABLE customers;

CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
	birth_year DATE ,
    nationality VARCHAR(25) NOT NULL
);

CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(50) NOT NULL,
	category VARCHAR(50),
    author_id INT,
    FOREIGN KEY(author_id) REFERENCES authors(id),
    price INT NOT NULL DEFAULT 0 CHECK(price > 0),
    publish_year INT
);

CREATE TABLE customers(
	 id INT PRIMARY KEY AUTO_INCREMENT,
     full_name VARCHAR(50),
     email VARCHAR(50) UNIQUE NOT NULL,
     phone VARCHAR(15) UNIQUE,
     registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
)