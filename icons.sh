#!/bin/bash
# Daniel Nicolas Gisolfi

convert() {
    FILES=$(ls $1)

    for img in $FILES
    do
        name="${img%.*}" 
        inkscape "$1/$name.svg" --export-png="$2/$name.png"
    done
}

color() {
    grep -rl 'fill=\"#.*\"\/><g fill=\"#.*\"><path' ./test | xargs sed -i "s/fill=\"#.*\"\/><g fill=\"#.*\"><path/fill=\"#$2\"\/><g fill=\"#$1\"><path/g"
}

all() {
    THEMES=$(find . -type d \( ! -name steps \) -maxdepth 1)
    for theme in $THEMES ; 
    do
		svgtopng ./$theme/svg ./$theme/png
	done
}


case "$1" in
convert)
 convert $2 $3
 ;;
color)
 color $2 $3
 ;;
all)
 all
 ;;
*)
 echo $"Usage: $PROG { all | convert <in> <out> | color forground background }"
 exit 1
esac

exit 0