#!/bin/sh
#provide a directory name
#in that directory sort every file based on it`s suffix, and move each file into a correct directory. E.g C files in C directory
#and e.t.c
C_SUFFIX=".c"
TXT_SUFFIX=".txt"
C_DIR="c_dir"
BACK_SLASH="/"
check_num_of_args()
{
	_args=$1
	if [ "$_args" -lt 1 ];then
		echo "ERROR: Provide directory name"
		return 1
	fi
	return 0
}
creat_dir_for_c_files()
{
	_dir_name=$1
	mkdir $_dir_name
	if [ $? -ne 0 ];then
		echo "`basename: $0` failed to create a directory">$2
		return 2
	fi
}
sort_file()
{
	_fname=$1
	_start_index=1
	_length=1
	_len=${#_fname}
	while [ $_length -lt $_len ]
	do
		if [ `expr substr $_fname $_start_index $_length` = "$C_SUFFIX" ]; then
			echo "We found a file"
			cp $_fname $2"$BACK_SLASH"$_fname
			return 0
		else
			_start_index=`expr $_start_index + 1`
			_length=`expr $_length + 1`
		fi
	done
}
path=$1"$BACK_SLASH"$C_DIR
if check_num_of_args $#; then
	echo "Ok. We will continue soon"
	creat_dir_for_c_files $1"$BACK_SLASH"$C_DIR
	for loop in `ls $1`
	do
		if sort_file $loop $path ;then
			continue
		fi
	done
else
	exit 1
fi
exit 0
