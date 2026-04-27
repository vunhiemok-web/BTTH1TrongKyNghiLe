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
);

INSERT INTO authors (full_name, birth_year, nationality) VALUES
('Nguyen Nhat Anh', '1955-05-07', 'Vietnam'),
('Agatha Christie', '1890-09-15', 'UK'),
('Dale Carnegie', '1888-11-24', 'USA');

INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES
('Mat Biec', 'Van hoc', 1, 50000, 1990),
('Toi thay hoa vang tren co xanh', 'Van hoc', 1, 60000, 2010),
('Sherlock Holmes', 'Trinh tham', 2, 80000, 1920),
('Murder on the Orient Express', 'Trinh tham', 2, 90000, 1934),
('Dac nhan tam', 'Ky nang', 3, 75000, 1936),
('How to Win Friends', 'Ky nang', 3, 70000, 1936),
('The ABC Murders', 'Trinh tham', 2, 85000, 1936),
('Cho toi xin mot ve di tuoi tho', 'Van hoc', 1, 65000, 2008);

INSERT INTO customers (full_name, email, phone) VALUES
('Vu Hoang Nhiem', 'nhiem@gmail.com', '09876543211'),
('Le Quang Phuc', 'phuc@gmail.com', '09876543212'),
('Le Phuoc Loc', 'loc@gmail.com', '09876543213'),
('Nguyen Duc Huy', 'huy@gmail.com', '09876543214'),
('Hoang Duong Nam', 'nam@gmail.com', '09876543215');

INSERT INTO customers (full_name, email, phone) VALUE
('Nguyen Phuong Vy', 'nhiem@gmail.com', '09876543216');

-- Kết quả: Lệnh INSERT sẽ bị lỗi: Duplicate entry "nhiem@gmail.com"for key 'customer.email'
-- Vì cột email trong bảng customers được khai báo ràng buộc UNIQUE(Không trùng) nên không cho phép tồn tại 2 bản ghi có cùng email.

-- Điều này chứng minh rằng ràng buộc UNIQUE hoạt động đúng,
-- -> Giúp đảm bảo tính toàn vẹn dữ liệu (data integrity).

SELECT * FROM books
WHERE category = 'Trinh tham'
AND price < 100000;

SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

SELECT * FROM books
ORDER BY price DESC
LIMIT 3;