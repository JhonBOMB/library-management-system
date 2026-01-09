SET NAMES utf8mb4;
USE `ry-vue`;

-- 1. 修复核心一级菜单
UPDATE sys_menu SET menu_name = '系统管理' WHERE menu_id = 1;
UPDATE sys_menu SET menu_name = '系统监控' WHERE menu_id = 2;
UPDATE sys_menu SET menu_name = '系统工具' WHERE menu_id = 3;
UPDATE sys_menu SET menu_name = '若依官网' WHERE menu_id = 4;

-- 2. 修复系统管理子菜单
UPDATE sys_menu SET menu_name = '用户管理' WHERE menu_id = 100;
UPDATE sys_menu SET menu_name = '角色管理' WHERE menu_id = 101;
UPDATE sys_menu SET menu_name = '菜单管理' WHERE menu_id = 102;
UPDATE sys_menu SET menu_name = '部门管理' WHERE menu_id = 103;
UPDATE sys_menu SET menu_name = '岗位管理' WHERE menu_id = 104;
UPDATE sys_menu SET menu_name = '字典管理' WHERE menu_id = 105;
UPDATE sys_menu SET menu_name = '参数设置' WHERE menu_id = 106;
UPDATE sys_menu SET menu_name = '通知公告' WHERE menu_id = 107;
UPDATE sys_menu SET menu_name = '日志管理' WHERE menu_id = 108;

-- 3. 修复系统监控子菜单
UPDATE sys_menu SET menu_name = '在线用户' WHERE menu_id = 109;
UPDATE sys_menu SET menu_name = '定时任务' WHERE menu_id = 110;
UPDATE sys_menu SET menu_name = '数据监控' WHERE menu_id = 111;
UPDATE sys_menu SET menu_name = '服务监控' WHERE menu_id = 112;
UPDATE sys_menu SET menu_name = '缓存监控' WHERE menu_id = 113;
UPDATE sys_menu SET menu_name = '缓存列表' WHERE menu_id = 114;

-- 4. 修复系统工具子菜单
UPDATE sys_menu SET menu_name = '表单构建' WHERE menu_id = 115;
UPDATE sys_menu SET menu_name = '代码生成' WHERE menu_id = 116;
UPDATE sys_menu SET menu_name = '系统接口' WHERE menu_id = 117;

-- 5. 修复公共字典数据 (解决性别、状态乱码)
UPDATE sys_dict_data SET dict_label = '男' WHERE dict_type = 'sys_user_sex' AND dict_value = '0';
UPDATE sys_dict_data SET dict_label = '女' WHERE dict_type = 'sys_user_sex' AND dict_value = '1';
UPDATE sys_dict_data SET dict_label = '未知' WHERE dict_type = 'sys_user_sex' AND dict_value = '2';

UPDATE sys_dict_data SET dict_label = '正常' WHERE dict_type = 'sys_normal_disable' AND dict_value = '0';
UPDATE sys_dict_data SET dict_label = '停用' WHERE dict_type = 'sys_normal_disable' AND dict_value = '1';

UPDATE sys_dict_data SET dict_label = '显示' WHERE dict_type = 'sys_show_hide' AND dict_value = '0';
UPDATE sys_dict_data SET dict_label = '隐藏' WHERE dict_type = 'sys_show_hide' AND dict_value = '1';

UPDATE sys_dict_data SET dict_label = '是' WHERE dict_type = 'sys_yes_no' AND dict_value = 'Y';
UPDATE sys_dict_data SET dict_label = '否' WHERE dict_type = 'sys_yes_no' AND dict_value = 'N';

-- 6. 修复图书管理模块菜单（确保也是正确的中文）
UPDATE sys_menu SET menu_name = '图书管理' WHERE menu_id = 2000;
UPDATE sys_menu SET menu_name = '图书分类' WHERE menu_id = 2001;
UPDATE sys_menu SET menu_name = '图书信息' WHERE menu_id = 2011;
UPDATE sys_menu SET menu_name = '读者管理' WHERE menu_id = 2021;
UPDATE sys_menu SET menu_name = '借阅管理' WHERE menu_id = 2031;

-- 7. 修正部门和角色名称
UPDATE sys_dept SET dept_name = '若依科技' WHERE dept_id = 100;
UPDATE sys_dept SET dept_name = '研发部门' WHERE dept_id = 103;
UPDATE sys_role SET role_name = '超级管理员' WHERE role_id = 1;
UPDATE sys_role SET role_name = '普通角色' WHERE role_id = 2;

-- 8. 修正配置参数中的中文
UPDATE sys_config SET config_name = '主框架页-默认皮肤样式名称' WHERE config_key = 'sys.index.skinName';
UPDATE sys_config SET config_name = '用户管理-账号初始密码' WHERE config_key = 'sys.user.initPassword';
UPDATE sys_config SET config_name = '主框架页-侧边栏主题' WHERE config_key = 'sys.index.sideTheme';
