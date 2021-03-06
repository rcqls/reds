#!/bin/bash

## default values
redroot="/home/user/red/red"
redargs=""
redmv=""
debug=""

## default depending on state an OS
# case $OSTYPE in
# 	darwin*)
# 		new_redroot="$HOME/Github/red"
# 		if [ -d $new_redroot ]; then  redroot=$new_redroot; fi
# 		;;
# 	linux*)
# 		new_redroot="$HOME/Github/red"
# 		if [ -d $new_redroot ]; then  redroot=$new_redroot; fi
# 	;;
# esac

new_redroot=""
if [ -f "red.r" ] && [ -f "compiler.r" ] && [ -d "environment/console" ];then
	new_redroot="$(pwd)"
elif [ "$RED_GTK_DIR" != "" ]; then
	new_redroot="$RED_GTK_DIR"
elif [ -d "$HOME/Github/red" ]; then
	new_redroot="$HOME/Github/red"
fi

if [ "$new_redroot" != "" ];then redroot=$new_redroot; fi


# cmd declaration
cmd=""

# get options 
while true 
do 
	cmd=$1
	case $cmd in
	--DEBUG)
		debug="ok"
		shift
		;;
	--root)
		shift
		redroot=$1
		shift
		;;
	--mv)
		shift
		redmv=$1
		if [ "$redmv" = "std" ];then
			for dir in /home/user/work/.RedGTK ${HOME}/.RedGTK
			do
				if [ -d $dir ];then redmv="$1";fi
			done 
		fi
		shift
		;;
	-c|--compile|-d|--debug|--debug-stabs|-dlib|--dynamic-lib|-e|--encap|-h|--help|-r|--release|-s|--show-expanded|-u|--update-libRedRT|-V|--version|--no-runtime|--red-only)  
		redargs="$redargs $1"
		shift
		;;
	-t|--target|-o|--output|-v|--verbose|--config)
		redargs="$redargs $1 $2"
		shift;shift
		;;
	build)
		redargs="$redargs $1"
		shift
		if [ "$1" = "libRed" ];then 
			redargs="$redargs $1"
			cp -R ${redroot}/libRed .
			rm libRed/libRed.bas libRed/README.md 
			shift
			if [ "$1" = "[stdcall]" ];then
				redargs="$redargs $1"
			fi
		fi
		break
		;;
    clear)
		redargs="$redargs"
		break
		;;
	*) # cmd is then the redfile
		redfile="$1"
		break
		;;
	esac

done

if [ "$debug" != "" ];then
	echo "<redargs=[$redargs]|redfile=[$redfile]>"
fi

if [ "$redfile" != "" ];then
	redfile="%${redfile}"
fi

echo "Rebol[] do/args %${redroot}/red.r \"${redargs} ${redfile}\"" | rebol +q -s

if [ "$redmv" != "" ]; then
	basename=$(basename ${redfile})
	redfilebin="${basename%.*}"
	if [ -f $redfilebin ]; then
		mkdir -p $redmv
		mv $redfilebin $redmv/
	fi
fi