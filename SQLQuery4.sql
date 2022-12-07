
SELECT IIF( LUONG <	[ LTB], 'TANG LUONG ',' KO TANG LUONG')
AS THUONG,TENNV,LUONG,[ LTB]
FROM
(SELECT TENNV,LUONG,[ LTB] FROM NHANVIEN,
(SELECT PHG , AVG(LUONG) AS ' LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP 
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC



SELECT IIF( LUONG <	[ LTB], 'NHANVIEN ',' TRUONGPHONG')
AS CHUC,TENNV,LUONG,[ LTB]
FROM
(SELECT TENNV,LUONG,[ LTB] FROM NHANVIEN,
(SELECT PHG , AVG(LUONG) AS ' LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP 
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC



SELECT TENNV = CASE
WHEN PHAI = 'NAM' THEN 'MR.'+TENNV 
WHEN PHAI = N'NỮ' THEN 'MS.'+ TENNV
ELSE 'FREE SEX'+TENNV
END
FROM NHANVIEN


SELECT TENNV,LUONG,THUE = CASE
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.12
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.2
ELSE LUONG*0.25   END 
FROM NHANVIEN

DECLARE @DEM INT =2 
WHILE @DEM<(SELECT COUNT (MANV) FROM NHANVIEN)
      BEGIN
	     SELECT* FROM NHANVIEN WHERE CAST (MANV AS INT)=@DEM
		 SET @DEM = @DEM+2
	  END

DECLARE @SO INT =2 
WHILE @SO<(SELECT COUNT (MANV) FROM NHANVIEN)
      BEGIN
	  IF @SO=4 
			BEGIN 
				SET @SO=@SO+2
				CONTINUE;
			END
	     SELECT* FROM NHANVIEN WHERE CAST (MANV AS INT)=@SO
		 SET @SO = @SO+2
	  END
 
BEGIN TRY
	insert	 PHONGBAN (TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
	VALUES ('KE HOACH' , 111, '019', '2020-11-24')
	PRINT 'THEM THANH CONG'
END TRY
BEGIN CATCH
	PRINT 'THEM DU LIEU THAT BAI'+CONVERT(VARCHAR,ERROR_NUMBER(),1)+'=>'+ERROR_MESSAGE()
END CATCH


DECLARE @a int=5,@b int=0,@c int;
begin try
	SET @c = @a/@b;
end try
begin catch
	declare @tbl nvarchar(2048),
			@mucdo int,
			@tt int
	select @tbl = error_message(),
			@mucdo = ERROR_SEVERITY(),
			@tt = error_state()
	raiserror(@tbl,@mucdo,@tt)
end catch

--cau 4
	Declare @r int = 1,@t int=0;
		while @r <=10 
		begin 
			set @t= @r+@t
			set @r=@r+1
		end
	print @t;
		
		Declare @i int = 1, @o int=0;
		while @i <=10 
		begin 
			if @i =4
			begin
				set @i=@i+1
				continue;
			end
			set @o= @i+@o
			set @i=@i+1
		end
	print @o;
		