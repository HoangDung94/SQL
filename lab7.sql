
create function lab71a (@manv nvarchar(4))
returns int
as 
begin 
return ( select year(getdate()) - YEAR(NGSINH) from NHANVIEN where MANV=@manv)
end
 print N'tuổi nhân viên là :' + cast (dbo.lab71a('005') as varchar(5))

 create function lab7_1b (@manv nvarchar(4))
returns int
as 
begin 
 return ( select count(MADA) FROM PHANCONG where MA_NVIEN = @manv)
 end

 create function lab7_1c (@phai nvarchar(4))
returns int
as 
begin
 return ( select count(*) FROM NHANVIEN WHERE UPPER(PHAI) = upper(@phai))
 end
 create function lab7_1c (@phai nvarchar(4))
returns int
as 
begin
 return ( select count(*) FROM NHANVIEN WHERE UPPER(PHAI) = upper(@phai))
 end
 print N'số lượng nhân viên nam lá :' + cast(dbo.lab7_1c(N'NAM') AS VARCHAR(4))
  print N'số lượng nhân viên nữ lá :' + cast(dbo.lab7_1c(N'NỮ') AS VARCHAR(4))

  create function lab7_1D (@tenphg nvarchar(10))
returns @list table(TENNHANVIEN VARCHAR(60),luong float)
as 
begin
 declare @ltb float
 select @ltb = AVG(LUONG) from NHANVIEN INNER JOIN PHONGBAN ON PHONGBAN.MAPHG = NHANVIEN.PHG where upper(TENPHG) = upper(@tenphg)
 insert into @list
	select  concat(HONV,' ',TENLOT,' ',TENNV), LUONG FROM NHANVIEN WHERE luong > @ltb
 return
 end
  select * from dbo.lab7_1D(N'Nghiên Cứu');

CREATE FUNCTION lab7_1e(@maphg int)
returns @List table(tenphg nvarchar(20), matp nvarchar(10), tentp nvarchar(50), sl int)
as 
begin
	insert into @List
	SELECT TENPHG, TRPHG, HONV + ' ' + TENLOT + ' ' + TENNV as 'Ten truong phong', 
	COUNT(MADA) as 'SOLUONGDEAN' FROM PHONGBAN
		INNER JOIN DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
		INNER JOIN NHANVIEN ON NHANVIEN.MANV = PHONGBAN.TRPHG
		WHERE PHONGBAN.MAPHG = @maphg
		GROUP BY TENPHG, TRPHG, TENNV, HONV, TENLOT
	return
end

select * from dbo.lab7_1e('001')



create view lab7_2a
as
select HONV,TENPHG,DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG

select * from lab7_2a

create view lab7_2b
as
select TENNV,LUONG,YEAR(GETDATE())-YEAR(NGSINH)as 'Tuoi' from NHANVIEN

select * from lab7_2b

create view lab7_2c
as
select top(1) TENPHG,TRPHG,B.HONV+' '+B.TENLOT+' '+B.TENNV as 'TenTP',COUNT(A.MANV)as 'SoLuongNV' 
from NHANVIEN A
inner join PHONGBAN on PHONGBAN.MAPHG = A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG,B.TENNV,B.HONV,B.TENLOT
order by SoLuongNV desc

select * from lab7_2c
