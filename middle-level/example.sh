fileList=`ls $PWD`

# echo $fileList

# 특정 디렉토리에 특정 파일 있는지 확인
if [ -e 'example.sh' ]
then
    echo '"example.sh" file Exists'
fi

if [ ! -e 'example.shs' ]
then
    echo '"example.shs" file Not Exists'
fi

# 특정 디렉토리에 특정 파일에 문자열 있는지 확인
find_string=letter_of_alphabet
for file in $fileList
do
    if [[ -n `grep "$find_string" $file` ]]
    then
        echo $find_string' exist in '$file
    else
        echo $find_string' not exist in '$file
    fi

    # echo $file
done