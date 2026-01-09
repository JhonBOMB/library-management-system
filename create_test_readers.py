# -*- coding: utf-8 -*-
import pymysql
from datetime import datetime

# 数据库连接配置
connection = pymysql.connect(
    host='127.0.0.1',
    port=3307,
    user='root',
    password='root',
    database='ry-vue',
    charset='utf8mb4'
)

try:
    with connection.cursor() as cursor:
        # 先删除可能存在的旧数据
        delete_sql = "DELETE FROM lib_reader WHERE card_no IN ('RC2026010601', 'RC2026010602', 'RC2026010603')"
        cursor.execute(delete_sql)
        
        # 插入三个测试读者
        readers = [
            ('RC2026010601', '张三', '0', '13800000001', 'zhangsan@test.com', '123456'),
            ('RC2026010602', '李四', '1', '13800000002', 'lisi@test.com', '123456'),
            ('RC2026010603', '王五', '0', '13800000003', 'wangwu@test.com', '123456')
        ]
        
        insert_sql = """
        INSERT INTO lib_reader 
        (card_no, reader_name, gender, phone, email, password, reader_type, max_borrow_count, max_borrow_days, status, del_flag, create_time) 
        VALUES (%s, %s, %s, %s, %s, %s, '0', 5, 30, '0', '0', NOW())
        """
        
        for reader in readers:
            cursor.execute(insert_sql, reader)
        
        connection.commit()
        
        # 验证插入结果
        cursor.execute("SELECT card_no, reader_name, phone, email FROM lib_reader WHERE card_no LIKE 'RC202601%'")
        results = cursor.fetchall()
        
        print("✅ 成功创建以下测试账号：")
        print("-" * 60)
        for row in results:
            print(f"借书证号: {row[0]:<15} 姓名: {row[1]:<10} 手机: {row[2]:<15} 邮箱: {row[3]}")
        print("-" * 60)
        print("密码统一为: 123456")
        
except Exception as e:
    print(f"❌ 错误: {e}")
    connection.rollback()
finally:
    connection.close()
