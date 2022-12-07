-- câu 1 
--a
create procedure lab5_1a @ten varchar(20)
as
begin 

print ' xin chào' + @ten
end 
exec lab5_1a N'Dũng'

--b
 create procedure lab5_1b @s1 int,@s3 int
as
begin
declare @tg int
set @tg = @s1+@s3
print N'tổng là:'+ cast(@tg as varchar(10))
end
exec lab5_1b 9, 10

--c
create procedure lab5_1c @n int 
as
begin
	declare @tong int =0 ,@i int =0
	WHILE @i<= @n
		begin
			set @tong = @tong + @i
		set @i = @i+2
		end
	print N'tổng là :' + cast(@tong as varchar(10))
end
exec lab5_1c 300



--d
create procedure lab5_1d @a int ,@b int
as
begin
while (@a != @b)
	begin
		if @a > @b 
			set @a = @a-@b
		else
			set @b=@b-@a

	end 
	return @a
end
	
declare @c int 
exec @c =lab5_1d 15,9
print @c

---câu 2 
--a
create procedure lab5_2a @manv varchar(4)
as
begin
	select * from NHANVIEN where MANV= @manv
end
	EXEC lab5_2a '001'
 

 --b
 create procedure lab5_2b @MADA varchar(4)
as
begin
	select COUNT(MANV) AS ' SO LUONG',MADA,TENPHG FROM NHANVIEN INNER JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG INNER JOIN DEAN ON DEAN.PHONG=PHONGBAN.MAPHG 
	WHERE MADA=@MADA GROUP BY MADA,TENPHG
	
end
	EXEC lab5_2b '3'


	--c
	create procedure lab5_2c @MADA varchar(4) , @ddiem_da varchar(10)
as
begin
	select COUNT(MANV) AS ' SO LUONG',MADA,TENPHG FROM NHANVIEN INNER JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG INNER JOIN DEAN ON DEAN.PHONG=PHONGBAN.MAPHG 
	WHERE MADA=@MADA and DDIEM_DA =@ddiem_da  GROUP BY MADA,TENPHG
	
end
	EXEC lab5_2c '3','TP HCM'


	--d
	create procedure lab5_2d @TRPHG VARCHAR(4)
as
begin
	select * FROM NHANVIEN INNER JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG LEFT OUTER JOIN THANNHAN ON THANNHAN.MA_NVIEN = NHANVIEN.MANV WHERE THANNHAN.MA_NVIEN IS NULL AND TRPHG = @TRPHG
	
end
	EXEC lab5_2d '006'



	---e

	create procedure lab5_2e @manv VARCHAR(4),@mapb VARCHAR(4)
as
begin
	if exists(select*from NHANVIEN WHERE MANV= @manv AND PHG=@mapb)
		print N' nhân viên có thuộc phòng ban'
	else 
		print N' nhân viên không có thuộc phòng ban'
end
	EXEC lab5_2e '001','5'


 