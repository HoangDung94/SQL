CREATE PROCEDURE LAB5_3D
	@HONV VARCHAR(15),@TENLOT VARCHAR(15),@TENNV VARCHAR(15),
	@MANV VARCHAR(5),@NGSINH DATE,@DCHI VARCHAR(50),@PHAI VARCHAR(4),
	@LUONG FLOAT,@MA_NQL VARCHAR(3)=NULL , @PHG VARCHAR(3)
	AS 
	BEGIN 
		DECLARE @AGE int
		SET @AGE = YEAR (GETDATE())-YEAR(@NGSINH)
		IF @PHG= (SELECT MAPHG FROM PHONGBAN WHERE TENPHG = 'IT')
			BEGIN
				if @luong<25000
					set @ma_nql = '009'
				else set @ma_nql = '005'
				if @phai = 'nam' and (@age >=18 and @age<=65) or @phai = 'nu' and (@age >=18 and  @age <=60)
					begin
						insert into NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
						values(@HONV,@TENLOT,@TENNV,@MANV,@NGSINH,@DCHI,@PHAI,@LUONG,@MA_NQL,@PHG)
					end
				else
					print 'ko thuoc do tuoi yeu cau'

			end
		else 
			print ' ko thuoc phong it'

	END
	exec LAB5_3C 