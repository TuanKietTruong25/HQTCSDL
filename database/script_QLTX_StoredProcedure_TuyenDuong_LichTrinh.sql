USE [QLTX]
GO

------- Danh sách các Stored Procedure của bảng Tuyến Đường và Lịch Trình ----------


-- sp_LoadTuyenDuong
-- Chức năng: Tải danh sách tuyến đường
-- Input: Không
-- Output: trả về danh sách tuyến đường
create proc sp_LoadTuyenDuong
as
begin
	select * 
	from [TUYENDUONG]
end
go
-- Test
exec sp_LoadTuyenDuong
go


-- sp_ThemTuyenDuong
-- Chức năng: Thêm tuyến đường
-- Input: các thông tin của tuyến đường
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_ThemTuyenDuong
	@Ten nvarchar(50),
	@ChieuDai int,
	@DiemBatDau nvarchar(50),
	@DiemKetThuc nvarchar(50),
	@result int out
as
begin
	begin try
		INSERT INTO [TUYENDUONG]([TEN], [CHIEUDAI], [DIEMBATDAU], [DIEMKETTHUC]) VALUES (@Ten, @ChieuDai, @DiemBatDau, @DiemKetThuc)
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_ThemTuyenDuong N'Trái Đất - Mặt Trăng', 384000, N'Bến Xe Trái Đất', N'Bến Xe Mặt Trăng', @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_SuaTuyenDuong
-- Chức năng: Sửa tuyến đường
-- Input: các thông tin của tuyến đường
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_SuaTuyenDuong
	@Ma int,
	@Ten nvarchar(50),
	@ChieuDai int,
	@DiemBatDau nvarchar(50),
	@DiemKetThuc nvarchar(50),
	@result int out
as
begin
	begin try
		UPDATE [TUYENDUONG]
		SET TEN = @Ten, CHIEUDAI = @ChieuDai, DIEMBATDAU = @DiemBatDau, DIEMKETTHUC = @DiemKetThuc
		WHERE MA = @Ma
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_SuaTuyenDuong 27, N'Tâm Trái Đất - Bề Mặt Mặt Trăng', 384403, N'Bến Xe Trái Đất', N'Bến Xe Mặt Trăng', @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_XoaTuyenDuong
-- Chức năng: Xóa tuyến đường
-- Input: Mã tuyến đường
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_XoaTuyenDuong
	@Ma int,
	@result int out
as
begin
	begin try
		DELETE FROM [TUYENDUONG] WHERE MA = @Ma
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_XoaTuyenDuong 27, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_LoadLichTrinh
-- Chức năng: Tải danh sách lịch trình theo tháng
-- Input: Tháng, Năm (của lịch trình)
-- Output: trả về danh sách lịch trình của tháng/năm tương ứng 
create proc sp_LoadLichTrinh
	@month int,
	@year int
as
begin
	declare @ThangPhanCong int
	declare @NamPhanCong int
	if @month != 1
		begin
			set @ThangPhanCong = @month - 1
			set @NamPhanCong = @year
		end
	else
		begin
			set @ThangPhanCong = 12
			set @NamPhanCong = @year - 1
		end
	select * 
	from [LICHTRINH]
	where datepart(year, NGAYPHANCONG) = @NamPhanCong and datepart(month, NGAYPHANCONG) = @ThangPhanCong
end
go
-- Test
exec sp_LoadLichTrinh 7, 2017
go


-- sp_ThemLichTrinh
-- Chức năng: Thêm lịch trình
-- Input: các thông tin của lịch trình
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_ThemLichTrinh
	@ThoiGianBatDau datetime,
	@ThoiGianKetThuc datetime,
	@MaTuyenDuong int,
	@NgayPhanCong date,
	@MaXe int,
	@NguoiChinhSuaCuoiCung int,
	@TaiXe int,
	@result int out
as
begin
	begin try
		INSERT INTO [LICHTRINH]([THOIGIANBATDAU], [THOIGIANKETTHUC], [MATUYENDUONG], [NGAYPHANCONG], [MAXE], [NGUOICHINHSUACUOICUNG], [TAIXE]) VALUES(@ThoiGianBatDau, @ThoiGianKetThuc, @MaTuyenDuong, @NgayPhanCong, @MaXe, @NguoiChinhSuaCuoiCung, @TaiXe)
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_ThemLichTrinh '2017-08-01 5:00:00', '2017-08-03 5:00:00', 11, '2017-7-20', 1, 2, 8, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_XoaLichTrinh
-- Chức năng: Xóa danh sách lịch trình theo tháng
-- Input: Tháng, Năm (của lịch trình)
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_XoaLichTrinh
	@month int,
	@year int,
	@result int out
as
begin
	begin try
		declare @ThangPhanCong int
		declare @NamPhanCong int
		if @month != 1
			begin
				set @ThangPhanCong = @month - 1
				set @NamPhanCong = @year
			end
		else
			begin
				set @ThangPhanCong = 12
				set @NamPhanCong = @year - 1
			end
		delete from [LICHTRINH] where datepart(year, NGAYPHANCONG) = @NamPhanCong and datepart(month, NGAYPHANCONG) = @ThangPhanCong
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_XoaLichTrinh 8, 2017, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go
