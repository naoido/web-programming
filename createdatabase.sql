CREATE DATABASE IF NOT EXISTS tarot_db;

USE tarot_db;

CREATE TABLE IF NOT EXISTS TarotResults (
                                            id INT AUTO_INCREMENT PRIMARY KEY,
                                            card_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );