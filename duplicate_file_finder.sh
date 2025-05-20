#!/bin/sh
num_of_args=2
check_args()
{
	_args=$1
	if [ $_args -ne $num_of_args ];then
		echo "ERROR: Provide a filename"
		return 1
	fi
	return 0
}
if check_args $#;then
	cd $2
	sz1=`stat -c %s $1`
	for loop in `ls`
	do
		sz2=`stat -c %s $loop`
		if [ $sz1 = $sz2 ];then
			echo "Might be a duplicate"
		fi
	done
fi
exit 0
