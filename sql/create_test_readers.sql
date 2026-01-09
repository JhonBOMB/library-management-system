SET NAMES utf8mb4;

-- 插入三个测试读者账号
INSERT INTO lib_reader (card_no, reader_name, gender, phone, email, password, reader_type, max_borrow_count, max_borrow_days, status, del_flag, create_time) 
VALUES 
('RC2026010601', '张三', '0', '13800000001', 'zhangsan@test.com', '123456', '0', 5, 30, '0', '0', NOW()),
('RC2026010602', '李四', '1', '13800000002', 'lisi@test.com', '123456', '0', 5, 30, '0', '0', NOW()),
('RC2026010603', '王五', '0', '13800000003', 'wangwu@test.com', '123456', '0', 5, 30, '0', '0', NOW());

SELECT '测试账号创建成功！' AS Result;
SELECT reader_id, card_no, reader_name, phone, email FROM lib_reader WHERE card_no LIKE 'RC202601%';
