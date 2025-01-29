-- DB作成
DROP DATABASE IF EXISTS mydatabase;
CREATE DATABASE mydatabase CHARACTER SET utf8 COLLATE utf8_general_ci;

-- ユーザを作成
DROP USER IF EXISTS 'root'@'localhost';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';

-- 権限付与
GRANT ALL PRIVILEGES ON mydatabase.* TO 'root'@'localhost';

USE mydatabase;

-- テーブル作成
CREATE TABLE IF NOT EXISTS FortuneResults (
                                              id INT AUTO_INCREMENT PRIMARY KEY,
                                              result VARCHAR(255) NOT NULL
    );

-- 模擬データの挿入
INSERT INTO FortuneResults (result) VALUES ('今日は素晴らしい日です。');
INSERT INTO FortuneResults (result) VALUES ('新しい挑戦に最適な日です。');
INSERT INTO FortuneResults (result) VALUES ('友人との時間を大切にしましょう。');
INSERT INTO FortuneResults (result) VALUES ('健康に気をつけてください。');
INSERT INTO FortuneResults (result) VALUES ('仕事で成功する日です。');