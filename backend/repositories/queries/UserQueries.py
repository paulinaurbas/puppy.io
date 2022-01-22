#SELECT

SELECT_USER_LOGIN_DATA_BY_USERNAME_AND_PASS = """
SELECT Username, Email
FROM Users
WHERE Username = @Username
AND Pass = @Pass
"""

SELECT_USER_ID_BY_USERNAME = """
SELECT ID
FROM Users
WHERE Username = @Username
"""

#INSERT

INSERT_NEW_USER = """
INSERT INTO Users (
    Username, 
    Pass, 
    Email
)
VALUES (
    @Username,
    @Pass,
    @Email
)
"""