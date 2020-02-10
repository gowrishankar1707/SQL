using LibraryAutomationSystems
CREATE TABLE Library_Automation_System

(
Name varchar(15) NOT NULL,
UserID int identity(1,1) PRIMARY KEY,
UserName varchar(15) NOT NULL UNIQUE,
UserPassword varchar(15) NOT NULL,
DOB Date,
DOJ DATE DEFAULT GETDATE(),
Gender varchar(6) NOT NULL,
E_Mail varchar(40) NOT NULL UNIQUE,
PhoneNumber varchar(10) NOT NULL UNIQUE,
UserAddress varchar(50),
User_Library_Role varchar(10) DEFAULT 'Member',
)

INSERT INTO Library_Automation_System(Name,UserName,UserPassword,Gender,E_Mail,PhoneNumber,UserAddress,User_Library_Role) VALUES('Admin','AdminUserName','AdminPassword','Male','gowrishankar17022000@gmail.com','9487758805','Vasagasalai Street Ponnamapet','Admin')
DELETE Library_Automation_System WHERE Name='Admin'


SELECT * FROM Library_Automation_System




SELECT * FROM Library_Automation_System

CREATE PROCEDURE SP_Find_User
--Create procedure
@UserName varchar(15),
@Password varchar(15),
@Id int out
AS
BEGIN
SELECT @Id=UserID  from Library_Automation_System WHERE UserName=@UserName AND UserPassword=@Password

	IF(@Id>0)
	BEGIN
		RETURN @Id
	END
	ELSE
	BEGIN
		SET @Id=-1
		RETURN @Id
	END
END

CREATE PROCEDURE sp_Insert_Member
@Name varchar(15),

@UserName varchar(15),
@UserPassword varchar(15),
@Gender varchar(6),
@DOB date,
@DOJ date,
@Email varchar(40),
@Phonenumber  varchar(10),
@UserAddress varchar(50)
AS
BEGIN
INSERT INTO Library_Automation_System(Name,UserName,UserPassword,Gender,DOB,DOJ,PhoneNumber,E_Mail,UserAddress) VALUES(@Name,@UserName,@UserPassword,@Gender,@DOB,@DOJ,@Phonenumber,@Email,@UserAddress)
END

CREATE PROCEDURE sp_SelectMember
--Stored Procedure for select member

AS
BEGIN
SELECT Name,UserID,UserName,DOB,DOJ,Gender,E_Mail,PhoneNumber,UserAddress from Library_Automation_System 
END




CREATE PROCEDURE sp_DeleteMember
--Stored Procedure for delete member
@UserID int
AS
BEGIN
DELETE FROM Library_Automation_System WHERE UserID=@UserID
END

CREATE PROCEDURE sp_UpdateMember
@Name varchar(15),
@UserID int,
@UserName varchar(15),
@Gender varchar(6),
@DOB date,
@DOJ date,
@Email varchar(40),
@Phonenumber  varchar(10),
@UserAddress varchar(50)
AS
BEGIN
UPDATE Library_Automation_System SET Name=@Name,UserName=@UserName,Gender=@Gender,DOB=@DOB,DOJ=@DOJ,E_Mail=@Email,PhoneNumber=@Phonenumber,UserAddress=@UserAddress WHERE UserID=@UserID
END



DROP PROCEDURE sp_SelectMember

DROP PROCEDURE sp_DeleteMember

DROP PROCEDURE sp_Insert_Member

DROP PROCEDURE SP_Find_User

DROP PROCEDURE sp_UpdateMember

DROP TABLE Library_Automation_System
