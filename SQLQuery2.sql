create database Henil;
GO
--drop database Henil;

use Henil;

create table HenilFirstTable
(
Id bigint identity(1,1) primary key,
CreatedBy VARCHAR(50) NOT NULL,
CreatedDate DateTime NOT NULL DEFAULT GETDATE(),
UpdatedBy VARCHAR(50) NULL,
UpdatedDate DateTime NULL
)

INSERT HenilFirstTable (CreatedBy,CreatedDate) values ('1',GETDATE());
INSERT HenilFirstTable (CreatedBy) values ('2');
INSERT HenilFirstTable (CreatedDate) values (GETDATE());

select * from HenilFirstTable;

UPDATE HenilFirstTable SET CreatedBy = 5,UpdatedBy = 2,UpdatedDate=GETDATE() WHERE Id = 1;

DELETE HenilFirstTable WHERE Id = 1;

DELETE FROM HenilFirstTable WHERE Id = 2;

ALTER TABLE HenilFirstTable ALTER COLUMN UpdatedBy INT;

CREATE TABLE TblUsers
(
Id bigint identity(1,1) primary key,
[Name] varchar(50),
CreatedBy INT NOT NULL,
CreatedDate DateTime NOT NULL DEFAULT GETDATE(),
UpdatedBy INT NULL,
UpdatedDate DateTime NULL
)

INSERT TblUsers ([Name],CreatedBy) values ('Henil','1');
INSERT TblUsers ([Name],CreatedBy) values ('Hiren','1');
INSERT TblUsers ([Name],CreatedBy) values ('Samir','1');



INSERT HenilFirstTable (CreatedBy) values ('2');

select HFT.*,TU.[Name] from HenilFirstTable as HFT
--join 
inner join TblUsers as TU on HFT.CreatedBy=TU.Id;


select HFT.*,TU.[Name] from HenilFirstTable as HFT
--join 
left join TblUsers as TU on HFT.CreatedBy=TU.Id
where TU.Id is not null;


select HFT.*,TU.[Name] from HenilFirstTable as HFT
--join 
left join TblUsers as TU on HFT.CreatedBy=TU.Id
where TU.Id is not null;


select HFT.*,TU.* from HenilFirstTable as HFT
--join 
cross join TblUsers as TU;
GO

create procedure SpGetData
@Id int
As
Begin
SELECT * FROM HenilFirstTable WHERE Id= @Id OR @Id is null;
END


--SpGetData '4'
EXEC SpGetData '4';

****is null ****
select Id,Name,Email,ISNULL(GendarId,999) GendarId from TblPerson

select A.Id,A.Name,A.Email,REPLACE(ISNULL(A.GendarId,999),999,11) GendarId from TblPerson A




