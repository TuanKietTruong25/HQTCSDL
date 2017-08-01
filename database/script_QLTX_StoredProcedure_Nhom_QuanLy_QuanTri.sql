USE [QLTX]
GO

------- Danh sách các Stored Procedure của bảng Nhóm, Quản Lý, Quản Trị ----------


-- sp_ThemNhom
-- Chức năng: Thêm nhóm
-- Input: các thông tin của nhóm
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_ThemNhom
	@Ten nvarchar(50),
	@NhomTruong int,
	@result int out
as
begin
	begin try
		INSERT INTO [NHOM]([TEN], [NHOMTRUONG]) VALUES(@Ten, @NhomTruong)
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_ThemNhom N'Nhóm 4', null, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_SuaNhom
-- Chức năng: Sửa thông tin nhóm
-- Input: các thông tin của nhóm
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_SuaNhom
	@Ma int,
	@Ten nvarchar(50),
	@NhomTruong int,
	@result int out
as
begin
	begin try
		UPDATE [NHOM]
		SET TEN = @Ten, NHOMTRUONG = @NhomTruong
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
exec sp_SuaNhom 4, N'Nhóm 3a', 10, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_XoaNhom
-- Chức năng: Xóa nhóm
-- Input: Mã nhóm
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_XoaNhom
	@Ma int,
	@result int out
as
begin
	begin try
		DELETE FROM [NHOM] WHERE MA = @Ma
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_XoaNhom 4, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_LoadNhom
-- Chức năng: Tải danh sách nhóm
-- Input: Không
-- Output: trả về danh sách nhóm
create proc sp_LoadNhom
as
begin
	select * 
	from [NHOM]
end
go
-- Test
exec sp_LoadNhom
go


-- sp_ThemQuanLy
-- Chức năng: Thêm quản lý
-- Input: các thông tin của quản lý
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_ThemQuanLy
	@Ma int,
	@HoTen nvarchar(50),
	@NgaySinh date,
	@result int out
as
begin
	begin try
		INSERT INTO [QUANLY]([MA], [HOTEN], [NGAYSINH]) VALUES(@Ma, @HoTen, @NgaySinh)
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
INSERT INTO [TAIKHOAN]([MA], [TAIKHOAN], [MATKHAU], [LOAINGUOIDUNG]) VALUES(15, N'tk_test', N'tk_test', N'Quản lý')
declare @rs int
exec sp_ThemQuanLy 15, N'Robotto', '1995-10-25', @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_SuaQuanLy
-- Chức năng: Sửa thông tin quản lý
-- Input: các thông tin của quản lý
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_SuaQuanLy
	@Ma int,
	@HoTen nvarchar(50),
	@NgaySinh date,
	@result int out
as
begin
	begin try
		UPDATE [QUANLY]
		SET HOTEN = @HoTen, NGAYSINH = @NgaySinh
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
exec sp_SuaQuanLy 15, N'Robotto 2', '1995-10-10', @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_XoaQuanLy
-- Chức năng: Xóa quản lý
-- Input: Mã quản lý
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
create proc sp_XoaQuanLy
	@Ma int,
	@result int out
as
begin
	begin try
		DELETE FROM [QUANLY] WHERE MA = @Ma
		set @result = 0
	end try
	begin catch
		set @result = -1
	end catch
end
go
-- Test
declare @rs int
exec sp_XoaQuanLy 15, @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
DELETE FROM [TAIKHOAN] WHERE MA = 15
go


-- sp_LoadQuanLy
-- Chức năng: Tải danh sách quản lý
-- Input: Không
-- Output: trả về danh sách quản lý
create proc sp_LoadQuanLy
as
begin
	select * 
	from [QUANLY]
end
go
-- Test
exec sp_LoadQuanLy
go


-- sp_SuaQuanTri
-- Chức năng: Sửa thông tin quản trị
-- Input: các thông tin của quản trị
-- Output: trả về -1 nếu thất bại, 0 nếu thành công
-- Ghi chú: do quản trị là duy nhất nên không thêm không xóa được, chỉ có thể sửa thông tin thôi
create proc sp_SuaQuanTri
	@Ma int,
	@HoTen nvarchar(50),
	@NgaySinh date,
	@result int out
as
begin
	begin try
		UPDATE [QUANTRI]
		SET HOTEN = @HoTen, NGAYSINH = @NgaySinh
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
exec sp_SuaQuanTri 1, N'Nguyễn Thị Quản Trị', '1978-12-25', @rs out
print 'Ket qua tra ve: ' + convert(varchar, @rs)
go


-- sp_LoadQuanTri
-- Chức năng: Tải danh sách quản trị
-- Input: Không
-- Output: trả về danh sách quản trị (thật ra chỉ có 1 dòng)
create proc sp_LoadQuanTri
as
begin
	select * 
	from [QUANTRI]
end
go
-- Test
exec sp_LoadQuanTri
go