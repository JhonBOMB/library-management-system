-- 图书管理系统菜单配置
-- 注意：若依框架的sys_menu表菜单ID从2000开始，避免与系统菜单冲突

-- 一级菜单：图书管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES (2000, '图书管理', 0, 5, 'library', NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', sysdate(), '图书管理系统菜单');

-- 二级菜单：图书分类管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES (2001, '图书分类', 2000, 1, 'category', 'library/category/index', 1, 0, 'C', '0', '0', 'library:category:list', 'tree', 'admin', sysdate(), '图书分类管理菜单');

-- 图书分类管理按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time)
VALUES 
(2002, '图书分类查询', 2001, 1, '', '', 1, 0, 'F', '0', '0', 'library:category:query', '#', 'admin', sysdate()),
(2003, '图书分类新增', 2001, 2, '', '', 1, 0, 'F', '0', '0', 'library:category:add', '#', 'admin', sysdate()),
(2004, '图书分类修改', 2001, 3, '', '', 1, 0, 'F', '0', '0', 'library:category:edit', '#', 'admin', sysdate()),
(2005, '图书分类删除', 2001, 4, '', '', 1, 0, 'F', '0', '0', 'library:category:remove', '#', 'admin', sysdate()),
(2006, '图书分类导出', 2001, 5, '', '', 1, 0, 'F', '0', '0', 'library:category:export', '#', 'admin', sysdate());

-- 二级菜单：图书信息管理  
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES (2011, '图书信息', 2000, 2, 'book', 'library/book/index', 1, 0, 'C', '0', '0', 'library:book:list', 'book', 'admin', sysdate(), '图书信息管理菜单');

-- 图书信息管理按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time)
VALUES 
(2012, '图书查询', 2011, 1, '', '', 1, 0, 'F', '0', '0', 'library:book:query', '#', 'admin', sysdate()),
(2013, '图书新增', 2011, 2, '', '', 1, 0, 'F', '0', '0', 'library:book:add', '#', 'admin', sysdate()),
(2014, '图书修改', 2011, 3, '', '', 1, 0, 'F', '0', '0', 'library:book:edit', '#', 'admin', sysdate()),
(2015, '图书删除', 2011, 4, '', '', 1, 0, 'F', '0', '0', 'library:book:remove', '#', 'admin', sysdate()),
(2016, '图书导出', 2011, 5, '', '', 1, 0, 'F', '0', '0', 'library:book:export', '#', 'admin', sysdate());

-- 二级菜单：读者管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES (2021, '读者管理', 2000, 3, 'reader', 'library/reader/index', 1, 0, 'C', '0', '0', 'library:reader:list', 'peoples', 'admin', sysdate(), '读者管理菜单');

-- 读者管理按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time)
VALUES 
(2022, '读者查询', 2021, 1, '', '', 1, 0, 'F', '0', '0', 'library:reader:query', '#', 'admin', sysdate()),
(2023, '读者新增', 2021, 2, '', '', 1, 0, 'F', '0', '0', 'library:reader:add', '#', 'admin', sysdate()),
(2024, '读者修改', 2021, 3, '', '', 1, 0, 'F', '0', '0', 'library:reader:edit', '#', 'admin', sysdate()),
(2025, '读者删除', 2021, 4, '', '', 1, 0, 'F', '0', '0', 'library:reader:remove', '#', 'admin', sysdate()),
(2026, '读者导出', 2021, 5, '', '', 1, 0, 'F', '0', '0', 'library:reader:export', '#', 'admin', sysdate());

-- 二级菜单：借阅管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES (2031, '借阅管理', 2000, 4, 'borrow', 'library/borrow/index', 1, 0, 'C', '0', '0', 'library:borrow:list', 'shopping', 'admin', sysdate(), '借阅管理菜单');

-- 借阅管理按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time)
VALUES 
(2032, '借阅查询', 2031, 1, '', '', 1, 0, 'F', '0', '0', 'library:borrow:query', '#', 'admin', sysdate()),
(2033, '办理借书', 2031, 2, '', '', 1, 0, 'F', '0', '0', 'library:borrow:add', '#', 'admin', sysdate()),
(2034, '办理还书', 2031, 3, '', '', 1, 0, 'F', '0', '0', 'library:borrow:return', '#', 'admin', sysdate()),
(2035, '办理续借', 2031, 4, '', '', 1, 0, 'F', '0', '0', 'library:borrow:renew', '#', 'admin', sysdate()),
(2036, '借阅导出', 2031, 5, '', '', 1, 0, 'F', '0', '0', 'library:borrow:export', '#', 'admin', sysdate());
