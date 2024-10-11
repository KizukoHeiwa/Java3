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
	('GIAODUC', N'Giáo dục'),
	('XAHOI', N'Xã Hội');

INSERT INTO USERS (ID, PASSWORD, FULLNAME, BIRTHDAY, GENDER, MOBILE, EMAIL, ROLE)
VALUES
    ('ltman880425', '123', N'Lê Tấn Mạnh', '1988-04-25', 1, '0932345678', 'ltman880425@gmail.com', 1),
    ('phamtu910301', '123', N'Phạm Tấn Tú', '1991-03-01', 1, '0942345678', 'phamtu910301@gmail.com', 0),
    ('ngtho750915', '123', N'Nguyễn Thị Hồng', '1975-09-15', 0, '0952345678', 'ngtho750915@gmail.com', 0),
    ('trmin850720', '123', N'Trần Minh Anh', '1985-07-20', 1, '0962345678', 'trmin850720@gmail.com', 0),
    ('ltnha940515', '123', N'Lý Thị Nhã', '1994-05-15', 0, '0972345678', 'ltnha940515@gmail.com', 0),
    ('ngtan820304', '123', N'Ngô Tấn An', '1982-03-04', 1, '0982345678', 'ngtan820304@gmail.com', 0),
    ('dovan860830', '123', N'Doãn Văn Bình', '1986-08-30', 1, '0992345678', 'dovan860830@gmail.com', 0),
    ('nthoa930621', '123', N'Nguyễn Thị Hoa', '1993-06-21', 0, '0913456789', 'nthoa930621@gmail.com', 0),
    ('thanh800411', '123', N'Thái Anh Tuấn', '1980-04-11', 1, '0923456789', 'thanh800411@gmail.com', 1),
    ('ledinh990905', '123', N'Lê Đình Phúc', '1999-09-05', 0, '0933456789', 'ledinh990905@gmail.com', 0),
    ('trquo810727', '123', N'Trương Quốc Anh', '1981-07-27', 1, '0943456789', 'trquo810727@gmail.com', 1),
    ('phamtr900506', '123', N'Phạm Thị Trang', '1990-05-06', 0, '0953456789', 'phamtr900506@gmail.com', 0),
    ('hnthi990104', '123', N'Hoàng Nhật Thi', '1999-01-04', 0, '0963456789', 'hnthi990104@gmail.com', 0),
    ('ngtru780718', '123', N'Nguyễn Trường', '1978-07-18', 0, '0973456789', 'ngtru780718@gmail.com', 0),
    ('ddmin830514', '123', N'Dương Minh Tuấn', '1983-05-14', 1, '0983456789', 'ddmin830514@gmail.com', 0),
    ('hntan950912', '123', N'Hồ Ngọc Tân', '1995-09-12', 1, '0993456789', 'hntan950912@gmail.com', 0),
    ('tranth870313', '123', N'Tran Thị Cẩm', '1987-03-13', 0, '0914567890', 'tranth870313@gmail.com', 0),
    ('lttrang921224', '123', N'Lê Thị Trang', '1992-12-24', 0, '0924567890', 'lttrang921224@gmail.com', 0),
    ('tranho980905', '123', N'Trần Hoàng Nam', '1998-09-05', 1, '0901234567', 'tranho980905@gmail.com', 0),
    ('phamth920602', '123', N'Phạm Thị Kim', '1992-06-02', 0, '0912345678', 'phamth920602@gmail.com', 0);

INSERT INTO NEWS (ID, TITLE, CONTENT, IMG, POSTED_DATE, AUTHOR, VIEW_COUNT, CATEGORIES_ID, HOME)
VALUES
    ('20241010065300', N'Bộ trưởng Israel: Đòn đáp trả Iran sẽ "bất ngờ và chết chóc" ', N'Bộ trưởng Quốc phòng Israel Gallant tuyên bố đòn tấn công đáp trả của Tel Aviv đối với vụ tập kích của Iran sẽ "chết chóc, chính xác và bất ngờ". "Việc Iran tập kích tên lửa vào Israel ngày 1/10 là vụ tấn công hung hăng nhưng thất bại vì không trúng mục tiêu. Không quân Israel không chịu tổn thất, cũng không có binh sĩ hay dân thường nào bị thương", Bộ trưởng Quốc phòng Yoav Gallant nói trong chuyến thăm đơn vị tình báo 9900 của Lực lượng Phòng vệ Israel hôm 9/10. Đề cập về kế hoạch đáp trả của Israel, ông Gallant tuyên bố Iran "sẽ không hiểu chuyện gì đã xảy ra và xảy ra như thế nào" và toàn bộ các cấp chỉ huy ở Israel đều đang tập trung vào vấn đề này. Trong bài đăng trên mạng xã hội sau đó, ông nhấn mạnh "cuộc tấn công của chúng tôi vào Iran sẽ chết chóc, chính xác và bất ngờ". "Những kẻ cố gây tổn hại nhà nước Israel đều sẽ phải trả giá", Bộ trưởng Quốc phòng Israel cho hay. Iran hôm 1/10 phóng khoảng 200 tên lửa đạn đạo nhằm vào Israel để trả đũa cho cái chết của thủ lĩnh Hamas Ismail Haniyeh, thủ lĩnh Hezbollah Hassan Nasrallah và tướng Abbas Nilforoushan, chỉ huy thuộc Vệ binh Cách mạng Hồi giáo Iran. Đây là lần thứ hai Iran tấn công trực tiếp vào lãnh thổ Israel trong vòng 6 tháng, sau đợt tập kích bằng 300 tên lửa và máy bay không người lái hồi tháng 4. Tel Aviv tuyên bố sẽ trả đũa chiến dịch tấn công tên lửa của Tehran vào thời gian và địa điểm mà họ lựa chọn. Trong cuộc điện đàm giữa Tổng thống Mỹ Joe Biden và Thủ tướng Israel Benjamin Netanyahu hôm 9/10, hai lãnh đạo thống nhất sẽ duy trì liên lạc chặt chẽ khi Tel Aviv cân nhắc phản ứng với Iran. Ông Biden trước đó cảnh báo Israel không nhắm vào chương trình hạt nhân của Iran cũng như các cơ sở dầu mỏ nước này, vì sẽ khiến Tehran đáp trả quy mô lớn và đẩy giá dầu thô thế giới tăng vọt. William Burns, giám đốc Cơ quan Tình báo Trung ương Mỹ (CIA), ngày 7/10 cho hay Israel đang "cân nhắc rất kỹ lưỡng" phương án trả đũa Iran, khẳng định cả hai bên đều không muốn xung đột toàn diện nổ ra.', '20241010065300.jpg', '2024/10/10 06:53:00', N'Nguyễn Thị Hồng', 100, 'THOISU', 0),
    ('20241010060900', N'Chủ nhân giải Nobel: "Bám đuổi AI vì nghĩ rằng sẽ có lợi cho nhân loại"', N'Demis Hassabis chủ nhân giải Nobel Hóa học 2024 - nhà tiên phong trong những kỹ thuật trí tuệ nhân tạo (AI) nghĩ rằng "làm việc cả đời vì đây sẽ là công nghệ có lợi nhất đối với nhân loại". Hassabis sinh tại London, là con trai trong gia đình có bố là người Hy Lạp - Cyprus và mẹ là người Singapore. Ông bắt đầu chơi cờ vua khi mới 4 tuổi và trở thành kiện tướng năm 13 tuổi. "Đó là thứ đưa tôi đến với AI lúc đầu, chơi cờ từ khi còn nhỏ, suy nghĩ và tìm cách cải thiện quá trình tư duy của chính mình", học giả 48 tuổi chia sẻ với phóng viên sau khi đoạt giải Nobel Hóa học năm nay cùng với hai nhà khoa học khác hôm 9/10, theo AFP. Đây là giải Nobel thứ hai trong nhiều ngày qua liên quan tới trí tuệ nhân tạo (AI). Hassabis theo chân các học giả Nobel Vật lý cảnh báo công nghệ mà họ phát triển có thể "được sử dụng cho mục đích gây hại". Nhưng thay vì những cảnh báo u ám về AI, giám đốc điều hành phòng thí nghiệm DeepMind của Google mô tả bản thân như một người "lạc quan cẩn trọng". "Tôi đã làm việc cả đời vì cho rằng đây sẽ là công nghệ có lợi nhất đối với nhân loại, nhưng một thứ mạnh mẽ có tính cách mạng như vậy luôn đi kèm rủi ro", Hassabis nói. Ứng dụng hệ thống này các nhà sinh học có thể nghiên cứu để hiểu cách protein tương tác và hoạt động. Hơn thế nữa, thiết kế các protein mới, cho phép khám phá thuốc nhanh hơn, giải mã các biến thể gene gây bệnh. "AlphaFold được sử dụng bởi hơn hai triệu nhà nghiên cứu để thúc đẩy công trình quan trọng từ thiết kế enzyme tới phát hiện thuốc", Hassabis cho biết.', '20241010060900.jpg', '2024/10/10 06:09:00', N'Lý Thị Nhã', 150, 'KHOAHOC', 1),
    ('20241009224600', N'Huỳnh Như đưa TP HCM vào tứ kết giải nữ châu Á', N'Tiền đạo Huỳnh Như ghi bàn và kiến tạo giúp CLB TP HCM thắng Odisha 3-1 ở lượt hai bảng C AFC Champions League nữ 2024, tối 9/10. Đội bóng đến từ Ấn Độ Odisha lột xác so với thảm bại 0-17 trước Urawa Reds (Nhật Bản) ở lượt đầu. HLV Crispin Chettri tung vào sân đội hình tốt nhất, và chơi phòng ngự - phản công. TP HCM cũng thận trọng, khi tung những quân bài tốt nhất. Bên cạnh bộ ba ngoại binh, các cầu thủ lực như Thu Thảo, Huỳnh Như, Bảo Châu, Chương Kiều, Thùy Trang đều đá chính. Đội chủ nhà tấn công ồ ạt ngay sau tiếng còi khai cuộc và nhanh chóng tạo đột biến. Phút thứ nhất, từ quả phạt góc của Huỳnh Như, hậu vệ Nguyễn Thị Kim Yến bật cao đánh đầu mở tỷ số. Ở trận đấu trước đó, Urawa Reds thắng Taichung (Đài Loan) 2-0. Do đó, sau hai lượt, Urawa Reds và TP HCM đang dẫn đầu với sáu điểm nhưng đội chủ nhà xếp sau do thua hiệu số. Ở lượt cuối, hai đội gặp nhau để tranh ngôi nhất vào lúc 19h thứ Bảy ngày 12/10. "Hôm nay mặt sân đọng nước ảnh hưởng đến lối chơi sở trường của đội. Dù vậy, chúng tôi hài lòng với ba điểm. Bên cạnh đó, đối thủ cũng chơi rất ngoan cường, gây nhiều khó khăn cho chúng tôi nhưng rất mừng vì không có ai chấn thương", HLV Hồng Phẩm nói sau trận. Năm nay, AFC Champions League nữ lần đầu được tổ chức với 12 đội, chia ba bảng thi đấu vòng tròn một lượt. Đội đứng nhất và nhì ở mỗi bảng, cùng hai đội xếp thứ ba có thành tích tốt nhất vào tứ kết. Ở tứ kết, giải tiếp tục bốc thăm, trong đó đội có thứ hạng cao hơn trong cặp đấu sẽ được đá sân nhà. Từ bán kết, giải đá tập trung tại một địa điểm để chọn ra nhà vô địch. Đội vô địch nhận một triệu USD, á quân 500.000 USD.', '20241009224600.jpg', '2024/10/09 22:46:00', N'Phạm Tấn Tú', 200, 'THETHAO', 0),
    ('20241009114500', N'Imagine Dragons lưu diễn TP HCM', N'Ban nhạc rock Imagine Dragons sẽ trình diễn loạt hit ở nhạc hội quốc tế 8Wonder Winter 2024, TP HCM, ngày 8/12, trong lần đầu đến Việt Nam. Đại diện đơn vị tổ chức show - VinWonders - xác nhận nhóm nhạc Mỹ sẽ góp mặt trong đêm nhạc 8Wonder "phiên bản supershow", ở đại đô thị Vinhomes Grand Park. Nhóm chưa tiết lộ tiết mục sẽ trình diễn vì muốn tạo bất ngờ cho khán giả. Chuyến lưu diễn TP HCM đánh dấu lần đầu Imagine Dragons đến Việt Nam. Tay guitar Wayne Sermon, giọng ca chính kiêm trưởng nhóm Dan Reynolds và nghệ sĩ bass Ben McKee nói háo hức gặp khán giả Việt. Trước đó, họ từng thực hiện liveshow ở nhiều thành phố lớn châu Á như Tokyo (Nhật Bản), Thượng Hải (Trung Quốc), Singapore, Kuala Lumpur (Malaysia), Bangkok (Thái Lan), hút hàng chục nghìn người mỗi đêm diễn.', '20241009114500.jpg', '2024/10/09 11:45:00', N'Ngô Tấn An', 250, 'VANHOA', 1),
    ('20241010060000', N'Hành trình trở về nguồn cội của cô gái Pháp gốc Việt ', N'Naomi Armel, tên khai sinh Phạm Thị Hòa không có ký ức về Việt Nam nhưng nhớ như in khung cảnh khắp nơi tuyết trắng của mùa đông 1996 trong ngày đầu đến Pháp. Nhưng hôm đó cô bé bỗng nhiên biến mất. Ông Bertrand và bà Martine tìm khắp ngôi nhà ở Toulouse mới thấy con gái nằm ngủ dưới gầm bàn ngoài trời, trên nền sỏi. Cô bé mới gần 2 tuổi, được cặp vợ chồng nhận nuôi từ một trại trẻ mồ côi ở Việt Nam. Những ngày đầu mới về, bé gái không quen nằm chăn đệm, không biết tắm bồn, mặc đồ đủ ấm. "Tôi vẫn giữ thói quen giấu đồ ăn vì sợ hết phần", Naomi Armel kể. Cô bé gốc Việt lớn lên trong tình yêu của cha mẹ nuôi và hai anh trai. Từ bé, Naomi đã luôn xuất sắc trong học tập và có năng khiếu ở nhiều môn nghệ thuật ghi dấu trong nhiều cuộc thi khiêu vũ và sắc đẹp trẻ em. Bản tính tò mò thôi thúc cô bé khám phá mọi thứ. Sâu xa hơn cô muốn chứng minh bố mẹ không phải hối tiếc vì nhận nuôi mình. "Tôi sợ bị bỏ rơi lần nữa", Naomi giải thích. Bản tính tò mò thôi thúc cô bé khám phá mọi thứ. Sâu xa hơn cô muốn chứng minh bố mẹ không phải hối tiếc vì nhận nuôi mình. "Tôi sợ bị bỏ rơi lần nữa", Naomi giải thích. Trong bức thư gửi mẹ trước ngày đoàn tụ, Phạm Thị Hòa đã tóm tắt hành trình tìm lại gia đình và bày tỏ mong muốn cùng mọi người "vẽ lên một trang giấy trắng mới". Cô dự định dành nhiều thời gian trong tương lai để khám phá Việt Nam, tổ chức các hoạt động từ thiện và trở thành cầu nối giữa quê hương với các thương hiệu thời trang Pháp. "Bố mẹ nuôi sắp nghỉ hưu và ý tưởng đưa hai gia đình xích lại gần nhau khiến tôi tràn ngập niềm vui", Hòa chia sẻ. "Từ nay tôi đã có thể bắt đầu hành trình chữa lành cho mình", người con gái thứ tư ở làng Hiên Vân, Bắc Ninh nói.', '20241010060000.jpg', '2024/10/10 06:00:00', N'Doãn Văn Bình', 300, 'XAHOI', 1),
    ('20241010065100', N'Học phí 10 đại học tốt nhất thế giới 2025', N'Các đại học Mỹ và Anh thống trị top 10 bảng xếp hạng thế giới 2025 của THE, với học phí cao nhất lên tới 88.000 USD mỗi năm. Tổ chức xếp hạng Times Higher Education (THE) công bố bảng xếp hạng đại học tốt nhất thế giới năm 2025, ngày 9/10.  Đại học Oxford, Anh, lần thứ 9 liên tiếp đứng đầu. Theo sau là Viện Công nghệ Massachusetts (MIT), Mỹ, thay vị trí năm ngoái của Đại học Stanford. Các gương mặt còn lại đều là những cái tên quen thuộc ở hai quốc gia này, lần lượt là Đại học Harvard, Princeton, Cambridge, Stanford, Viện công nghệ CalTech, California Berkeley, Hoàng gia London và Đại học Yale. Về học phí, năm học 2024-2025, các trường của Anh thu khoảng 33.000-88.000 USD (810 triệu - 2,1 tỷ đồng), tùy ngành học của sinh viên. Mức cao nhất thuộc về ngành Y khoa ở Đại học Cambridge. Trong khi đó, học phí các đại học Mỹ trong top 10 ở mức hơn 56.000-67.000 USD, đắt nhất là Đại học Yale. Sau khi cộng các khoản khác như ăn uống, thuê nhà, mua sách vở và đồ dùng học tập..., số tiền có thể lên 70.000-90.000 USD (tương đương 1,7-2,2 tỷ đồng). Trong 9 trường của Việt Nam được xếp hạng đợt này, Đại học Kinh tế TP HCM dẫn đầu, ở nhóm 501-600. Tiếp đến là Đại học Duy Tân và Tôn Đức Thắng, hạng 601-800. Đại học Y Hà Nội trong nhóm 801-1000, Đại học Quốc gia Hà Nội và Mở TP HCM thuộc nhóm 1201-1500. Còn lại, Đại học Bách khoa Hà Nội, Đại học Huế, Quốc gia TP HCM được xếp vào nhóm 1500+.', '20241010065100.jpg', '2024/10/10 06:51:00', N'Nguyễn Trường', 180, 'GIAODUC', 0),
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

--SelectAllIdDesc News: {CALL spNewsSelectAllDesc}
GO
CREATE PROCEDURE spNewsSelectAllDesc
    AS BEGIN
SELECT * FROM NEWS ORDER BY ID DESC
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

--Thêm Newsletters: {CALL spNewslettersInsert(?, ?)}--
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
-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM NEWS WHERE HOME = 1;

SELECT * FROM NEWS WHERE ID = '20240919093010';

INSERT INTO NEWS VALUES
    (FORMAT(GETDATE(), 'yyyyMMddhhmmss'),N'TIN TUC TEST', N'CONTENT TEST', 'IMGTEST', FORMAT(GETDATE(), 'yyyy-MM-dd'), N'AUTHOR TEST', 100, 'THOISU', 0)

DELETE FROM NEWS WHERE ID = ''

SELECT TOP (3) * FROM NEWS ORDER BY VIEW_COUNT DESC;

--SELECT TOP (3) * FROM NEWS ORDER BY ID DESC;
SELECT TOP (3) * FROM NEWS ORDER BY POSTED_DATE DESC;

SELECT N.*
FROM NEWS N, USERS U
WHERE AUTHOR = FULLNAME
  AND AUTHOR = N'Ngô Tấn An';