-- 修复图书管理系统菜单乱码
-- 直接更新菜单名称为正确的中文

UPDATE sys_menu SET menu_name = '图书管理' WHERE menu_id = 2000;
UPDATE sys_menu SET menu_name = '图书分类' WHERE menu_id = 2001;
UPDATE sys_menu SET menu_name = '图书分类查询' WHERE menu_id = 2002;
UPDATE sys_menu SET menu_name = '图书分类新增' WHERE menu_id = 2003;
UPDATE sys_menu SET menu_name = '图书分类修改' WHERE menu_id = 2004;
UPDATE sys_menu SET menu_name = '图书分类删除' WHERE menu_id = 2005;
UPDATE sys_menu SET menu_name = '图书分类导出' WHERE menu_id = 2006;

UPDATE sys_menu SET menu_name = '图书信息' WHERE menu_id = 2011;
UPDATE sys_menu SET menu_name = '图书查询' WHERE menu_id = 2012;
UPDATE sys_menu SET menu_name = '图书新增' WHERE menu_id = 2013;
UPDATE sys_menu SET menu_name = '图书修改' WHERE menu_id = 2014;
UPDATE sys_menu SET menu_name = '图书删除' WHERE menu_id = 2015;
UPDATE sys_menu SET menu_name = '图书导出' WHERE menu_id = 2016;

UPDATE sys_menu SET menu_name = '读者管理' WHERE menu_id = 2021;
UPDATE sys_menu SET menu_name = '读者查询' WHERE menu_id = 2022;
UPDATE sys_menu SET menu_name = '读者新增' WHERE menu_id = 2023;
UPDATE sys_menu SET menu_name = '读者修改' WHERE menu_id = 2024;
UPDATE sys_menu SET menu_name = '读者删除' WHERE menu_id = 2025;
UPDATE sys_menu SET menu_name = '读者导出' WHERE menu_id = 2026;

UPDATE sys_menu SET menu_name = '借阅管理' WHERE menu_id = 2031;
UPDATE sys_menu SET menu_name = '借阅查询' WHERE menu_id = 2032;
UPDATE sys_menu SET menu_name = '办理借书' WHERE menu_id = 2033;
UPDATE sys_menu SET menu_name = '办理还书' WHERE menu_id = 2034;
UPDATE sys_menu SET menu_name = '办理续借' WHERE menu_id = 2035;
UPDATE sys_menu SET menu_name = '借阅导出' WHERE menu_id = 2036;
