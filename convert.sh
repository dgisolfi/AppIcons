#!/bin/bash
# Daniel Nicolas Gisolfi

all() {
    THEMES=$(find . -type d \( ! -name steps \) -maxdepth 1)
    for theme in $THEMES ; 
    do
		svgtopng ./$theme/svg ./$theme/png
	done
}

svgtopng() {
    FILES=$(ls $1)

    for img in $FILES
    do
        name="${img%.*}" 
        inkscape "$1/$name.svg" --export-png="$2/$name.png"
    done
}

case "$1" in
png)
 svgtopng $2 $3
 ;;
all)
 all
 ;;
*)
 echo $"Usage: $PROG { png | all <in> <out>}"
 exit 1
esac

exit 0