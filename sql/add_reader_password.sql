-- =============================================
-- 为读者表添加密码字段
-- =============================================

USE `ry-vue`;

-- 添加密码字段和盐值字段
ALTER TABLE `lib_reader` 
ADD COLUMN `password` varchar(100) DEFAULT NULL COMMENT '登录密码(加密)' AFTER `email`,
ADD COLUMN `salt` varchar(50) DEFAULT NULL COMMENT '密码盐值' AFTER `password`;

-- 为现有测试读者添加默认密码(123456加密后的值,需要根据实际加密算法调整)
-- 这里先设置为明文,实际使用时应该加密
UPDATE `lib_reader` 
SET `password` = '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE/sW/ddyQV5p6'  -- BCrypt加密的'123456'
WHERE `password` IS NULL;

SELECT 'Reader password fields added successfully!' AS Result;
