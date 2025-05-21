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
	if [ $? -ne 0 ]; then
		echo "ERROR: Failed to change a directory"
		exit 2
	fi
	sz1=`stat -c %s $1`
	for loop in `ls`
	do
		if [ $loop = $1 ];then
			continue
		fi
		sz2=`stat -c %s $loop`
		if [ $sz1 = $sz2 ];then
			echo "$loop is might be a duplicate of a file $1"
		fi	
		read -r line1 < $1
		read -r line2 < $loop
		if [ $line1 = $line2 ];then
			echo "$loop is definetly is a duplicate of file $1"
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
