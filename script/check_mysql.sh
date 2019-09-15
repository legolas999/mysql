#/bin/bash
USERNAME='root'
PASSWORD='Com.123456'
HOST='localhost'

#检测mysql server是否正常提供服务
mysqladmin -u${USERNAME} -p${PASSWORD} -h${HOST} ping

#获取mysql当前的几个状态值
mysqladmin -u${USERNAME} -p${PASSWORD} -h${HOST} status

#获取数据库当前的连接信息
mysqladmin -u${USERNAME} -p${PASSWORD} -h${HOST} processlist

#获取当前数据库的连接数
mysql -u${USERNAME} -p${PASSWORD} -h${HOST} -BNe "select host,count(host) from processlist group by host;" information_schema

#显示mysql的uptime
mysql -u${USERNAME} -p${PASSWORD} -h${HOST} -e "show status like '%uptime%'" | awk '/ptime/ {calc = $NF / 3600;print $(NF-1),calc"Hour"}'

# 查看数据库的大小
mysql -u${USERNAME} -p${PASSWORD} -h${HOST} -e "select table_schema,round(sum(data_length+index_length)/1024/1024,4) from information_schema.tables group by table_schema;"
