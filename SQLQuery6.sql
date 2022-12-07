
--câu 1
create trigger lab61a ON NHANVIEN
FOR INSERT
AS
	IF (SELECT LUONG FROM INSERTED)<15000
		BEGIN
			PRINT 'LUONG PHAI LON HON 15000'
			ROLLBACK TRANSACTION
		END

INSERT INTO NHANVIEN VALUES('TONG','PHUOC','QUAN','019','01-09-1975','275BD','NAM',10000,'005',1)

create trigger lab61b ON NHANVIEN
FOR INSERT
AS 
	declare @tuoi int
	set @tuoi = year(getdate())-(select year(NGSINH) from inserted)
	if (@tuoi <=18 or @tuoi>65)
		begin
			print'tuoi khong hop le'
			rollback transaction
		end

	INSERT INTO NHANVIEN VALUES('TONG','PHUOC','QUAN','020','01-09-1975','275BD','NAM',16000,'005',1)


	create trigger lab61 ON NHANVIEN
FOR update AS 
	IF (select DCHI from inserted ) like '%TP HCM%'
		BEGIN
			PRINT 'ko duoc cap nhap nhan vien o tphcm'
			ROLLBACK TRANSACTION
		END

update nhanvien set HOTEN = 'TAM' where MANV='003'	

--CÂU 2 
create trigger LAB6_2A on NHANVIEN
   AFTER INSERT
AS
   BEGIN 
		SELECT COUNT (CASE WHEN UPPER(PHAI) = N'NAM' THEN 1 END)NAM,COUNT (CASE WHEN UPPER(PHAI) = N'NỮ' THEN 1 END)NỮ FROM NHANVIEN
	END

INSERT INTO NHANVIEN VALUES ('Nguyễn','Nhật','Luân','022','7-6-2002','TP HCM','Nam',18000,'003',1)


create trigger LAB6_2B on NHANVIEN
   AFTER INSERT
AS
   BEGIN 
		  if update(Phai)
			 begin
				 select count(case when upper(PHAI)='Nam' then 1 end) Nam,
				 count(case when upper(PHAI)=N'Nữ' then 1 end) Nữ from NHANVIEN
			 end
	END
	update NHANVIEN set PHAI ='Nam' where MANV= '022'


	
create trigger LAB6_2C on DEAN
   AFTER DELETE
AS
   BEGIN 
		SELECT MA_NVIEN,COUNT(MADA) AS 'SO LUONG DU AN' FROM PHANCONG GROUP BY MA_NVIEN
	END
	INSERT INTO DEAN VALUES('TEST','55','T1',5)
	DELETE FROM DEAN WHERE MADA = 40


	--CAU 3
	create trigger LAB6_3A on NHANVIEN
instead of delete
as
	begin
		delete from THANNHAN where MA_NVIEN in(select MANV from deleted)
		delete from NHANVIEN where MANV in(select MANV from deleted)
	end
insert into THANNHAN values ('059', 'DUNG', 'NỮ', '14-10-2019', 'EM GÁI')
delete NHANVIEN where manv='059'

create trigger LAB8_3B on NHANVIEN
after insert 
	as
		begin
			insert into PHANCONG values ((select MANV from inserted), 1,2,20)
		end
INSERT INTO NHANVIEN VALUES ('HUỲNH','TẤN','TRUNG','047','9-9-1998','TP HCM','Nam',20000,'005',1)