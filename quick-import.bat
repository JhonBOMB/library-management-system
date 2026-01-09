@echo off
chcp 65001 >nul
echo 开始导入图书数据...

REM 清理旧数据（保留前5条）
docker exec library-mysql mysql -uroot -proot ry-vue --execute="DELETE FROM lib_book WHERE book_id > 5"

REM 使用存储过程批量插入
docker exec library-mysql mysql -uroot -proot ry-vue --execute="SET NAMES utf8mb4; CREATE TEMPORARY TABLE IF NOT EXISTS temp_books (isbn VARCHAR(20), book_name VARCHAR(200), author VARCHAR(100), publisher VARCHAR(100), publish_date DATE, category_id BIGINT, price DECIMAL(10,2), qty INT, avail INT, loc VARCHAR(100)); INSERT INTO temp_books VALUES ('9787302476993','软件工程导论','张海藩','清华大学出版社','2018-01-01',1,59.00,10,8,'A-10'),('9787115390

411','Spring实战','Craig Walls','人民邮电出版社','2016-04-01',1,89.00,12,10,'A-11'),('9787121299698','Android开发艺术探索','任玉刚','电子工业出版社','2015-09-01',1,79.00,8,6,'A-12'); INSERT IGNORE INTO lib_book (isbn,book_name,author,publisher,publish_date,category_id,price,total_quantity,available_quantity,location,status,del_flag,create_by,create_time) SELECT isbn,book_name,author,publisher,publish_date,category_id,price,qty,avail,loc,'0','0','admin',NOW() FROM temp_books;"

echo 图书数据导入完成！
docker exec library-mysql mysql -uroot -proot ry-vue --execute="SELECT COUNT(*) as 总数 FROM lib_book"
pause
