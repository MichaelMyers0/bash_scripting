#!/bin/sh
suffix="_suffix"
prefix="prefix_"
num_of_args=2
check_args()
{
        _args_num=$1
        if [ $_args_num -ne $num_of_args ];then
                echo "ERROR: Provide arguments"
                return 1
        fi
        return 0
}
check_result()
{
	_args_num=$1
	if [ $_args_num -ne 0 ];then
		echo "Failed to rename file"
		return 1
	fi
	return 0
}
if check_args $#;then
	case $2 in
		suffix)
			mv $1 $1$suffix 
			if check_result $?;then
				exit 2
			fi
			;;
		prefix)
			mv $1 $prefix$1
			if check_result $?;then
				exit 3
			fi
			;;
	esac
fi
exit 0
