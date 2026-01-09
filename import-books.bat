@echo off
docker cp sql\books_data_200.sql library-mysql:/docker-entrypoint-initdb.d/zz_books_200.sql
docker exec library-mysql mysql -uroot -proot -D ry-vue -e "source /docker-entrypoint-initdb.d/zz_books_200.sql"
echo Import complete!
pause
