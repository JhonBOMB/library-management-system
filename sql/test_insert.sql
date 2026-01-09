-- 简化版批量插入脚本
SET NAMES utf8mb4;
USE `ry-vue`;

DELETE FROM `lib_book` WHERE book_id > 5;

-- 批量插入200条数据（分批执行）
INSERT INTO `lib_book` (`isbn`, `book_name`, `author`, `publisher`, `publish_date`, `category_id`, `price`, `total_quantity`, `available_quantity`, `location`, `status`, `del_flag`, `create_by`, `create_time`) VALUES
('9787115428028', 'Python编程：从入门到实践', 'Eric Matthes', '人民邮电出版社', '2016-07-01', 1, 89.00, 10, 8, 'A区-1排-3层', '0', '0', 'admin', NOW()),
('9787111558422', 'Java核心技术 卷II', 'Cay S. Horstmann', '机械工业出版社', '2017-09-01', 1, 119.00, 8, 6, 'A区-1排-2层', '0', '0', 'admin', NOW()),
('9787121352679', 'MySQL必知必会', 'Ben Forta', '电子工业出版社', '2019-05-01', 1, 39.00, 15, 12, 'A区-2排-1层', '0', '0', 'admin', NOW()),
('9787115452344', '算法图解', 'Aditya Bhargava', '人民邮电出版社', '2017-03-01', 1, 49.00, 12, 10, 'A区-1排-4层', '0', '0', 'admin', NOW()),
('9787302511359', '深度学习', 'Ian Goodfellow', '清华大学出版社', '2017-08-01', 1, 168.00, 6, 4, 'A区-3排-2层', '0', '0', 'admin', NOW());
