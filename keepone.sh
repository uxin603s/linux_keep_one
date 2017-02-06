PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin; export PATH
relpace_space=`echo "$@" | sed "s/\s/[[:space:]]/g" `
#去除空白
count_run=`ps axu |grep "$relpace_space" |grep -v "$0"  |grep -v grep -c`
#統計執行緒(不包含grep和自己)
echo $count_run
if [ $count_run == 0 ];then	
	echo "可執行"
	echo "$@"
	$@
else
	echo "無法執行，有相同執行緒"
fi
