CREATE DATABASE SpotifyDb
USE SPotifyDb
CREATE TABLE Artist 
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (100)
)
CREATE TABLE Albums
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (100),
CreatedDate DATETIME2,
ArtistId INT FOREIGN KEY (ArtistId) REFERENCES Artist (Id)
)

CREATE TABLE Musics
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (100),
TotalSecond INT,
ListenerCount INT,
AlbumsId INT FOREIGN KEY (AlbumsId) REFERENCES Albums (Id)
)

INSERT INTO Artist  
VALUES 
('The Beatles'),
('Queen'),
('Adele'),
('Eminem'),
('BTS'),
('Taylor Swift'),
('Ed Sheeran'),
('Shakira')


INSERT INTO Albums ([Name], CreatedDate, ArtistId) 
VALUES 
('Abbey Road', '1969-09-26',1),
('A Night at the Opera', '1975-11-21',1),
('25', '2015-11-20',2),
('The Eminem Show', '2002-05-26',2),
('Map of the Soul: 7', '2020-02-21',3),
('1989', '2014-10-27',7),
('Divide', '2017-03-03',4),
('Laundry Service', '2001-11-13',5)

INSERT INTO Musics ([Name], TotalSecond, ListenerCount,AlbumsId) 
VALUES 
('Come Together', 259, 1500000, 1),
('Bohemian Rhapsody', 354, 2000000, 1),
('Hello', 295, 1800000,2),
('Without Me', 290, 1700000,2),
('ON', 298, 1600000,3),
('Blank Space', 231, 1900000,3),
('Shape of You', 263, 2500000,4),
('Whenever Wherever', 223, 1400000,5)

--1
CREATE VIEW View_MusicDetails AS
SELECT m.[Name], TotalSecond,ar.[Name] AS ArtistName, 
a.[Name] AS AlbumsName FROM Musics m
JOIN Albums a 
ON a.Id = m.AlbumsId
JOIN Artist ar
ON ar.Id = a.ArtistId
SELECT * FROM View_MusicDetails

--2
CREATE VIEW View_AlbumsMusicCount AS
SELECT a.[Name], (SELECT COUNT (*) FROM Musics m 
WHERE m.AlbumsId = a.Id) AS MusicCount FROM Albums a

SELECT * FROM View_AlbumsMusicCount

--3
CREATE PROCEDURE GetMusicByAlbum 
@ListenerCount INT,
@Keyword NVARCHAR(20)
AS BEGIN
SELECT m.[Name] FROM Musics m 
JOIN Albums a
ON m.AlbumsId = a.Id
WHERE m.ListenerCount > 100 AND a.[Name] LIKE '%'+ @Keyword +'%'
END;

EXEC GetMusicByAlbum 1800000,'H'