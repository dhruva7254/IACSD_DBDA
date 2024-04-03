car
CREATE TABLE Boxoffice (
    Movie_id INT,
    Rating DECIMAL(3, 1),
    Domestic_sales BIGINT,
    International_sales BIGINT,
	CONSTRAINT fk_m FOREIGN KEY (Movie_id) REFERENCES Movies(Id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO Boxoffice (Movie_id, Rating, Domestic_sales, International_sales)
VALUES
    (5, 8.2, 380843261, 555900000),
    (14, 7.4, 268492764, 475066843),
    (8, 8.0, 206445654, 417277164),
    (12, 6.4, 191452396, 368400000),
    (3, 7.9, 245852179, 239163000),
    (6, 8.0, 261441092, 370001000);
	
CREATE TABLE Movies (
    Id INT PRIMARY KEY,
    Title VARCHAR(255),
    Director VARCHAR(255),
    Year INT,
    Length_minutes INT,
    Release_date DATE
);

INSERT INTO Movies (Id, Title, Director, Year, Length_minutes, Release_date)
VALUES
    (1, 'Toy Story', 'John Lasseter', 1995, 81, '1995-11-22'),
    (2, 'A Bug''s Life', 'John Lasseter', 1998, 95, '1998-11-20'),
    (3, 'Toy Story 2', 'John Lasseter', 1999, 93, '1999-11-24'),
    (4, 'Monsters, Inc.', 'Pete Docter', 2001, 92, '2001-11-2'),
    (5, 'Finding Nemo', 'Andrew Stanton', 2003, 107, '2003-05-30'),
    (6, 'The Incredibles', 'Brad Bird', 2004, 116, '2004-10-27');

