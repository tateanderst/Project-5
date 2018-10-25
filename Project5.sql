use disk_inventory;
go

--First created the save procedures, starting with the artist, then the borrower and then disk
--then put the try statements around the statements that run off of the save procedures, and returns error messages if the
-- procedures fail


--3
-- Create a new artist and put it into the artist table
Create Proc ArtistInsert
	@fname		varchar(50),
	@lname		varchar(50),
	@GroupName	varchar(50),
	@artisttypeid	int
as
	Insert into Artist(fname, lname, groupName, ArtistTypeID)
	values (@fname, @lname, @GroupName, @artisttypeid)
go


-- update an artist at it's artist id and change it's name
Create Proc ArtistUpdate
	@artistID int,
	@fname		varchar(50),
	@lname		varchar(50)
as
	Update Artist
	set fname = @fname, lname = @lname
	where  ArtistId = @artistID
go

-- deletes an artist at the artist's id
Create Proc ArtistDelete
	@artistID int
as
	delete Artist where Artistid = @artistID
go




--4
-- Update a borrower by it's id and change it's name
Create proc BorrowerUpdate
	@borrowerid	int,
	@fname		varchar(50),
	@lname		varchar(50)
as
	update Borrower
	set fname = @fname, lname = @lname
	where  brrowerID = @borrowerid
go


-- create a new borrower with a new id and put it into the borrower table
create proc BorrowerInsert
	@fname		varchar(50),
	@lname		varchar(50),
	@PhoneNum	varchar(50)
as
	Insert into Borrower (fname, lname, PhoneNum)
	values (@fname, @lname, @PhoneNum)
go

-- delete a borrower by the id
create proc BorrowerDelete
	@borrowerid int
as
	delete Borrower where brrowerID = @borrowerid
go



--5
-- update a disk by it's disk id, and insert all new values
create proc Diskupdate
	@diskid		int,
	@diskname	varchar(50),
	@reldate	varchar(50),
	@DiskType	Varchar(50),
	@GenreID	int,
	@StatusCode	int
as
	update Disk
	set DiskName = @diskname, RelDate = @reldate, DiskType = @DiskType, GenreID = @GenreID, StatusCode = @StatusCode
	where DiskID = @diskid;
go

-- create a new disk and put it into the disk table

create proc diskinsert

	@diskname	varchar(50),
	@reldate	varchar(50),
	@DiskType	Varchar(50),
	@GenreID	int,
	@StatusCode	int
as

	insert into Disk (DiskName, RelDate, DiskType, GenreID, StatusCode)
	values (@diskname, @reldate, @DiskType, @GenreID, @StatusCode)
go

-- delete a disk by id
create proc diskdelete
	@diskid int
as
	delete disk where DiskID = @diskid
go


-- insert into the artist table with new info
begin Try
exec artistinsert 'tems2', 'tems3', 'tems2', 2;
end Try
begin catch
print error_message()
end catch;



-- update an artist at an id with a new name
begin Try
exec artistUpdate 2, 'tems2', 'tems3';
end Try
begin catch
print error_message()
end catch;

-- delete artist at an artist id position
begin Try
exec ArtistDelete 62;
end Try
begin catch
print error_message()
end catch;

-- insert into the borrower table with a new borrower name and phone number
begin Try
exec BorrowerInsert 'super', 'man' ,'3339484';
end Try
begin catch
print error_message()
end catch;

-- update a borrower at a certain id with new name
begin Try
exec BorrowerUpdate 61, 'super', 'duper man';
end Try
begin catch
print error_message()
end catch;

-- delete the borrower at id 61
begin Try
exec Borrowerdelete 61;
end Try
begin catch
print error_message()
end catch;

-- create a new disk
begin Try
exec diskinsert 'spiderman', '00898321', 'dvd', 1, 2;
end Try
begin catch
print error_message()
end catch;

-- update a disk with new data
begin Try
exec diskupdate 63, '12 spidermen of christmas', '44312343', 'dvd', 1, 2;
end Try
begin catch
print error_message()
end catch;

-- delete a disk
begin Try
exec diskdelete 62;
end Try
begin catch
print error_message()
end catch;