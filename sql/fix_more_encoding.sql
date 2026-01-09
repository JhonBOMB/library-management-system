-- 扩展修复：部门、角色、岗位
UPDATE sys_dept SET dept_name = '若依科技' WHERE dept_id = 100;
UPDATE sys_dept SET dept_name = '深圳总公司' WHERE dept_id = 101;
UPDATE sys_dept SET dept_name = '长沙分公司' WHERE dept_id = 102;
UPDATE sys_dept SET dept_name = '研发部门' WHERE dept_id = 103;
UPDATE sys_dept SET dept_name = '市场部门' WHERE dept_id = 104;
UPDATE sys_dept SET dept_name = '测试部门' WHERE dept_id = 105;
UPDATE sys_dept SET dept_name = '财务部门' WHERE dept_id = 106;
UPDATE sys_dept SET dept_name = '运维部门' WHERE dept_id = 107;
UPDATE sys_dept SET dept_name = '市场部门' WHERE dept_id = 108;
UPDATE sys_dept SET dept_name = '财务部门' WHERE dept_id = 109;

UPDATE sys_role SET role_name = '超级管理员' WHERE role_id = 1;
UPDATE sys_role SET role_name = '普通角色' WHERE role_id = 2;

UPDATE sys_post SET post_name = '董事长' WHERE post_id = 1;
UPDATE sys_post SET post_name = '项目经理' WHERE post_id = 2;
UPDATE sys_post SET post_name = '人力资源' WHERE post_id = 3;
UPDATE sys_post SET post_name = '普通员工' WHERE post_id = 4;
