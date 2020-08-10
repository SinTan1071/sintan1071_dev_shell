del() {
    for file in `ls -a $1`
    do
        if [ -d $1"/"$file ]
        then
            if [[ $file != '.' && $file != '..' ]]
            then
                del $1"/"$file
            fi
        else
            if [[ $file != 'del.sh' ]]
            then
                echo "deleting $file ..."
                rm $1"/"$file
            fi
        fi
    done
}

del $(pwd)
