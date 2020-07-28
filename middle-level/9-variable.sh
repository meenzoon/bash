:<<'END'
# 문자열 길이
stringZ=abcdABCD1234ABCDabcd


# 문자열 길이
echo ${#stringZ}
echo `expr length $stringZ`
echo `expr "$stringZ" : '.*'`
END
:<<'END'
# 문자열 시작에서부터 매칭되는 문자열조각(substring)의 길이
echo `expr match "$stringZ" 'abcd[A-Z]*.2'`
echo `expr "$stringZ" : 'abcd[A-Z]*.2'`


# 인덱스
echo `expr index "$stringZ" C12`
echo `expr index "$stringZ" bCA`


# 문자열 조각 추출
echo ${stringZ:7}
echo ${stringZ:3:2}

# 문자열 조각 삭제

# 문자열 조각 대치

END

a=letter_of_alphabet
letter_of_alphabet=z

echo

# 직접 참조.
echo "a = $a"

# 간접 참조.
eval a=\$$a
echo "이제 a = $a"

echo