#CREATION QUERIES

CREATE_DOGS_TABLE = """
CREATE TABLE Dogs (
    ID BIGSERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    BreedID BIGSERIAL NOT NULL,
    Age INTEGER NOT NULL,
    Sex INTEGER NOT NULL,
    Description VARCHAR NULL,
    OwnerID BIGSERIAL NOT NULL,
    CONSTRAINT fk_DogsBreedID
        FOREIGN KEY(BreedID) 
        	REFERENCES Breeds(ID) 
        	ON DELETE CASCADE,
    CONSTRAINT fk_DogsUserID
        FOREIGN KEY(OwnerID)    
        	REFERENCES Users(ID) 
        	ON DELETE CASCADE
);
"""

CREATE_BREEDS_TABLE = """
CREATE TABLE Breeds (
    ID BIGSERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);
"""

CREATE_USERS_TABLE = """
CREATE TABLE Users (
    ID BIGSERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Pass VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NULL,
    Surname VARCHAR(255) NULL,
    Email VARCHAR(255) NOT NULL
);
"""

CREATE_LOCATIONS_TABLE = """
CREATE TABLE Locations (
    ID BIGSERIAL PRIMARY KEY,
    Latitude NUMERIC(13,10) NOT NULL,
    Longitude NUMERIC(13,10) NOT NULL,
    UserID BIGSERIAL NOT NULL,
    DogID BIGSERIAL NOT NULL,
    CONSTRAINT fk_LocationsUserID
        FOREIGN KEY(UserID)
        	REFERENCES Users(ID)
        	ON DELETE CASCADE,
    CONSTRAINT fk_LocationsDogID
        FOREIGN KEY(DogID)
        	REFERENCES Dogs(ID)
);
"""

CREATE_PICTURES_TABLE = """
CREATE TABLE Pictures (
    ID BIGSERIAL PRIMARY KEY,
    Url VARCHAR NOT NULL,
    DogID BIGSERIAL NOT NULL,
    CONSTRAINT fk_PicturesDogID
        FOREIGN KEY(DogID)
        	REFERENCES Dogs(ID)
        	ON DELETE CASCADE
);
"""

#SELECT QUERIES
SELECT_ALL_DOGS = """
SELECT D.Name
	 , B.Name AS Breed
	 , D.Age
	 , CASE WHEN D.Sex = 0 
	 	THEN 'Male' 
	 	ELSE 'Female' 
	   END AS Sex
	 , D.Description
	 , D.OwnerID
FROM Dogs D
	LEFT JOIN Breeds B ON B.ID = D.BreedID 
"""

SELECT_ALL_BREEDS = """
SELECT Name from Breeds
"""

SELECT_DOG_BY_ID = SELECT_ALL_DOGS + """
WHERE D.ID = @ID
"""

SELECT_DOGS_BY_USER_ID = SELECT_ALL_DOGS + """
WHERE D.OwnerID = @ID
"""

SELECT_DOGS_BY_IDS = SELECT_ALL_DOGS + """
WHERE D.ID IN @IDs
"""

#INSERT QUERIES
INSERT_NEW_DOG = """
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
    @BreedID,
    @Age,
    @Sex,
    @Description,
    @OwnerID
)
"""