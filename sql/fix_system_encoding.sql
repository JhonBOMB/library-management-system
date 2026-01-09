-- 修复若依系统原始菜单乱码
-- 将乱码的系统菜单名称恢复为正确中文

UPDATE sys_menu SET menu_name = '系统管理' WHERE menu_id = 1;
UPDATE sys_menu SET menu_name = '用户管理' WHERE menu_id = 100;
UPDATE sys_menu SET menu_name = '角色管理' WHERE menu_id = 101;
UPDATE sys_menu SET menu_name = '菜单管理' WHERE menu_id = 102;
UPDATE sys_menu SET menu_name = '部门管理' WHERE menu_id = 103;
UPDATE sys_menu SET menu_name = '岗位管理' WHERE menu_id = 104;
UPDATE sys_menu SET menu_name = '字典管理' WHERE menu_id = 105;
UPDATE sys_menu SET menu_name = '参数设置' WHERE menu_id = 106;
UPDATE sys_menu SET menu_name = '通知公告' WHERE menu_id = 107;
UPDATE sys_menu SET menu_name = '日志管理' WHERE menu_id = 108;

UPDATE sys_menu SET menu_name = '系统监控' WHERE menu_id = 2;
UPDATE sys_menu SET menu_name = '在线用户' WHERE menu_id = 109;
UPDATE sys_menu SET menu_name = '定时任务' WHERE menu_id = 110;
UPDATE sys_menu SET menu_name = '数据监控' WHERE menu_id = 111;
UPDATE sys_menu SET menu_name = '服务监控' WHERE menu_id = 112;
UPDATE sys_menu SET menu_name = '缓存监控' WHERE menu_id = 113;
UPDATE sys_menu SET menu_name = '缓存列表' WHERE menu_id = 114;

UPDATE sys_menu SET menu_name = '系统工具' WHERE menu_id = 3;
UPDATE sys_menu SET menu_name = '表单构建' WHERE menu_id = 115;
UPDATE sys_menu SET menu_name = '代码生成' WHERE menu_id = 116;
UPDATE sys_menu SET menu_name = '系统接口' WHERE menu_id = 117;

UPDATE sys_menu SET menu_name = '若依官网' WHERE menu_id = 4;

-- 顺便检查字典数据是否也有乱码（常见于性别、状态等）
UPDATE sys_dict_data SET dict_label = '男' WHERE dict_label LIKE '%ç”·%';
UPDATE sys_dict_data SET dict_label = '女' WHERE dict_label LIKE '%å¥³%';
UPDATE sys_dict_data SET dict_label = '正常' WHERE dict_label LIKE '%æ­£å¸¸%';
UPDATE sys_dict_data SET dict_label = '停用' WHERE dict_label LIKE '%åœç”¨%';
