-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2024 lúc 05:39 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `greeny_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_image`, `category_name`) VALUES
(4, NULL, 'Rau củ quả'),
(5, NULL, 'Trái cây'),
(6, NULL, 'Củ quả'),
(11, NULL, 'Hạt dinh dưỡng'),
(12, NULL, 'Đặt sản vùng miền'),
(14, NULL, 'Nước từ trái cây');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `ward` varchar(100) DEFAULT NULL,
  `payment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `producer` varchar(255) DEFAULT NULL,
  `txn_hash` varchar(255) DEFAULT NULL,
  `favorite` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `description`, `discount`, `entered_date`, `price`, `product_image`, `product_name`, `quantity`, `status`, `category_id`, `exp_date`, `mfg_date`, `producer`, `txn_hash`, `favorite`) VALUES
(149, 'An Phú Farm tự hào là đơn vị cung cấp ớt chuông xanh đạt tiêu chuẩn chất lượng cao, đáp ứng mọi nhu cầu sử dụng của khách hàng. Sản phẩm của chúng tôi được canh tác theo quy trình nông nghiệp sạch, đảm bảo an toàn thực phẩm, giữ được hương vị tự nhiên và giá trị dinh dưỡng tối ưu.\r\nĐặc điểm nổi bật của ớt chuông xanh An Phú Farm\r\nNguồn gốc rõ ràng: Sản phẩm được trồng tại các trang trại đạt tiêu chuẩn VietGAP/GlobalGAP, có hệ thống giám sát chặt chẽ.\r\nChất lượng ổn định: Ớt chuông xanh của chúng tôi có kích thước đồng đều, vỏ bong, màu xanh tươi và giòn tự nhiên.\r\nCanh tác bền vững: Quy trình canh tác thân thiện với môi trường, sử dụng phân tích cơ sở hữu ích và chế độ tối đa hóa chất độc hại.\r\nSẵn sàng truy cập nguồn gốc: Mỗi lô hàng đều có mã QR để khách hàng dễ dàng kiểm tra thông tin về nơi sản xuất và mục tiêu.', 0, '2024-12-21 00:00:00', 120000, '01.jpg', 'Ớt chuông ', 20, b'1', 4, '2024-12-31', '2024-12-15', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0x0fd047a1d8cfe24286a28a032fc3420a4c7655769de76d5a8f77503941ed856a', b'0'),
(150, 'Súp lơ trắng, hay còn gọi là bông cải trắng, là một loại rau thuộc họ cải (Brassicaceae), có hình dáng tròn với phần đầu hoa đặc trưng, màu trắng kem. Đây là loại thực phẩm không chỉ phổ biến trong các bữa ăn hàng ngày mà còn được đánh giá cao về giá trị dinh dưỡng và lợi ích sức khỏe.\r\nSúp lơ trắng nên được bảo quản ở nhiệt độ từ 1-4°C trong ngăn mát tủ lạnh. Để giữ được độ tươi ngon lâu hơn, bạn có thể bọc súp lơ bằng màng bọc thực phẩm hoặc túi giấy, tránh để nơi ẩm ướt hoặc ánh sáng trực tiếp. Thời gian bảo quản tốt nhất là từ 4-5 tuần.', 5, '2024-12-21 00:00:00', 100000, 'suplotrang.jpg', 'Súp lơ trắng', 10, b'0', 4, '2025-01-21', '2024-12-19', 'Nông trại gia đình', '0x8b85a89dfc98149b748acbeb4c03515684d3a779972ab189939c9529081bf74f', b'0'),
(151, 'Súp lơ xanh, hay còn gọi là bông cải trắng, là một loại rau thuộc họ cải (Brassicaceae), có hình dáng tròn với phần đầu hoa đặc trưng, màu trắng kem. Đây là loại thực phẩm không chỉ phổ biến trong các bữa ăn hàng ngày mà còn được đánh giá cao về giá trị dinh dưỡng và lợi ích sức khỏe.\r\nSúp lơ xanh nên được bảo quản ở nhiệt độ từ 1-4°C trong ngăn mát tủ lạnh. Để giữ được độ tươi ngon lâu hơn, bạn có thể bọc súp lơ bằng màng bọc thực phẩm hoặc túi giấy, tránh để nơi ẩm ướt hoặc ánh sáng trực tiếp. Thời gian bảo quản tốt nhất là từ 4-5 tuần.', 0, '2024-12-21 00:00:00', 80000, 'suploxanh.jpg', 'Súp lơ xanh', 25, b'0', 4, '2025-02-14', '2024-12-20', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0x7aeca2332ae8ee4622ce74e2990200dfffd3223a8e56ce4308c5ebfed88dd42f', b'0'),
(152, 'Quả vú sữa, hay còn gọi là quả mận, là một loại trái cây nhiệt đới thuộc họ Sapotaceae, có hình dáng tròn hoặc hơi bầu dục, vỏ mịn, màu sắc thay đổi từ xanh sang tím nhạt khi chín. Khi cắt ra, quả vú sữa có lớp thịt trắng ngọc, mềm mịn và vị ngọt thanh, beo béo, rất được yêu thích trong các món tráng miệng hoặc ăn tươi.\r\n\r\nVú sữa nên được bảo quản ở nhiệt độ từ 10-15°C, trong môi trường thoáng mát, khô ráo để giữ được độ tươi ngon. Bạn có thể bọc quả vú sữa trong giấy báo hoặc để vào túi lưới để tránh bị dập nát. Trái cây này có thể bảo quản trong khoảng 1-2 tuần tùy vào độ chín.', 0, '2024-12-21 00:00:00', 60000, 'quavusua.jpg', 'Quả vú sữa', 30, b'0', 4, '2025-01-10', '2024-12-20', 'Nông trại gia đình', '0xe780460cf62c050f878807715df3b4487bf868e61d15bc7e7de559f5f794a7cf', b'0'),
(153, '\r\nSa chi, hay còn gọi là quả sa chi, là một loại trái cây nhiệt đới thuộc họ Annonaceae, có hình dáng giống quả trứng, vỏ ngoài màu xanh sáng khi còn non và chuyển sang màu vàng hoặc cam khi chín. Quả sa chi có thịt bên trong mềm, màu vàng tươi, với vị ngọt thanh mát và hương thơm đặc trưng.\r\n\r\nSa chi nên được bảo quản ở nhiệt độ từ 10-15°C trong môi trường thoáng mát, tránh ánh sáng trực tiếp và độ ẩm cao để giữ độ tươi ngon. Quả sa chi có thể bảo quản trong khoảng 1-2 tuần, tùy vào độ chín của quả. Để giữ được chất lượng tốt nhất, bạn có thể bọc quả sa chi trong giấy báo hoặc túi lưới, tránh làm dập nát quả.', 1, '2024-12-21 00:00:00', 60000, 'sa_chi.jpg', 'Sa chi', 10, b'0', 5, '2025-01-10', '2024-12-20', 'Nông trại gia đình', '0x73b91479b385b9a243deb0b50a74eb354218f92dd52fa88857773ef4bf8b6c2e', b'0'),
(154, '\r\nRau xà lách, hay còn gọi là rau diếp, là một loại rau lá xanh thuộc họ Cúc (Asteraceae), có lá mềm mịn, màu xanh nhạt hoặc đỏ tùy loại. Rau xà lách thường được sử dụng trong các món salad, sandwich, hoặc trang trí món ăn nhờ vào độ giòn và hương vị nhẹ nhàng.\r\n\r\nRau xà lách nên được bảo quản ở nhiệt độ từ 1-4°C trong ngăn mát tủ lạnh. Để giữ độ tươi ngon lâu hơn, bạn có thể bọc rau xà lách bằng màng bọc thực phẩm hoặc cho vào túi zip kín, tránh để nơi ẩm ướt hoặc ánh sáng trực tiếp. Thời gian bảo quản tốt nhất là từ 3-5 ngày. Đối với các loại rau xà lách có lá giòn như xà lách Romaine, bạn có thể giữ lá tươi lâu hơn bằng cách cắt gốc và cho vào bát nước lạnh trong tủ lạnh.', 0, '2024-12-21 00:00:00', 25000, 'rauxalach.jpg', 'Rau xà lách', 15, NULL, 4, '2025-01-07', '2024-12-19', 'Nông trại gia đình', '0x1204232a7bc1b7e4489a23900094d91284dd74478611746291273761df05e5c0', b'0'),
(155, '\r\nRau má, một loại rau thuộc họ Rau má (Apiaceae), là một loại rau xanh có hình dáng nhỏ gọn với lá tròn, mọc thành cụm. Rau má có màu xanh đậm, hương vị hơi đắng và thường được sử dụng trong các món ăn, nước giải khát hoặc làm thuốc dân gian nhờ vào các lợi ích sức khỏe nổi bật.\r\n\r\nRau má nên được bảo quản ở nhiệt độ từ 1-4°C trong ngăn mát tủ lạnh để giữ độ tươi lâu. Bạn có thể bọc rau má trong màng bọc thực phẩm hoặc cho vào túi zip kín, tránh tiếp xúc với không khí quá lâu để hạn chế rau bị héo. Thời gian bảo quản tốt nhất là từ 3-5 ngày. Nếu muốn giữ rau tươi lâu hơn, bạn có thể cắt bỏ phần gốc và ngâm phần lá trong nước lạnh trong tủ lạnh, giúp rau má giữ được độ tươi ngon.', 0, '2024-12-21 00:00:00', 30000, 'rauma.jpg', 'Rau má', 5, NULL, 4, '2025-01-08', '2024-12-20', 'Trang trại family', '0xfe6d64c6d7b626ac1f17ebb7fc4197c6d1f3858c928d416622003bcbbe26e9ea', b'0'),
(156, 'Rau ngò rí, hay còn gọi là rau mùi, là một loại rau gia vị thuộc họ Apiaceae, có lá nhỏ, mảnh, màu xanh tươi, và mùi thơm đặc trưng. Rau ngò rí thường được dùng để gia vị cho các món ăn, làm tăng hương vị và mùi thơm cho các món canh, món xào, salad, hay nước chấm.\r\n\r\nRau ngò rí nên được bảo quản ở nhiệt độ từ 1-4°C trong ngăn mát tủ lạnh để giữ được độ tươi ngon. Để bảo quản rau lâu hơn, bạn có thể bọc rau trong màng bọc thực phẩm hoặc để trong túi zip kín. Thời gian bảo quản tốt nhất là khoảng 5-7 ngày. Nếu rau ngò rí đã héo, bạn có thể cắt phần gốc và ngâm phần lá trong nước lạnh để phục hồi độ tươi.', 0, '2024-12-21 00:00:00', 20000, 'raungori.jpg', 'Rau ngò rí', 5, NULL, 4, NULL, '2024-12-21', 'Nông trại gia đình', '0x6b2900df95ed551274b1bee8bbf644056125d77e994ed1e78e4a997b677d0fbc', b'0'),
(157, 'Rau dền An Phú Farm là sản phẩm rau sạch, được trồng tại trang trại An Phú với quy trình canh tác hữu cơ, không sử dụng hóa chất. Rau dền tại đây được chăm sóc kỹ lưỡng, từ chuẩn bị đất, gieo hạt, đến thu hoạch, đảm bảo tươi ngon và an toàn cho sức khỏe. Rau dền An Phú giàu vitamin A, C, sắt và canxi, giúp giải nhiệt, thanh mát cơ thể, và hỗ trợ tiêu hóa.\r\nĐể bảo quản, rau dền nên được giữ trong ngăn mát tủ lạnh, bọc trong màng bọc thực phẩm hoặc túi zip kín để giữ độ tươi lâu. Rau dền An Phú là lựa chọn tuyệt vời cho các món canh, xào hoặc salad, mang đến hương vị thơm ngon và giá trị dinh dưỡng cao.', 0, '2024-12-21 00:00:00', 17000, 'rauden.jpg', 'Rau dền', 3, NULL, 4, '2025-01-09', '2024-12-21', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0xf34b66719cea3bc0bee072782f20037ce7e7e0619286a2bc4efaed42ec73d1c5', b'0'),
(158, 'Chuối lùn là một giống chuối đặc biệt, có cây thấp và trái nhỏ, thường được biết đến với hương vị ngọt ngào và độ mềm dẻo. Loại chuối này thường được trồng tại các khu vực nhiệt đới, với điều kiện khí hậu ấm áp và đất đai tơi xốp. Chuối lùn có vỏ mỏng, khi chín có màu vàng sáng, và rất thích hợp để ăn trực tiếp hoặc chế biến thành các món ăn nhẹ, bánh hoặc sinh tố.\r\n\r\nĐể bảo quản chuối lùn, bạn nên để chuối ở nhiệt độ phòng, tránh ánh sáng trực tiếp và độ ẩm cao. Chuối lùn có thể để được từ 3-5 ngày ở nhiệt độ phòng trước khi chín hoàn toàn. Khi chuối chín, nếu không sử dụng ngay, có thể bảo quản trong ngăn mát tủ lạnh để giữ được độ tươi lâu hơn.', 0, '2024-12-21 00:00:00', 30000, '18.jpg', 'Chuối lùn', 10, NULL, 5, '2024-12-21', '2024-12-20', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0xcef106c9d4c613a57e0bca3b5ba4088a184b74971e6c32da03f33878e96c5a2b', b'0'),
(159, 'Nước trái cây vị cam là một loại nước uống phổ biến được làm từ nước cam tươi, mang lại hương vị ngọt ngào và chua nhẹ đặc trưng của cam. Nước cam không chỉ thơm ngon mà còn rất bổ dưỡng, giàu vitamin C, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa và làm đẹp da.\r\nNước cam có thể được thưởng thức ngay khi ép tươi hoặc được chế biến sẵn để sử dụng lâu dài. Để bảo quản nước cam, bạn nên giữ trong tủ lạnh và sử dụng trong vòng 2-3 ngày để đảm bảo độ tươi ngon. Nếu mua nước cam đóng hộp, nên kiểm tra hạn sử dụng và bảo quản theo hướng dẫn trên bao bì. Nước cam là lựa chọn tuyệt vời để giải khát, đặc biệt trong những ngày hè nóng bức.', 5, '2024-12-21 00:00:00', 120000, 'product-11.jpg', 'Nước trái cây vị cam', 2, NULL, 14, '2025-01-11', '2024-12-19', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0x8dce457386e716bcf67f826d0aaa4add25520620afbfcf460afe4ee14dc927c7', b'0'),
(160, 'Nước trái cây vị cam là một loại nước uống phổ biến được làm từ nước cam tươi, mang lại hương vị ngọt ngào và chua nhẹ đặc trưng của cam. Nước cam không chỉ thơm ngon mà còn rất bổ dưỡng, giàu vitamin C, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa và làm đẹp da.\r\n\r\nNước cam có thể được thưởng thức ngay khi ép tươi hoặc được chế biến sẵn để sử dụng lâu dài. Để bảo quản nước cam, bạn nên giữ trong tủ lạnh và sử dụng trong vòng 2-3 ngày để đảm bảo độ tươi ngon. Nếu mua nước cam đóng hộp, nên kiểm tra hạn sử dụng và bảo quản theo hướng dẫn trên bao bì. Nước cam là lựa chọn tuyệt vời để giải khát, đặc biệt trong những ngày hè nóng bức.', 15, '2024-12-21 00:00:00', 90000, 'pd-3.jpg', 'Nước trái cây cà chua', 10, NULL, 14, NULL, '2024-12-21', 'Công ty cổ phần ABC', '0xd8e6e1a3dfa178622d6437aea8d4affe55bd0eaf79fd80706e7872825b7ec1ff', b'0'),
(161, '\r\nHạt sen từ Nông trại An Hòa là sản phẩm hạt sen tươi và sạch, được trồng tại các ao hồ tự nhiên với quy trình canh tác an toàn, không sử dụng hóa chất. Nông trại An Hòa chú trọng chăm sóc từng cây sen, từ việc chăm sóc cây giống đến thu hoạch hạt sen, đảm bảo sản phẩm đạt chất lượng cao và an toàn cho sức khỏe người tiêu dùng.\r\n\r\nHạt sen An Hòa không chỉ giàu dinh dưỡng mà còn có tác dụng an thần, bổ tim, cải thiện giấc ngủ và làm đẹp da. Hạt sen từ nông trại An Hòa được thu hoạch và xử lý nhanh chóng, giữ nguyên hàm lượng dinh dưỡng và độ tươi ngon.\r\nĐể bảo quản, hạt sen tươi từ Nông trại An Hòa nên được bảo quản trong ngăn mát tủ lạnh và sử dụng trong vài ngày. Hạt sen khô có thể bảo quản trong các bao bì kín, để nơi khô ráo và thoáng mát, dùng được lâu dài. Hạt sen An Hòa là lựa chọn lý tưởng cho các món chè, súp hay các món ăn bổ dưỡng khác.', 10, '2024-12-21 00:00:00', 180000, 'hatsen.jpg', 'Hạt sen', 15, NULL, 11, NULL, '2024-12-20', ' Nông trại An Hòa ', '0xea6f595bb6063f4ff59cee6132263790244ddf2c6d13259f8cfe078f5f966285', b'0'),
(162, 'Quả hạch khô từ Nông trại Phước An là sản phẩm hạch khô chất lượng cao, được trồng và chế biến tại nông trại Phước An, nơi áp dụng quy trình canh tác bền vững và không sử dụng hóa chất. Nông trại Phước An chuyên trồng các loại hạt như hạnh nhân, óc chó và hạt điều, được chăm sóc kỹ lưỡng từ khâu gieo trồng đến thu hoạch, đảm bảo hạt luôn tươi ngon và bổ dưỡng.\r\nQuả hạch khô từ Nông trại Phước An không chỉ ngon mà còn giàu dinh dưỡng, cung cấp các vitamin, khoáng chất, protein và chất béo lành mạnh giúp duy trì sức khỏe tim mạch, cải thiện trí nhớ và cung cấp năng lượng dồi dào cho cơ thể.\r\nĐể bảo quản, quả hạch khô từ Nông trại Phước An nên được giữ ở nơi khô ráo, thoáng mát và trong bao bì kín. Sản phẩm có thể bảo quản lâu dài mà không mất đi giá trị dinh dưỡng. Quả hạch khô Phước An là lựa chọn tuyệt vời cho các món ăn vặt, salad, hoặc sử dụng trong nấu ăn để tăng thêm hương vị và chất dinh dưỡng.', 1, '2024-12-21 00:00:00', 150000, 'qua-hach-kho.jpg', 'Quả hạch khô', 10, NULL, 11, NULL, '2024-12-21', 'An Phú Farm - Nguồn Cung Ổn Định và Chất Lượng', '0xe2f02ee56325d9a9d5a99ed97aea38d6f7d3f82afb9fcfe54c2f641618ac72b3', b'0'),
(163, 'Cơm cháy từ Nông trại Bảo Lộc là sản phẩm đặc biệt được chế biến từ gạo sạch, đảm bảo không sử dụng hóa chất trong quá trình trồng. Gạo được lựa chọn kỹ càng, nấu chín, sau đó đem chiên giòn để tạo thành cơm cháy có hương vị thơm ngon và giòn rụm. Để gia tăng hương vị, cơm cháy Nông trại Bảo Lộc thường được tẩm ướp gia vị nhẹ nhàng, phù hợp với khẩu vị của mọi người.\r\nĐể bảo quản cơm cháy, bạn nên giữ sản phẩm trong bao bì kín hoặc hộp đựng kín, tránh ẩm để cơm cháy luôn giữ được độ giòn và tươi ngon. Cơm cháy từ Nông trại Bảo Lộc là lựa chọn tuyệt vời cho các món ăn vặt hoặc dùng làm món khai vị trong các bữa tiệc.', 20, '2024-12-21 00:00:00', 250000, 'comchay.jpg', 'Cơm cháy', 10, NULL, 12, '2025-01-16', '2024-12-19', ' Nông trại Bảo Lộc', '0x51ef6efbbf03ad6e0ce5edfb4a2281955be008b915d02c0982b49e7e51708d32', b'0'),
(165, 'Thịt trâu gác bếp là một món đặc sản nổi tiếng của vùng núi phía Bắc Việt Nam, đặc biệt là của dân tộc Thái. Thịt trâu được chọn lọc kỹ lưỡng, sau đó được tẩm ướp gia vị như hạt tiêu, tỏi, ớt, và một số gia vị đặc trưng rồi treo lên gác bếp để sấy khô. Quá trình chế biến này giúp thịt trâu có hương vị đậm đà, thơm ngon, và giữ được lâu, phù hợp để ăn trong các bữa tiệc hoặc làm quà biếu.\r\nThịt trâu gác bếp từ Nông trại Sơn Hà là sản phẩm được chế biến từ những con trâu khỏe mạnh, nuôi thả tự nhiên trong môi trường sạch, không sử dụng thuốc tăng trưởng hay hóa chất. Thịt trâu sau khi được chọn lọc và thái miếng vừa phải, được tẩm ướp theo công thức gia truyền, sau đó sấy khô trên bếp lửa, giữ được hương vị tự nhiên, thơm ngon đặc trưng của thịt trâu.', 5, '2024-12-21 00:00:00', 777777, 'thit-trau.jpg', 'Thịt trâu gác bếp', 15, NULL, 12, '2025-02-14', '2024-12-19', 'Nông trại Sơn Hà ', '0x8e952432e718eed2839a72c16629d43d5a05b4229530b68da9e1f8b6ba157b1d', b'0'),
(166, 'Xoài từ Nông trại Thiên An là sản phẩm xoài sạch, được trồng và chăm sóc tại nông trại có quy trình canh tác hữu cơ, không sử dụng hóa chất độc hại. Xoài Thiên An được thu hoạch khi trái đã chín vàng, với hương thơm tự nhiên và thịt quả ngọt, mềm, dễ dàng chế biến thành các món ăn như sinh tố xoài, xoài lắc, hoặc dùng làm topping cho các món tráng miệng.\r\nĐể bảo quản xoài, bạn có thể để xoài ở nhiệt độ phòng cho đến khi chín, sau đó chuyển vào tủ lạnh để bảo quản lâu hơn. Xoài chín có thể bảo quản trong ngăn mát tủ lạnh từ 2-3 ngày để giữ độ tươi ngon.', 0, '2024-12-21 00:00:00', 70000, 'pd-4.jpg', 'Xoài  ', 10, NULL, 5, NULL, '2024-12-20', 'Nông trại Thiên An ', '0xd606853b6e604641e29b5fac236858bfa5e56f12cb35a4957f7c1e1f4267760d', b'0'),
(167, 'Cà rốt là một loại rau củ phổ biến, có màu cam tươi sáng và hương vị ngọt nhẹ. Cà rốt chứa nhiều vitamin A, beta-carotene, và các khoáng chất như kali, giúp cải thiện sức khỏe mắt, tăng cường hệ miễn dịch và làm đẹp da. Ngoài ra, cà rốt còn giúp hỗ trợ tiêu hóa và có tác dụng chống oxy hóa.\r\nCà rốt từ Nông trại Xanh Tươi là sản phẩm cà rốt sạch, được trồng và chăm sóc tại nông trại với quy trình canh tác hữu cơ, không sử dụng thuốc trừ sâu hay hóa chất độc hại. Cà rốt tại Nông trại Xanh Tươi luôn tươi ngon, giòn, và ngọt tự nhiên, phù hợp để chế biến thành các món salad, súp, hoặc ăn sống như một món ăn vặt bổ dưỡng.\r\nĐể bảo quản cà rốt, bạn nên cắt bỏ phần lá và giữ chúng trong ngăn mát tủ lạnh. Cà rốt có thể bảo quản được lâu trong môi trường lạnh, giữ độ tươi ngon và giòn trong khoảng 1-2 tuần.', 0, '2024-12-21 00:00:00', 45000, '02.jpg', 'Cà rốt', 20, NULL, 4, '2025-01-08', '2024-12-21', 'Nông trại Xanh Tươi', '0x2e9b975bcaeb3dedb9ca1324ccafb579774c70823e32479bd87aadf4ec129ec7', b'0'),
(168, 'Ớt chuông xanh là một loại rau quả thuộc họ cà, có hình dáng giống như quả chuông với màu sắc xanh tươi đặc trưng khi chưa chín. Ớt chuông xanh có vị hơi đắng và giòn, ít cay so với các loại ớt khác, thường được dùng trong các món xào, salad, hoặc làm nhân cho các món ăn như bánh tráng hoặc pizza. Ớt chuông xanh rất giàu vitamin C, vitamin A, và chất xơ, giúp tăng cường hệ miễn dịch và hỗ trợ sức khỏe tim mạch.\r\nỚt chuông xanh từ Nông trại Hoa Lúa là sản phẩm sạch, được trồng theo quy trình canh tác hữu cơ tại nông trại, không sử dụng thuốc trừ sâu hay hóa chất. Ớt chuông xanh tại Nông trại Hoa Lúa luôn tươi ngon, giòn, và giữ được hương vị tự nhiên, là nguyên liệu lý tưởng cho các món ăn thêm phần hấp dẫn và bổ dưỡng.\r\nĐể bảo quản ớt chuông xanh, bạn nên để chúng trong ngăn mát tủ lạnh, nơi khô ráo và thoáng mát. Ớt chuông có thể giữ tươi trong khoảng 1-2 tuần nếu bảo quản đúng cách.', 1, '2024-12-21 00:00:00', 40000, '01.jpg', 'Ớt chuông xanh', 10, NULL, 4, NULL, '2024-12-21', 'Nông trại Hoa Lúa', '0x30cd1d05a960f6344e3c9efccc14ce31543667e45c821365b17e6d0571f68cac', b'0'),
(169, 'Dưa chuột là một loại rau quả phổ biến, có vỏ mỏng, thịt quả giòn và mọng nước. Dưa chuột có vị mát, thanh, thường được sử dụng trong các món salad, làm gia vị cho các món ăn, hoặc dùng để uống nước ép. Dưa chuột chứa nhiều nước, vitamin C và các khoáng chất như kali, giúp giải nhiệt, duy trì độ ẩm cho làn da và hỗ trợ tiêu hóa.\r\n\r\nDưa chuột từ Nông trại Lộc An là sản phẩm sạch, được trồng theo quy trình canh tác hữu cơ tại nông trại, không sử dụng hóa chất hay thuốc trừ sâu. Dưa chuột Lộc An luôn tươi ngon, giòn và có vị ngọt thanh tự nhiên, rất thích hợp để chế biến các món ăn nhẹ hoặc dùng làm thức uống giải khát.\r\n\r\nĐể bảo quản dưa chuột, bạn nên để chúng trong ngăn mát tủ lạnh. Dưa chuột có thể giữ được tươi lâu trong khoảng 1 tuần nếu bảo quản trong túi ni lông hoặc hộp đựng kín. Khi cắt, nên sử dụng ngay để giữ được độ giòn và tươi ngon của dưa chuột.', 0, '2024-12-21 00:00:00', 20000, '03.jpg', 'Dưa chuột', 5, NULL, 4, NULL, '2024-12-21', 'Nông trại Lộc An', '0x07187841b42521d3a6eba102fae5a7ea6bf715ef590db9b39018bc24012aefb8', b'0'),
(170, 'Cam là loại trái cây nhiệt đới được yêu thích rộng rãi, với hương vị ngọt ngào và chua nhẹ, mang lại cảm giác giải khát tuyệt vời. Cam là nguồn cung cấp vitamin C dồi dào, giúp tăng cường hệ miễn dịch, chống lão hóa và hỗ trợ sức khỏe tim mạch. Ngoài ra, cam còn chứa chất xơ và các khoáng chất như kali, giúp cải thiện tiêu hóa và duy trì cân bằng nước trong cơ thể.\r\nCam từ Nông trại Vườn Cây Xanh là sản phẩm cam sạch, được trồng tại nông trại với quy trình canh tác hữu cơ, không sử dụng thuốc trừ sâu hay hóa chất độc hại. Cam Vườn Cây Xanh được thu hoạch khi đã chín mọng, vỏ mỏng, dễ bóc, và nước cam tươi, ngọt mát, đầy đủ dưỡng chất.\r\nĐể bảo quản cam, bạn nên để cam ở nhiệt độ phòng để cam chín từ từ. Nếu cam đã chín hoặc bạn muốn bảo quản lâu hơn, có thể giữ cam trong ngăn mát tủ lạnh để giữ được độ tươi ngon từ 1 đến 2 tuần. Cam là lựa chọn tuyệt vời cho các món nước ép, salad hoặc ăn trực tiếp.', 0, '2024-12-21 00:00:00', 50000, '16.jpg', 'Cam ', 10, NULL, 5, NULL, '2024-12-21', ' Nông trại Vườn Cây Xanh ', '0x1192b0c371ba342372df25d1c377084a24e4881764f580ffd9bc87beee85db32', b'0'),
(171, 'Nho xanh là một loại trái cây có màu sắc tươi sáng và hương vị ngọt thanh, đôi khi có chút chua nhẹ, tạo nên một sự cân bằng hoàn hảo. Nho xanh rất giàu vitamin C, vitamin K, chất chống oxy hóa, và các khoáng chất như kali, giúp tăng cường hệ miễn dịch, hỗ trợ tim mạch, và cải thiện chức năng tiêu hóa. Ngoài ra, nho xanh còn giúp làm đẹp da và chống lão hóa.\r\nNho xanh từ Nông trại Hòa Bình là sản phẩm nho sạch, được trồng tại nông trại với quy trình canh tác hữu cơ, không sử dụng thuốc trừ sâu hay hóa chất độc hại. Nho xanh Hòa Bình có vỏ mỏng, thịt quả giòn, mọng nước và vị ngọt nhẹ, rất thích hợp để ăn trực tiếp, làm nước ép hoặc trộn salad.\r\nĐể bảo quản nho xanh, bạn nên giữ chúng trong tủ lạnh, trong túi ni lông hoặc hộp đựng kín để giữ được độ tươi ngon. Nho xanh có thể bảo quản lâu trong khoảng 1 tuần nếu giữ ở nhiệt độ lạnh và không rửa trước khi bảo quản.', 0, '2024-12-21 00:00:00', 150000, '17.jpg', 'Nho xanh', 19, NULL, 5, NULL, '2024-12-21', 'Nông trại Hòa Bình', '0x9af7c2734bce23d1fd1d23e10a93132da367abb1bf078a3a8ddda0f255d8f959', b'0'),
(172, '\r\nNho tím là một loại trái cây có màu sắc đậm và hương vị ngọt ngào, với một chút chua nhẹ. Nho tím chứa nhiều chất chống oxy hóa, đặc biệt là resveratrol, giúp bảo vệ sức khỏe tim mạch, giảm viêm và ngăn ngừa lão hóa. Nho tím cũng cung cấp vitamin C, vitamin K, chất xơ và khoáng chất như kali, hỗ trợ hệ tiêu hóa và tăng cường hệ miễn dịch.\r\nNho tím từ Nông trại Đại Lộc là sản phẩm nho sạch, được trồng và chăm sóc tại nông trại theo quy trình canh tác hữu cơ. Nho tím Đại Lộc có vỏ mềm mịn, thịt quả ngọt, mọng nước, rất thích hợp để ăn trực tiếp, làm nước ép hoặc trộn trong các món salad trái cây.\r\nĐể bảo quản nho tím, bạn nên để nho trong tủ lạnh, trong túi ni lông hoặc hộp đựng kín để bảo quản độ tươi ngon. Nho tím có thể giữ được tươi lâu trong khoảng 5-7 ngày khi bảo quản đúng cách và không rửa trước khi bảo quản.', 1, '2024-12-21 00:00:00', 200000, 'pd-6.jpg', 'Nho tím', 10, NULL, 5, NULL, '2024-12-21', 'Nông trại Đại Lộc', '0x9a498f80ca70421daf4eddcbad48bfb1c7b9ecb2a1b07a20aafa397ea4164888', b'0'),
(173, 'Táo đỏ là một loại trái cây ngọt ngào, giòn và có màu sắc đỏ tươi đặc trưng. Táo đỏ rất giàu vitamin C, chất chống oxy hóa, và chất xơ, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa và làm đẹp da. Táo đỏ cũng có tác dụng giảm nguy cơ mắc bệnh tim mạch và giúp kiểm soát cân nặng nhờ vào lượng calo thấp và chất xơ cao.\r\nTáo đỏ từ Nông trại Hoa Sen là sản phẩm táo sạch, được trồng tại nông trại với quy trình canh tác hữu cơ, không sử dụng thuốc trừ sâu hay hóa chất độc hại. Táo đỏ Hoa Sen có vỏ bóng, giòn, vị ngọt thanh tự nhiên và rất thích hợp để ăn trực tiếp, làm nước ép, hoặc thêm vào các món salad trái cây.\r\nĐể bảo quản táo đỏ, bạn nên để táo ở nhiệt độ phòng trong vài ngày hoặc bảo quản trong ngăn mát tủ lạnh để giữ độ tươi lâu hơn. Táo đỏ có thể giữ được từ 1-2 tuần nếu bảo quản đúng cách và không bị va đập mạnh.', 0, '2024-12-21 00:00:00', 100000, 'product-8.jpg', 'Táo đỏ', 15, NULL, 5, NULL, '2024-12-18', 'Nông trại Hoa Sen ', '0xaf08d1b8af1797c33747525f81dc643777e27206109ab64e50db0f06d49310c8', b'0'),
(174, 'Táo Fuji là một trong những giống táo phổ biến nhất, nổi bật với vỏ màu đỏ và vàng, vị ngọt dịu và giòn. Táo Fuji rất được ưa chuộng nhờ vào độ ngọt thanh mát, ít chua, và có độ giòn cao, mang đến cảm giác dễ chịu khi ăn. Giống táo này cũng rất giàu vitamin C và chất chống oxy hóa, giúp cải thiện sức khỏe tim mạch, hỗ trợ tiêu hóa và duy trì làn da khỏe mạnh.\r\nTáo Fuji từ Nông trại Bạch Dương là sản phẩm táo sạch, được trồng theo quy trình canh tác hữu cơ tại nông trại, không sử dụng hóa chất hay thuốc trừ sâu. Táo Fuji Bạch Dương có vỏ bóng, thịt quả ngọt, giòn và rất thích hợp để ăn trực tiếp, làm nước ép, hoặc trộn vào các món salad trái cây.\r\nĐể bảo quản táo Fuji, bạn nên để táo ở nhiệt độ phòng nếu sử dụng trong vài ngày, hoặc bảo quản trong ngăn mát tủ lạnh để giữ độ tươi lâu hơn. Táo Fuji có thể giữ được từ 1-2 tuần nếu bảo quản đúng cách.', 0, '2024-12-21 00:00:00', 160000, '14.jpg', 'Táo Fuji ', 20, NULL, 5, NULL, '2024-12-19', 'Nông trại Bạch Dương', '0x2485e64b24f20f5243dd53aa4c6eade2f5fa3eb5bd6a1abbbcc5fabf27557a44', b'0'),
(175, 'Hạt tiêu là một trong những gia vị phổ biến nhất trên thế giới, với hương vị cay nồng và thơm đặc trưng. \r\nHạt tiêu từ Nông trại Cà Mau là sản phẩm tiêu sạch, được trồng và thu hoạch tại nông trại với quy trình canh tác hữu cơ, không sử dụng hóa chất hay thuốc trừ sâu. Hạt tiêu Cà Mau có hương vị cay nồng tự nhiên, phù hợp để dùng trong các món ăn chế biến từ thịt, hải sản, hoặc làm gia vị cho các món nước lẩu, súp.\r\nĐể bảo quản hạt tiêu, bạn nên giữ chúng trong hộp đựng kín, nơi khô ráo và thoáng mát, tránh ánh sáng trực tiếp và ẩm ướt để giữ được độ cay và hương thơm lâu dài. Hạt tiêu có thể bảo quản lâu dài, giúp bạn sử dụng trong các món ăn hàng ngày.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 0, '2024-12-21 00:00:00', 126000, 'hattieu.jpg', 'Hạt tiêu', 10, NULL, 11, NULL, '2024-12-23', ' Nông trại Cà Mau ', '0x931fa95fc0cf03482e3036a855bc25597bf82f46850eaa875495e1a19f5cc674', b'0'),
(176, 'Nước mận là một loại nước giải khát tự nhiên được chế biến từ quả mận tươi, có vị ngọt ngào, thanh mát và đôi khi hơi chua, rất phù hợp để giải nhiệt trong những ngày nóng bức. Nước mận chứa nhiều vitamin C, khoáng chất như kali và chất chống oxy hóa, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa, và bảo vệ tế bào khỏi các tổn thương do oxy hóa. Nước mận cũng có tác dụng làm đẹp da và hỗ trợ quá trình giảm cân.\r\nNước mận từ cửa hàng chúng tôi là sản phẩm nước mận nguyên chất, được chế biến từ những quả mận tươi ngon, đảm bảo chất lượng. Sản phẩm không chứa hóa chất hay phẩm màu nhân tạo, giữ nguyên vị ngọt tự nhiên của mận, giúp bạn thưởng thức một ly nước mận tươi mát, bổ dưỡng.\r\nĐể bảo quản nước mận, bạn nên để sản phẩm trong ngăn mát tủ lạnh để giữ được độ tươi ngon và hạn sử dụng lâu hơn. Nước mận có thể dùng trực tiếp hoặc làm đá xay, sinh tố tùy theo sở thích.', 5, '2024-12-21 00:00:00', 290000, 'product-9.jpg', 'Nước mận', 10, NULL, 14, '2025-01-24', '2024-12-20', 'Sản phẩm tại cửa hàng tự sản xuất', '0x95959d1458957feb865a3fe5049a43154bda8dd351952b59cfba89230d084f83', b'0'),
(177, 'Hành lá là một loại rau gia vị phổ biến, có phần thân mảnh và lá dài màu xanh, được sử dụng rộng rãi trong các món ăn Việt Nam và các món ăn châu Á. Hành lá có vị thơm nhẹ, cay nồng và là một nguyên liệu không thể thiếu trong nhiều món ăn như canh, xào, gỏi, hoặc rắc lên các món ăn để trang trí. Hành lá rất giàu vitamin K, vitamin A, chất chống oxy hóa và các khoáng chất như sắt và canxi, giúp tăng cường hệ miễn dịch và hỗ trợ sức khỏe tim mạch.\r\nHành lá từ cửa hàng chúng tôi là sản phẩm hành lá sạch, được trồng theo quy trình hữu cơ, không sử dụng thuốc trừ sâu hay hóa chất độc hại. Hành lá Xanh Tươi có lá xanh mướt, giòn và thơm, rất thích hợp để làm gia vị cho các món ăn.\r\nĐể bảo quản hành lá, bạn nên cắt bớt phần gốc và để chúng trong túi ni lông hoặc hộp kín trong ngăn mát tủ lạnh. Hành lá có thể giữ tươi lâu trong khoảng 5-7 ngày nếu bảo quản đúng cách.', 0, '2024-12-21 00:00:00', 17000, 'hanhla.jpg', 'Hành lá', 2, NULL, 4, NULL, '2024-12-20', 'Sản phẩm tại cửa hàng sản xuất', '0xdb52901cc256f9b0b3ba4a25b53a017b73bce48e0a0754185530240a2ba2630e', b'0'),
(178, 'Hạt đười ươi từ trang  trại của chúng tôi là sản phẩm hạt đười ươi sạch, được thu hoạch và chế biến đúng cách để đảm bảo chất lượng và an toàn cho người sử dụng. Hạt đười ươi Thanh Bình có lớp gel tự nhiên, giúp tạo nên các món chè, nước giải khát thơm ngon và bổ dưỡng.\r\nĐể bảo quản hạt đười ươi, bạn nên giữ chúng trong một nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp và ẩm ướt. Hạt đười ươi có thể ngâm trong nước để sử dụng trong các món ăn hoặc nước giải khát.', 0, '2024-12-21 00:00:00', 99000, 'hat-duoi-uoi.jpg', 'Hạt đười ươi', 10, NULL, 11, NULL, '2024-12-20', 'Trang trại của cửa hàng', '0x2c68b90e4daa44f79c814d2df19485f8094e9c7fff0984900c9b0f7dbb867436', b'0'),
(179, 'Nước trái cây hỗn hợp từ cửa hàng chúng tôi là sản phẩm nước trái cây nguyên chất, không chứa phẩm màu hay hóa chất bảo quản. Các loại trái cây được lựa chọn kỹ càng từ nông trại hữu cơ, mang đến hương vị tự nhiên, ngọt ngào và thanh mát. Sản phẩm giàu vitamin C, chất chống oxy hóa và khoáng chất, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa và làm đẹp da.\r\nĐể bảo quản nước trái cây hỗn hợp, bạn nên giữ trong ngăn mát tủ lạnh để duy trì độ tươi ngon. Nước trái cây hỗn hợp có thể dùng ngay sau khi mở nắp và nên sử dụng trong vòng 3-5 ngày để đảm bảo chất lượng.', 5, '2024-12-21 00:00:00', 240000, 'thumb-4.jpg', 'Nước trái cây hỗn hợp', 5, NULL, 14, '2025-01-16', '2024-12-20', 'Sản phẩm tại cửa hàng sản xuất', '0x42274b51cb13df974c087c2e757963c032800341dc036fd93e15408de1972041', b'0'),
(180, '\r\nDâu đỏ là loại quả mọng nước, có màu đỏ tươi và hương vị ngọt ngào, hơi chua, rất được yêu thích trong các món tráng miệng, nước ép, hoặc ăn trực tiếp. Dâu đỏ rất giàu vitamin C, mangan, chất chống oxy hóa và các dưỡng chất có lợi cho sức khỏe như folate và chất xơ. Nó có tác dụng tăng cường hệ miễn dịch, giúp cải thiện sức khỏe tim mạch và giảm nguy cơ mắc bệnh mãn tính. Dâu đỏ cũng nổi bật với khả năng làm đẹp da, giảm lão hóa và bảo vệ tế bào khỏi các tác nhân gây hại.\r\nDâu đỏ từ nông trai là sản phẩm dâu sạch, được trồng và thu hoạch tại nông trại với quy trình canh tác hữu cơ, không sử dụng hóa chất hay thuốc trừ sâu. Dâu đỏ Mùa Xuân có quả mọng, tươi ngon, ngọt thanh tự nhiên và rất thích hợp để chế biến thành nước ép, mứt hoặc thêm vào các món salad trái cây.\r\nĐể bảo quản dâu đỏ, bạn nên giữ chúng trong ngăn mát tủ lạnh, trong hộp kín hoặc túi ni lông. Dâu đỏ có thể giữ tươi trong khoảng 2-3 ngày. Nếu muốn bảo quản lâu hơn, bạn có thể làm mứt hoặc đông lạnh để sử dụng sau.', 1, '2024-12-21 00:00:00', 200000, '13.jpg', 'Dâu đỏ', 10, NULL, 5, NULL, '2024-12-27', 'Nông trại gia đình', '0xca31f7b0a772b504bc135eb03303d3db04c6a26c49b18573464b352b1c9c3eda', b'0'),
(181, 'Quả lựu là loại quả mọng nước, có màu đỏ tươi và hương vị ngọt ngào, hơi chua, rất được yêu thích trong các món tráng miệng, nước ép, hoặc ăn trực tiếp. Dâu đỏ rất giàu vitamin C, mangan, chất chống oxy hóa và các dưỡng chất có lợi cho sức khỏe như folate và chất xơ. Nó có tác dụng tăng cường hệ miễn dịch, giúp cải thiện sức khỏe tim mạch và giảm nguy cơ mắc bệnh mãn tính. Dâu đỏ cũng nổi bật với khả năng làm đẹp da, giảm lão hóa và bảo vệ tế bào khỏi các tác nhân gây hại.\r\nĐể bảo quản , bạn nên giữ chúng trong ngăn mát tủ lạnh, trong hộp kín hoặc túi ni lông. Dâu đỏ có thể giữ tươi trong khoảng 2-3 ngày. Nếu muốn bảo quản lâu hơn, bạn có thể làm mứt hoặc đông lạnh để sử dụng sau.', 1, '2024-12-21 00:00:00', 100000, 'qualuu.jpg', 'Quả lựu', 10, NULL, 5, NULL, '2024-12-24', 'Nông trại gia đình', '0xf2e5fed7617d43f1424cbfea50e8c0ac80ba09db9dc34f1b79a30a6bbeca7c41', b'0'),
(182, 'Khoai tây là một loại củ có nguồn gốc từ Nam Mỹ, hiện nay là thực phẩm phổ biến trên toàn thế giới. Khoai tây có vỏ ngoài mỏng và phần thịt mềm, thường có màu trắng, vàng hoặc tím, tùy thuộc vào giống. Khoai tây rất giàu carbohydrate, vitamin C, vitamin B6, và khoáng chất như kali, giúp cung cấp năng lượng, cải thiện hệ tiêu hóa, và hỗ trợ sức khỏe tim mạch.\r\nĐể bảo quản khoai tây, bạn nên giữ chúng ở nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp và nhiệt độ cao. Khoai tây có thể giữ tươi lâu từ 2-3 tuần nếu bảo quản đúng cách. Tránh để khoai tây trong tủ lạnh, vì nhiệt độ lạnh có thể làm thay đổi cấu trúc tinh bột và gây vị ngọt không mong muốn.', 0, '2024-12-21 00:00:00', 40000, 'khoaitay.png', 'Khoai tây', 5, NULL, 4, NULL, '2024-12-21', 'Nông trại gia đình', '0x2e5e9f8939f29eb45ff18ce80fbeed6cf990a746ee21f280a5cca82ff811072c', b'0'),
(183, 'Để bảo quản khoai môn, bạn nên giữ chúng ở nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp và nhiệt độ cao. Khoai tây có thể giữ tươi lâu từ 2-3 tuần nếu bảo quản đúng cách. Tránh để khoai tây trong tủ lạnh, vì nhiệt độ lạnh có thể làm thay đổi cấu trúc tinh bột và gây vị ngọt không mong muốn.', 0, '2024-12-21 00:00:00', 47000, 'quagat.jpg', 'Khoai môn', 10, NULL, 4, NULL, '2024-12-22', 'Nông trại Sơn Hà ', '0xb8d56a6f607ae1a9127f23ddedd523c87de1739fa57d76576236739696044c25', b'0'),
(184, 'Giỏ trái cây là một món quà tuyệt vời và bổ dưỡng, được tạo thành từ nhiều loại trái cây tươi ngon, thường là những loại trái cây theo mùa như táo, cam, nho, dưa hấu, dâu tây, chuối, và nhiều loại trái cây khác. Giỏ trái cây không chỉ mang lại hương vị tươi ngon mà còn cung cấp nhiều vitamin, khoáng chất và chất xơ, giúp tăng cường hệ miễn dịch, cải thiện sức khỏe tim mạch và cung cấp năng lượng cho cơ thể.\r\nGiỏ trái cây từ Nông trại Tươi Sạch là sản phẩm giỏ trái cây chất lượng, được chế biến từ những trái cây sạch, tươi ngon và được lựa chọn kỹ càng từ các nông trại hữu cơ. Mỗi giỏ trái cây Tươi Sạch đều chứa những trái cây tươi ngon, giàu dinh dưỡng, mang đến cho bạn một món quà đầy ý nghĩa và sức khỏe.\r\nĐể bảo quản giỏ trái cây, bạn nên để giỏ ở nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp và không để trong tủ lạnh quá lâu để trái cây không bị hư hỏng. Một giỏ trái cây tươi có thể giữ được tươi ngon trong 3-5 ngày nếu bảo quản đúng cách.', 20, '2024-12-21 00:00:00', 350000, 'product-12.jpg', 'Giỏ trái cây', 10, NULL, 12, NULL, '2024-12-22', 'Nông trại gia đình', '0x67077963cc1f1bb0ba24b9894bb6481399ca4d1806155f0a253956af7d50d3d8', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(15, 'ROLE_ADMIN'),
(16, 'ROLE_USER'),
(17, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `avatar`, `email`, `name`, `password`, `register_date`, `status`) VALUES
(14, 'user.png', 'vanphule22@gmail.com', 'phu le', '$2a$10$Z5QMsLf97Tk5tetPQEPOmuw09wY.OhsxE3T/3jdMRxzqZeRfOTetC', '2024-10-01', b'1'),
(15, 'user.png', 'levanphu2002qb@gmail.com', 'ph', '$2a$10$y4lxQD007flWJcpaUfe04ulZkaUrUcDfu5oJJliLtLn/J8gfZK9ri', '2024-10-01', b'1'),
(16, 'user.png', 'huymnbb565@gmail.com', 'le phu', '$2a$10$13zzC5oRbHb1wnYhPii3lOy/32NS7Le/CRtQ.V/M37FY5lAPY0Eu6', '2024-12-15', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(14, 15),
(15, 16),
(16, 17);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfwepd0s8syqc9s06xnqa7mdwf` (`order_detail_id`),
  ADD KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  ADD KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  ADD KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Chỉ mục cho bảng `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  ADD KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKfwepd0s8syqc9s06xnqa7mdwf` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
  ADD CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Các ràng buộc cho bảng `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
