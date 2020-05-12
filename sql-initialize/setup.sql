CREATE DATABASE blockbuster;

USE blockbuster;

CREATE TABLE buster (
busterID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
memberLevel VARCHAR(255) NOT NULL,
bName VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL);

CREATE TABLE genre (
genreID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
category VARCHAR(255) NOT NULL);

CREATE TABLE movie (
movieID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
mpaa VARCHAR(5) NOT NULL,
runtime TIME NOT NULL,
starValue DECIMAL(10,2) NOT NULL,
releaseDate DATE NOT NULL,
genreID INT NOT NULL,
CONSTRAINT FK_genreID1 FOREIGN KEY (genreID) REFERENCES genre(genreID));

CREATE TABLE game (
gameID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
gameTitle VARCHAR(255) NOT NULL,
esrb VARCHAR(5) NOT NULL,
starValue DECIMAL(10,2) NOT NULL,
releaseDate DATE NOT NULL,
genreID INT NOT NULL,
CONSTRAINT FK_genreID5 FOREIGN KEY (genreID) REFERENCES genre(genreID));

CREATE TABLE store (
storeID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
storeName VARCHAR(255) NOT NULL,
storeAddress VARCHAR(255) NOT NULL);

CREATE TABLE copy (
movieID INT NOT NULL,
copyID VARCHAR(6) NOT NULL PRIMARY KEY,
storeID INT NOT NULL,
position VARCHAR(255) NOT NULL,
CONSTRAINT FK_movieID1 FOREIGN KEY (movieID) REFERENCES movie(movieID),
CONSTRAINT FK_storeID1 FOREIGN KEY (storeID) REFERENCES store(storeID));

CREATE TABLE gameCopy (
gameID INT NOT NULL,
gcID VARCHAR(6) NOT NULL PRIMARY KEY,
storeID INT NOT NULL,
position VARCHAR(255) NOT NULL,
CONSTRAINT FK_gameID1 FOREIGN KEY (gameID) REFERENCES game(gameID),
CONSTRAINT FK_storeID2 FOREIGN KEY (storeID) REFERENCES store(storeID));

CREATE TABLE reserves (
resID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
busterID INT NOT NULL,
movieID INT NOT NULL,
copyID VARCHAR(6) NOT NULL,
storeID INT NOT NULL,
daTime DATE NOT NULL,
CONSTRAINT FK_busterID1 FOREIGN KEY (busterID) REFERENCES buster(busterID),
CONSTRAINT FK_movieID2 FOREIGN KEY (movieID) REFERENCES movie(movieID),
CONSTRAINT FK_copyID2 FOREIGN KEY (copyID) REFERENCES copy(copyID),
CONSTRAINT FK_storeID3 FOREIGN KEY (storeID) REFERENCES store(storeID));

CREATE TABLE gameReserves (
grID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
busterID INT NOT NULL,
gameID INT NOT NULL,
gcID VARCHAR(6) NOT NULL,
storeID INT NOT NULL,
daTime DATE NOT NULL,
CONSTRAINT FK_busterID2 FOREIGN KEY (busterID) REFERENCES buster(busterID),
CONSTRAINT FK_gameID2 FOREIGN KEY (gameID) REFERENCES game(gameID),
CONSTRAINT FK_gcID2 FOREIGN KEY (gcID) REFERENCES gameCopy(gcID),
CONSTRAINT FK_storeID4 FOREIGN KEY (storeID) REFERENCES store(storeID));

CREATE TABLE borrows (
boID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
busterID INT NOT NULL,
movieID INT NOT NULL,
copyID VARCHAR(6) NOT NULL,
storeID INT NOT NULL,
boTime DATE NOT NULL,
reTime DATE NULL,
fees FLOAT(5,2) NOT NULL,
CONSTRAINT FK_busterID3 FOREIGN KEY (busterID) REFERENCES buster(busterID),
CONSTRAINT FK_movieID3 FOREIGN KEY (movieID) REFERENCES movie(movieID),
CONSTRAINT FK_copyID3 FOREIGN KEY (copyID) REFERENCES copy(copyID),
CONSTRAINT FK_storeID5 FOREIGN KEY (storeID) REFERENCES store(storeID));

CREATE TABLE gameBorrows (
boID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
busterID INT NOT NULL,
gameID INT NOT NULL,
gcID VARCHAR(6) NOT NULL,
storeID INT NOT NULL,
boTime DATE NOT NULL,
reTime DATE NULL,
fees FLOAT(5,2) NOT NULL,
CONSTRAINT FK_busterID4 FOREIGN KEY (busterID) REFERENCES buster(busterID),
CONSTRAINT FK_gameID3 FOREIGN KEY (gameID) REFERENCES game(gameID),
CONSTRAINT FK_gcID3 FOREIGN KEY (gcID) REFERENCES gameCopy(gcID),
CONSTRAINT FK_storeID6 FOREIGN KEY (storeID) REFERENCES store(storeID));

INSERT INTO buster(memberLevel, bName, address)
VALUES
	('Pro', 'Gary Trass', '123 Main St., Somewhere, SS'),
	('Pro', 'Winona Herassinie', '321 Main Ave., Somewhere, SS'),
	('Veteran', 'Jessica Lutheria', '612 Park Ave., Going, NO'),
	('Pro', 'Timothy Harbor', '51 St. Chris Blvd., St. Chris, AA'),
	('Standard', 'Maria Guernica', '36 Hollister Blvd., Capital City, SS');

INSERT INTO genre(category)
VALUES
	('Action'),
	('Adventure'),
	('Romance'),
	('Drama'),
	('Thriller'),
	('Horror'),
	('Comedy'),
	('Crime'),
	('Fantasy'),
	('Sci-Fi'),
	('Historical'),
	('Historical Fiction'),
	('Mystery'),
	('Western'),
	('Absurd'),
	('Unknown');

INSERT INTO movie(title, mpaa, runtime, starValue, releaseDate, genreID)
VALUES
	('My First Movie', 'G', 013000, 10.0, '2019-02-01', 1),
	('My First Movie', 'R', 013000, 10.0, '2019-02-01', 2),
	('My First Movie', 'NC-17', 013000, 10.0, '2019-02-01', 3),
	('My First Movie', 'R', 013000, 10.0, '2019-02-01', 4),
	('My First Movie', 'R', 013000, 10.0, '2019-02-01', 5),
	('My First Movie', 'G', 013000, 10.0, '2019-02-01', 6),
	('My First Movie', 'PG', 013000, 10.0, '2019-02-01', 7),
	('My First Movie', 'PG', 013000, 10.0, '2019-02-01', 8),
	('My First Movie', 'G', 013000, 10.0, '2019-02-01', 8),
	('My First Movie', 'PG', 013000, 10.0, '2019-02-01', 7),
	('My First Movie', 'G', 013000, 10.0, '2019-02-01', 5),
	('My First Movie', 'PG-13', 013000, 10.0, '2019-02-01', 2),
	('My First Movie', 'G', 013000, 10.0, '2019-02-01', 1);
	
INSERT INTO game(gameTitle, esrb, starValue, releaseDate, genreID)
VALUES
	('My First Game', 'T', 10.0, '2019-02-01', 2),
	('My First Game', 'E10+', 10.0, '2019-02-01', 2),
	('My First Game', 'T', 10.0, '2019-02-01', 2),
	('My First Game', 'M', 10.0, '2019-02-01', 2),
	('My First Game', 'E', 10.0, '2019-02-01', 2),
	('My First Game', 'M', 10.0, '2019-02-01', 2),
	('My First Game', 'M', 10.0, '2019-02-01', 2),
	('My First Game', 'M', 10.0, '2019-02-01', 2),
	('My First Game', 'T', 10.0, '2019-02-01', 2),
	('My First Game', 'T', 10.0, '2019-02-01', 2),
	('My First Game', 'T', 10.0, '2019-02-01', 2),
	('My First Game', 'E', 10.0, '2019-02-01', 2),
	('My First Game', 'M', 10.0, '2019-02-01', 2);

INSERT INTO store(storeName, storeAddress)
VALUES
	('Van Houston', '67 Jerry St., Somewhere, SS'),
	('De la Rosa','353 Main Ave., Somewhere, SS'),
	('Dey Wuf', '103 Grand Central St., Anything, SE');

INSERT INTO copy(movieID, copyID, storeID, position)
VALUES
	(1, '000A01', 1, 'Shelved'),
	(1, '000A02', 1, 'Shelved'),
	(1, '301F25', 2, 'Borrowed'),
	(2, '146C19', 2, 'Borrowed'),
	(2, '402G31', 3, 'Shelved'),
	(3, '091G61', 1, 'Borrowed'),
	(3, '091G62', 1, 'Borrowed'),
	(3, '912R14', 2, 'Shelved'),
	(3, '912R15', 2, 'Reserved'),
	(3, '629D19', 3, 'Shelved'),
	(4, '619E14', 3, 'Borrowed'),
	(4, '501X16', 2, 'Reserved'),
	(4, '165F51', 1, 'Shelved'),
	(5, '666D13', 3, 'Borrowed'),
	(6, '101A01', 2, 'Shelved'),
	(7, '642H82', 3, 'Borrowed'),
	(7, '051C25', 1, 'Shelved'),
	(8, '090N12', 2, 'Reserved'),
	(8, '042A15', 1, 'Shelved'),
	(9, '639J14', 3, 'Shelved');
	
INSERT INTO gameCopy(gameID, gcID, storeID, position)
VALUES
	(1, '000A01', 1, 'Shelved'),
	(1, '000A02', 1, 'Shelved'),
	(1, '301F25', 2, 'Borrowed'),
	(2, '146C19', 2, 'Borrowed'),
	(2, '402G31', 3, 'Shelved'),
	(3, '091G61', 1, 'Borrowed'),
	(3, '091G62', 1, 'Borrowed'),
	(3, '912R14', 2, 'Shelved'),
	(3, '912R15', 2, 'Reserved'),
	(3, '629D19', 3, 'Shelved'),
	(4, '619E14', 3, 'Borrowed'),
	(4, '501X16', 2, 'Reserved'),
	(4, '165F51', 1, 'Shelved'),
	(5, '666D13', 3, 'Borrowed'),
	(6, '101A01', 2, 'Shelved'),
	(7, '642H82', 3, 'Borrowed'),
	(7, '051C25', 1, 'Shelved'),
	(8, '090N12', 2, 'Reserved'),
	(8, '042A15', 1, 'Shelved'),
	(9, '639J14', 3, 'Shelved');

INSERT INTO reserves(busterID, movieID, copyID, storeID, daTime)
VALUES
	(1, 3, '912R15', 2, '2019-06-25'),
	(1, 4, '501X16', 2, '2019-06-25'),
	(1, 8, '090N12', 2, '2019-06-25');
	
INSERT INTO gameReserves(busterID, gameID, gcID, storeID, daTime)
VALUES
	(1, 3, '912R15', 2, '2019-06-25'),
	(1, 4, '501X16', 2, '2019-06-25'),
	(1, 8, '090N12', 2, '2019-06-25');

INSERT INTO borrows(busterID, movieID, copyID, storeID, boTime, reTime, fees)
VALUES
	(4, 5, '666D13', 3, '2019-03-15', NULL, 6.66),
	(3, 1, '301F25', 2, '2019-04-12', '2019-02-26', 0.00),
	(2, 2, '146C19', 2, '2019-01-13', NULL, 20.00),
	(4, 3, '091G61', 1, '2019-02-12', '2019-03-01', 0.00),
	(1, 3, '091G62', 1, '2019-05-01', NULL, 0.00),
	(3, 4, '619E14', 3, '2019-04-06', '2019-04-25', 0.00),
	(1, 7, '642H82', 3, '2019-04-22', '2019-04-29', 0.00);
	
INSERT INTO gameBorrows(busterID, gameID, gcID, storeID, boTime, reTime, fees)
VALUES
	(4, 5, '666D13', 3, '2019-03-15', NULL, 6.66),
	(3, 1, '301F25', 2, '2019-04-12', '2019-02-26', 0.00),
	(2, 2, '146C19', 2, '2019-01-13', NULL, 20.00),
	(4, 3, '091G61', 1, '2019-02-12', '2019-03-01', 0.00),
	(1, 3, '091G62', 1, '2019-05-01', NULL, 0.00),
	(3, 4, '619E14', 3, '2019-04-06', '2019-04-25', 0.00),
	(1, 7, '642H82', 3, '2019-04-22', '2019-04-29', 0.00);

CREATE USER 'admin'@'%' IDENTIFIED BY '22222';

GRANT SELECT, INSERT ON blockbuster.* TO 'admin'@'%';

FLUSH PRIVILEGES;