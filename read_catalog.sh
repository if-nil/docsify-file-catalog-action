#!/bin/bash

indent=0

function print_indent() {
    for ((i=0; i<$indent; i++))
    do
        echo -n "  "
    done
}

function read_dir(){
    for file in `ls $1 | sort -d`
    do
        if [ -d $1"/"$file ]
        then
            print_indent
            echo "- $file"
            indent=$((indent+1))
            read_dir $1"/"$file
            indent=$((indent-1))
        else
            if [[ $file == *.md ]]
            then
                filename=${file%.md}
                print_indent
                echo "- [$file]($1/$file)"
            fi
        fi
    done
}

read_dir .