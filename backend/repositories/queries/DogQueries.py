#SELECT

SELECT_ALL_DOGS = """
SELECT D.ID
     , D.Name
	 , B.Name AS Breed
	 , D.Age
	 , CASE WHEN D.Sex = 0 
	 	THEN 'Male' 
	 	ELSE 'Female' 
	   END AS Sex
	 , D.Description
	 , U.Email AS OwnerEmail
	 , L.Latitude
	 , L.Longitude
FROM Dogs D
	LEFT JOIN Breeds B ON B.ID = D.BreedID
	LEFT JOIN Users U ON U.ID = D.OwnerID
	LEFT JOIN Locations L ON L.DogID = D.ID
"""

SELECT_DOG_BY_ID = """
SELECT D.ID
     , D.Name
	 , B.Name AS Breed
	 , D.Age
	 , CASE WHEN D.Sex = 0 
	 	THEN 'Male' 
	 	ELSE 'Female' 
	   END AS Sex
	 , D.Description
	 , U.Email AS OwnerEmail
	 , L.Latitude
	 , L.Longitude
FROM Dogs D
	LEFT JOIN Breeds B ON B.ID = D.BreedID
	LEFT JOIN Users U ON U.ID = D.OwnerID
	LEFT JOIN Locations L ON L.DogID = D.ID
WHERE D.ID = @ID
"""

SELECT_ALL_DOGS_PICTURES = """
SELECT P.Url, P.DogID
FROM Pictures P
"""

SELECT_DOG_PICTURES_BY_ID = """
SELECT P.Url, P.DogID
FROM Pictures P
WHERE P.DogID = @ID
"""

SELECT_DOGS_BY_OWNER_ID = """
SELECT D.ID
     , D.Name
	 , B.Name AS Breed
	 , D.Age
	 , CASE WHEN D.Sex = 0 
	 	THEN 'Male' 
	 	ELSE 'Female' 
	   END AS Sex
	 , D.Description
	 , U.Email AS OwnerEmail
	 , L.Latitude
	 , L.Longitude
FROM Dogs D
	LEFT JOIN Breeds B ON B.ID = D.BreedID
	LEFT JOIN Users U ON U.ID = D.OwnerID
	LEFT JOIN Locations L ON L.DogID = D.ID
WHERE D.OwnerID = @OwnerID
"""

SELECT_DOG_PICTURES_BY_OWNER_ID = """
SELECT P.Url, P.DogID
FROM Pictures P
    LEFT JOIN Dogs D ON D.ID = P.DogID
WHERE D.OwnerID = @OwnerID
"""

#INSERT

INSERT_NEW_DOG = """
WITH breed_id AS (SELECT B.ID
	FROM Breeds B
	WHERE Name = @Breed
)
INSERT INTO Dogs (
	Name,
	BreedID,
	Age,
	Sex,
	Description,
	OwnerID
)
VALUES(
	@Name,
	(SELECT * FROM breed_id),
	@Age,
	(CASE WHEN @Sex = 'Male' THEN 0 ELSE 1 END),
	@Description,
	@OwnerID
);

WITH scope_identifier AS (SELECT currval(pg_get_serial_sequence('Dogs','id')))
INSERT INTO Locations (
    Latitude,
    Longitude,
    UserID,
    DogID
)
VALUES (
    @Latitude,
    @Longitude,
    @OwnerID,
    (SELECT * FROM scope_identifier)
);

WITH scope_identifier AS (SELECT currval(pg_get_serial_sequence('Dogs','id')))
INSERT INTO Pictures (
	Url,
	DogID
)
SELECT Url, (SELECT * FROM scope_identifier) 
FROM @Pictures AS t(Url)
"""

#UPDATE
UPDATE_DOG = """
UPDATE Dogs
SET 
    Name = @Name,
    BreedID = (SELECT B.ID FROM Breeds B WHERE Name = @Breed),
    Age = @Age,
    Sex = (CASE WHEN @Sex = 'Male' THEN 0 ELSE 1 END),
    Description = @Description
WHERE ID = @ID;

UPDATE Locations
SET
    Latitude = @Latitude,
    Longitude = @Longitude
WHERE DogID = @ID;

DELETE FROM Pictures
WHERE DogID = @ID;

INSERT INTO Pictures (
	Url,
	DogID
)
SELECT Url, @ID 
FROM @Pictures AS t(Url)
"""

#DELETE

DELETE_DOG = """
DELETE FROM Dogs
WHERE ID = @ID
"""