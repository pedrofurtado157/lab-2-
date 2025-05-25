CREATE DATABASE streaming;
use streaming;

CREATE TABLE movies (
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_title VARCHAR(100),
    genre VARCHAR(50)
);

CREATE TABLE clients (
	client_id INT PRIMARY KEY AUTO_INCREMENT,
	client_name VARCHAR(100),
    email VARCHAR(50)
);

CREATE TABLE subscriptions (
	subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    movie_id INT,
    subscription_date DATE, 
    
    FOREIGN KEY(client_id) REFERENCES clients(client_id),
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

INSERT INTO movies (movie_title, genre)
VALUES
('spider man', 'action'),
('john wick', 'Action'),
('matrix', 'Sci-Fi'),
('friday 13', 'horror');

INSERT INTO clients (client_name, email)
VALUES
('Andre Silva', 'Andre.silva@example.com'),
('Maria Clara', 'maria.clara@example.com'),
('Carlos Brito', 'carlos.brito@example.com'),
('Heitor Costa', 'Heitor.costa@example.com');

INSERT INTO subscriptions (client_id, movie_id, subscription_date)
VALUES
(1, 6, '2025-05-15'),
(2, 3, '2025-05-16'),
(5, 6, '2025-05-17'),
(3, 1, '2025-05-18');

SELECT s.subscription_id, c.client_name, m.movie_title, s.subscription_id
FROM subscriptions s
INNER JOIN clients c ON c.client_id = s.client_id 
INNER JOIN movies m ON m.movie_id  = s.movie_id;

SELECT c.client_name, s.subscription_id, m.movie_title, s.subscription_date
FROM clients c
LEFT JOIN subscriptions s ON c.client_id = s.client_id
LEFT JOIN movies m ON s.movie_id = m.movie_id;

SELECT m.movie_title, s.subscription_id, c.client_name, s.subscription_date
FROM movies m
RIGHT JOIN subscription s ON m.movie_id = s.movie_id
RIGHT JOIN clients c ON c.client_id =s.client_id