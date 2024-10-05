CREATE DATABASE ASM_JAVA3;
GO
USE ASM_JAVA3;
GO
-- DROP DATABASE ASM_JAVA3;
CREATE TABLE CATEGORIES (
                            ID CHAR(14) NOT NULL,
                            NAME NVARCHAR(50) NOT NULL

	CONSTRAINT PK_CATEGORIES PRIMARY KEY(ID)
);

CREATE TABLE USERS (
                       ID CHAR(14) NOT NULL,
                       PASSWORD VARCHAR(50) NOT NULL,
                       FULLNAME NVARCHAR(50) NULL,
                       BIRTHDAY DATE NULL,
                       GENDER BIT NOT NULL,
                       MOBILE VARCHAR(10) NULL,
                       EMAIL VARCHAR(50) NULL,
                       ROLE BIT NOT NULL

                           CONSTRAINT PK_USER PRIMARY KEY(ID)
);

CREATE TABLE NEWS (
                      ID CHAR(14) NOT NULL,
                      TITLE NVARCHAR(255) NOT NULL,
                      CONTENT NVARCHAR(MAX) NULL,
                      IMG VARCHAR(255) NULL,
                      POSTED_DATE DATE NULL,
                      AUTHOR NVARCHAR(50) NULL,
                      VIEW_COUNT INT NULL,
                      CATEGORIES_ID CHAR(14) NOT NULL,
                      HOME BIT NULL

	CONSTRAINT PK_NEWS PRIMARY KEY(ID),
                      CONSTRAINT FK_NEWS_CATEGORIES FOREIGN KEY(CATEGORIES_ID) REFERENCES CATEGORIES(ID)
);

CREATE TABLE NEWSLETTERS (
                             EMAIL VARCHAR(50) NOT NULL,
                             ENABLED BIT NOT NULL

                                 CONSTRAINT PK_NEWSLETTERS PRIMARY KEY(EMAIL)
);
GO
----------------------------------------------------------------------------------------------------
GO
INSERT INTO CATEGORIES (ID, NAME)
VALUES
	('THETHAO', N'Thể Thao'),
	('VANHOA', N'Văn Hóa'),
	('KHOAHOC', N'Khoa Học'),
	('THOISU', N'Thời Sự'),
	('XAHOI', N'Xã Hội');

INSERT INTO USERS (ID, PASSWORD, FULLNAME, BIRTHDAY, GENDER, MOBILE, EMAIL, ROLE)
VALUES
    ('20240910151512', 'ltman880425', N'Lê Tấn Mạnh', '1988-04-25', 1, '0932345678', 'ltman880425@gmail.com', 1),
    ('20240912162345', 'phamtu910301', N'Phạm Tấn Tú', '1991-03-01', 1, '0942345678', 'phamtu910301@gmail.com', 0),
    ('20240909094555', 'ngtho750915', N'Nguyễn Thị Hồng', '1975-09-15', 0, '0952345678', 'ngtho750915@gmail.com', 0),
    ('20240914183020', 'trmin850720', N'Trần Minh Anh', '1985-07-20', 1, '0962345678', 'trmin850720@gmail.com', 0),
    ('20240917150011', 'ltnha940515', N'Lý Thị Nhã', '1994-05-15', 0, '0972345678', 'ltnha940515@gmail.com', 0),
    ('20240921121534', 'ngtan820304', N'Ngô Tấn An', '1982-03-04', 1, '0982345678', 'ngtan820304@gmail.com', 0),
    ('20240919181542', 'dovan860830', N'Doãn Văn Bình', '1986-08-30', 1, '0992345678', 'dovan860830@gmail.com', 0),
    ('20240913094500', 'nthoa930621', N'Nguyễn Thị Hoa', '1993-06-21', 0, '0913456789', 'nthoa930621@gmail.com', 0),
    ('20240922123055', 'thanh800411', N'Thái Anh Tuấn', '1980-04-11', 1, '0923456789', 'thanh800411@gmail.com', 1),
    ('20240916130507', 'ledinh990905', N'Lê Đình Phúc', '1999-09-05', 0, '0933456789', 'ledinh990905@gmail.com', 0),
    ('20240923200022', 'trquo810727', N'Trương Quốc Anh', '1981-07-27', 1, '0943456789', 'trquo810727@gmail.com', 1),
    ('20240911170018', 'phamtr900506', N'Phạm Thị Trang', '1990-05-06', 0, '0953456789', 'phamtr900506@gmail.com', 0),
    ('20240914063045', 'hnthi990104', N'Hoàng Nhật Thi', '1999-01-04', 0, '0963456789', 'hnthi990104@gmail.com', 0),
    ('20240925123033', 'ngtru780718', N'Nguyễn Trường', '1978-07-18', 0, '0973456789', 'ngtru780718@gmail.com', 0),
    ('20240926181017', 'ddmin830514', N'Dương Minh Tuấn', '1983-05-14', 1, '0983456789', 'ddmin830514@gmail.com', 0),
    ('20240915234510', 'hntan950912', N'Hồ Ngọc Tân', '1995-09-12', 1, '0993456789', 'hntan950912@gmail.com', 0),
    ('20240910102039', 'tranth870313', N'Tran Thị Cẩm', '1987-03-13', 0, '0914567890', 'tranth870313@gmail.com', 0),
    ('20240905083009', 'lttrang921224', N'Lê Thị Trang', '1992-12-24', 0, '0924567890', 'lttrang921224@gmail.com', 0),
    ('20240928083012', 'tranho980905', N'Trần Hoàng Nam', '1998-09-05', 1, '0901234567', 'tranho980905@gmail.com', 0),
    ('20240928103045', 'phamth920602', N'Phạm Thị Kim', '1992-06-02', 0, '0912345678', 'phamth920602@gmail.com', 0);

INSERT INTO NEWS (ID, TITLE, CONTENT, IMG, POSTED_DATE, AUTHOR, VIEW_COUNT, CATEGORIES_ID, HOME)
VALUES
    ('20240928203001', N'Tin Tức Thế Giới', N'Cập nhật những tin tức nóng hổi từ khắp nơi trên thế giới.', 'tin-tuc-the-gioi.jpg', '2024-09-28 20:30:01', N'Nguyễn Thị Hồng', 100, 'THOISU', 0),
    ('20240928180020', N'Sự Kiện Thể Thao', N'Tin tức về các sự kiện thể thao lớn trong tháng này.', 'su-kien-the-thao.jpg', '2024-09-28 18:00:20', N'Lý Thị Nhã', 150, 'THETHAO', 1),
    ('20240927094533', N'Chương Trình Âm Nhạc', N'Thông tin về các chương trình âm nhạc sắp tới.', 'chuong-trinh-am-nhac.jpg', '2024-09-27 09:45:33', N'Phạm Tấn Tú', 200, 'KHOAHOC', 0),
    ('20240926120015', N'Triển Lãm Nghệ Thuật', N'Khám phá các triển lãm nghệ thuật đang diễn ra.', 'trien-lam-nghe-thuat.jpg', '2024-09-26 12:00:15', N'Ngô Tấn An', 250, 'KHOAHOC', 0),
    ('20240926173045', N'Tin Tức Công Nghệ', N'Tin tức mới nhất về công nghệ và phát minh.', 'tin-tuc-cong-nghe.jpg', '2024-09-26 17:30:45', N'Doãn Văn Bình', 300, 'THETHAO', 1),
    ('20240925110005', N'Tin Tức Giáo Dục', N'Những xu hướng mới trong giáo dục và đào tạo.', 'tin-tuc-giao-duc.jpg', '2024-09-25 11:00:05', N'Nguyễn Trường', 180, 'KHOAHOC', 0),
    ('20240925150012', N'Sự Kiện Văn Hóa', N'Tin tức về các sự kiện văn hóa nổi bật.', 'su-kien-van-hoa.jpg', '2024-09-25 15:00:12', N'Dương Minh Tuấn', 160, 'VANHOA', 0),
    ('20240924223000', N'Tin Tức Thời Sự', N'Cập nhật các tin tức thời sự nóng hổi nhất.', 'tin-tuc-thoi-su.jpg', '2024-09-24 22:30:00', N'Nguyễn Thị Hoa', 240, 'THOISU', 1),
    ('20240924150040', N'Hội Chợ Thương Mại', N'Tin tức về hội chợ thương mại sắp diễn ra.', 'hoi-cho-thuong-mai.jpg', '2024-09-24 15:00:40', N'Phạm Thị Kim', 170, 'KHOAHOC', 0),
    ('20240924123025', N'Tin Tức Du Lịch', N'Những địa điểm du lịch hot trong năm nay.', 'tin-tuc-du-lich.jpg', '2024-09-24 12:30:25', N'Ngô Tấn An', 190, 'VANHOA', 0),
    ('20240923204533', N'Giải Thưởng Âm Nhạc', N'Thông tin về giải thưởng âm nhạc lớn sắp diễn ra.', 'giai-thuong-am-nhac.jpg', '2024-09-23 20:45:33', N'Doãn Văn Bình', 280, 'KHOAHOC', 1),
    ('20240923212050', N'Tin Tức Thời Trang', N'Tin tức mới nhất về thời trang và phong cách.', 'tin-tuc-thoi-trang.jpg', '2024-09-23 21:20:50', N'Lý Thị Nhã', 220, 'VANHOA', 0),
    ('20240922175018', N'Tin Tức Ẩm Thực', N'Khám phá các món ăn đặc sản trong tháng này.', 'tin-tuc-am-thuc.jpg', '2024-09-22 17:50:18', N'Nguyễn Trường', 300, 'KHOAHOC', 0),
    ('20240922110030', N'Tin Tức Chính Trị', N'Tin tức nóng hổi về các vấn đề chính trị hiện tại.', 'tin-tuc-chinh-tri.jpg', '2024-09-22 11:00:30', N'Nguyễn Thị Hồng', 150, 'THOISU', 1),
    ('20240922143005', N'Tin Tức Khoa Học', N'Khám phá những phát minh mới trong khoa học.', 'tin-tuc-khoa-hoc.jpg', '2024-09-22 14:30:05', N'Trần Minh Anh', 200, 'KHOAHOC', 0),
    ('20240921150010', N'Chương Trình Học Bổng', N'Thông tin về các chương trình học bổng mới.', 'chuong-trinh-hoc-bong.jpg', '2024-09-21 15:00:10', N'Dương Minh Tuấn', 160, 'KHOAHOC', 0),
    ('20240920121525', N'Tin Tức An Ninh', N'Tin tức về an ninh trật tự trong khu vực.', 'tin-tuc-an-ninh.jpg', '2024-09-20 12:15:25', N'Phạm Tấn Tú', 210, 'THOISU', 1),
    ('20240920183055', N'Tin Tức Mới Nhất', N'Tin tức mới nhất về các sự kiện nổi bật.', 'tin-tuc-moi-nhat.jpg', '2024-09-20 18:30:55', N'Nguyễn Thị Hoa', 190, 'KHOAHOC', 0),
    ('20240919093010', N'Tin Tức Sức Khỏe', N'Tin tức về sức khỏe và dinh dưỡng.', 'tin-tuc-suc-khoe.jpg', '2024-09-19 09:30:10', N'Ngô Tấn An', 250, 'KHOAHOC', 0),
    ('20240925182458', N'Khám Phá Thế Giới Ẩm Thực', N'Một hành trình khám phá những món ăn đặc sản của các vùng miền trên thế giới.', 'kham-pha-am-thuc.jpg', '2024-09-25 18:24:58', N'Nguyễn Trường', 425, 'XAHOI', 0);


INSERT INTO NEWSLETTERS (EMAIL, ENABLED)
VALUES
    ('ltman880425@gmail.com', 1),
    ('phamtu910301@gmail.com', 1),
    ('ngtho750915@gmail.com', 1),
    ('trmin850720@gmail.com', 1),
    ('ltnha940515@gmail.com', 0),
    ('ngtan820304@gmail.com', 1),
    ('dovan860830@gmail.com', 0),
    ('nthoa930621@gmail.com', 1),
    ('thanh800411@gmail.com', 1),
    ('ngtru780718@gmail.com', 0);

-----------------------------------------------------------------------------------------------------------------------
--SelectAll Categories: {CALL spCategoriesSelectAll}--
GO
CREATE PROCEDURE spCategoriesSelectAll
    AS BEGIN
SELECT * FROM CATEGORIES
END

--SelectByID Categories: {CALL spCategoriesByID(?)}--
GO
CREATE PROCEDURE spCategoriesSelectByID(
    @ID CHAR(14)
)
    AS BEGIN
SELECT * FROM CATEGORIES WHERE ID = @ID
END

--Thêm Categories: {CALL spCategoriesInsert(?, ?)}--
GO
CREATE PROCEDURE spCategoriesInsert(
    @ID CHAR(14),
    @NAME NVARCHAR(50)
)
    AS BEGIN
	INSERT INTO CATEGORIES VALUES (@ID, @NAME)
END

--Xóa Categories: {CALL spCategoriesDelete(?)}--
GO
CREATE PROCEDURE spCategoriesDelete(
    @ID CHAR(14)
)
    AS BEGIN
DELETE FROM CATEGORIES WHERE ID = @ID
END

--Sửa Categories: {CALL spCategoriesUpdate(?, ?)}--
GO
CREATE PROCEDURE spCategoriesUpdate(
    @ID CHAR(14),
    @NAME NVARCHAR(50)
)
    AS BEGIN
UPDATE CATEGORIES
SET NAME = @NAME
WHERE ID = @ID
END
-----------------------------------------------------------------------------------------------------------------------
--SelectAll News: {CALL spNewsSelectAll}--
GO
CREATE PROCEDURE spNewsSelectAll
    AS BEGIN
SELECT * FROM NEWS
END

--SelectByID News: {CALL spNewsByID(?)}--
GO
CREATE PROCEDURE spNewsSelectByID(
    @ID CHAR(14)
)
    AS BEGIN
SELECT * FROM NEWS WHERE ID = @ID
END

--Thêm News: {CALL spNewsInsert(?, ?, ?, ?, ?, ?, ?, ?, ?)}--
GO
CREATE PROCEDURE spNewsInsert(
    @ID CHAR(14),
    @TITLE NVARCHAR(255),
    @CONTENT NVARCHAR(MAX),
    @IMG VARCHAR(255),
    @POSTED_DATE DATE,
    @AUTHOR NVARCHAR(50),
    @VIEW_COUNT INT,
    @CATEGORIES_ID CHAR(14),
    @HOME BIT
)
    AS BEGIN
	INSERT INTO NEWS VALUES (
	@ID,
	@TITLE,
	@CONTENT,
	@IMG,
	@POSTED_DATE,
	@AUTHOR,
	@VIEW_COUNT,
	@CATEGORIES_ID,
	@HOME
)
END

--Xóa News: {CALL spNewsDelete(?)}--
GO
CREATE PROCEDURE spNewsDelete(
    @ID CHAR(14)
)
    AS BEGIN
DELETE FROM NEWS WHERE ID = @ID
END

--Sửa News: {CALL spNewsUpdate(?, ?, ?, ?, ?, ?, ?, ?, ?)}--
GO
CREATE PROCEDURE spNewsUpdate(
    @ID CHAR(14),
    @TITLE NVARCHAR(255),
    @CONTENT NVARCHAR(MAX),
    @IMG VARCHAR(255),
    @POSTED_DATE DATE,
    @AUTHOR NVARCHAR(50),
    @VIEW_COUNT INT,
    @CATEGORIES_ID CHAR(14),
    @HOME BIT
)
    AS BEGIN
UPDATE NEWS SET
                TITLE = @TITLE,
                CONTENT = @CONTENT,
                IMG = @IMG,
                POSTED_DATE = @POSTED_DATE,
                AUTHOR = @AUTHOR,
                VIEW_COUNT = @VIEW_COUNT,
                CATEGORIES_ID = @CATEGORIES_ID,
                HOME = @HOME
WHERE ID = @ID
END
-----------------------------------------------------------------------------------------------------------------------
--SelectAll Newsletters: {CALL spNewslettersSelectAll}--
GO
CREATE PROCEDURE spNewslettersSelectAll
    AS BEGIN
SELECT * FROM NEWSLETTERS
END

--SelectByID Newsletters: {CALL spNewslettersByEmail(?)}--
GO
CREATE PROCEDURE spNewslettersSelectByID(
    @EMAIL VARCHAR(50)
)
    AS BEGIN
SELECT * FROM NEWSLETTERS WHERE EMAIL = @EMAIL
END

--Thêm Newsletters: {CALL spNewsInsert(?, ?)}--
GO
CREATE PROCEDURE spNewslettersInsert(
    @EMAIL VARCHAR(50),
    @ENABLED BIT
)
    AS BEGIN
	INSERT INTO NEWSLETTERS VALUES (
	@EMAIL,
	@ENABLED
)
END

--Xóa Newslettes: {CALL spNewslettersDelete(?)}--
GO
CREATE PROCEDURE spNewslettersDelete(
    @EMAIL VARCHAR(50)
)
    AS BEGIN
DELETE FROM NEWSLETTERS WHERE EMAIL = @EMAIL
END

--Sửa Newsletters: {CALL spNewslettersUpdate(?, ?)}--
GO
CREATE PROCEDURE spNewslettersUpdate(
    @EMAIL VARCHAR(50),
    @ENABLED BIT
)
    AS BEGIN
UPDATE NEWSLETTERS SET
    ENABLED = @ENABLED
WHERE EMAIL = @EMAIL
END
-----------------------------------------------------------------------------------------------------------------------
--SelectAll Users: {CALL spUsersSelectAll}--
GO
CREATE PROCEDURE spUsersSelectAll
    AS BEGIN
SELECT * FROM USERS
END

--SelectByID Users: {CALL spUsersByID(?)}--
GO
CREATE PROCEDURE spUsersSelectByID(
    @ID CHAR(14)
)
    AS BEGIN
SELECT * FROM USERS WHERE ID = @ID
END

--Thêm Users: {CALL spUsersInsert(?, ?, ?, ?, ?, ?, ?, ?)}--
GO
CREATE PROCEDURE spUsersInsert(
    @ID CHAR(14),
    @PASSWORD VARCHAR(50),
    @FULLNAME VARCHAR(50),
    @BIRTHDAY DATE,
    @GENDER BIT,
    @MOBILE VARCHAR(10),
    @EMAIL VARCHAR(50),
    @ROLE BIT
)
    AS BEGIN
	INSERT INTO USERS VALUES (
	@ID,
	@PASSWORD,
	@FULLNAME,
	@BIRTHDAY,
	@GENDER,
	@MOBILE,
	@EMAIL,
	@ROLE
)
END

--Xóa Users: {CALL spUsersDelete(?)}--
GO
CREATE PROCEDURE spUsersDelete(
    @ID CHAR(14)
)
    AS BEGIN
DELETE FROM USERS WHERE ID = @ID
END

--Sửa Users: {CALL spUsersUpdate(?, ?, ?, ?, ?, ?, ?, ?)}--
GO
CREATE PROCEDURE spUsersUpdate(
    @ID CHAR(14),
    @PASSWORD VARCHAR(50),
    @FULLNAME VARCHAR(50),
    @BIRTHDAY DATE,
    @GENDER BIT,
    @MOBILE VARCHAR(10),
    @EMAIL VARCHAR(50),
    @ROLE BIT
)
    AS BEGIN
UPDATE USERS SET
                 PASSWORD = @PASSWORD,
                 FULLNAME = @FULLNAME,
                 BIRTHDAY = @BIRTHDAY,
                 GENDER = @GENDER,
                 MOBILE = @MOBILE,
                 EMAIL = @EMAIL,
                 ROLE = @ROLE
WHERE ID = @ID
END