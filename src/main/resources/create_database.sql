CREATE DATABASE IF NOT EXISTS mydatabase;

USE mydatabase;

CREATE TABLE IF NOT EXISTS FortuneResults (
                                              id INT AUTO_INCREMENT PRIMARY KEY,
                                              result VARCHAR(255) NOT NULL
    );