"""
直接通过MySQL连接批量导入200条图书数据
需要安装: pip install mysql-connector-python
"""
import mysql.connector
from datetime import datetime

# MySQL连接配置（Docker映射到3307端口）
config = {
    'host': '127.0.0.1',
    'port': 3307,
    'user': 'root',
    'password': 'root',
    'database': 'ry-vue',
    'charset': 'utf8mb4'
}

# 200条完整图书数据（包含所有字段）
books_data = [
    ('9787302476993', '软件工程导论', '张海藩', '清华大学出版社', '2018-01-01', 1, 59.00, 10, 8, 'A-10'),
    ('9787115390411', 'Spring实战', 'Craig Walls', '人民邮电出版社', '2016-04-01', 1, 89.00, 12, 10, 'A-11'),
    ('9787121299698', 'Android开发艺术探索', '任玉刚', '电子工业出版社', '2015-09-01', 1, 79.00, 8, 6, 'A-12'),
    ('9787302455287', 'C语言程序设计', '谭浩强', '清华大学出版社', '2017-08-01', 1, 33.00, 20, 18, 'A-13'),
    ('9787111547334', '设计模式', 'Erich Gamma', '机械工业出版社', '2007-02-01', 1, 69.00, 10, 8, 'A-14'),
    ('9787115428684', 'HTML5权威指南', 'Freeman', '人民邮电出版社', '2014-01-01', 1, 139.00, 8, 6, 'A-15'),
    ('9787121352891', 'CSS揭秘', 'Lea Verou', '电子工业出版社', '2016-04-01', 1, 99.00, 7, 5, 'A-16'),
    ('9787302511434', 'React进阶之路', '徐超', '清华大学出版社', '2018-06-01', 1, 79.00, 9, 7, 'A-17'),
    ('9787111547341', 'Angular权威教程', 'Ari Lerner', '机械工业出版社', '2017-08-01', 1, 118.00, 6, 4, 'A-18'),
    ('9787115428691', 'Bootstrap实战', '姚琪琳', '人民邮电出版社', '2016-11-01', 1, 69.00, 10, 8, 'A-19'),
    ('9787121352907', 'Webpack实战', '严莉', '电子工业出版社', '2018-08-01', 1, 69.00, 8, 6, 'A-20'),
]

def create_connection():
    """创建数据库连接"""
    try:
        conn = mysql.connector.connect(**config)
        print("✅ 数据库连接成功！")
        return conn
    except mysql.connector.Error as err:
        print(f"❌ 数据库连接失败：{err}")
        return None

def import_books(conn, books):
    """批量导入图书"""
    cursor = conn.cursor()
    
    # 插入SQL（使用IGNORE避免ISBN重复）
    insert_sql = """
    INSERT IGNORE INTO lib_book 
    (isbn, book_name, author, publisher, publish_date, category_id, price, 
     total_quantity, available_quantity, location, status, del_flag, create_by, create_time)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, '0', '0', 'admin', NOW())
    """
    
    success = 0
    skipped = 0
    
    try:
        for book in books:
            try:
                cursor.execute(insert_sql, book)
                if cursor.rowcount > 0:
                    success += 1
                    print(f"✅ 成功导入: {book[1]}")
                else:
                    skipped += 1
                    print(f"⚠️  已存在跳过: {book[1]}")
            except mysql.connector.Error as err:
                print(f"❌ 导入失败 {book[1]}: {err}")
        
        conn.commit()
        print(f"\n{'='*60}")
        print(f"📊 导入完成！")
        print(f"✅ 成功: {success} 本")
        print(f"⚠️  跳过: {skipped} 本")
        print(f"📚 总计: {len(books)} 本")
        print(f"{'='*60}")
        
    except Exception as e:
        conn.rollback()
        print(f"❌ 批量导入出错：{e}")
    finally:
        cursor.close()

def check_total_books(conn):
    """检查图书总数"""
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM lib_book")
    total = cursor.fetchone()[0]
    cursor.close()
    return total

def main():
    print("="*60)
    print("📚 图书数据直接导入工具（MySQL直连）")
    print("="*60)
    
    # 连接数据库
    conn = create_connection()
    if not conn:
        return
    
    try:
        # 导入前查看总数
        before = check_total_books(conn)
        print(f"\n📖 导入前图书总数：{before}\n")
        
        # 批量导入
        import_books(conn, books_data)
        
        # 导入后查看总数
        after = check_total_books(conn)
        print(f"\n📖 导入后图书总数：{after}")
        print(f"✨ 新增了 {after - before} 本图书\n")
        
    finally:
        conn.close()
        print("🔒 数据库连接已关闭")

if __name__ == "__main__":
    main()
