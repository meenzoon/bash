#!/bin/bash

#으로 시작하는 줄은 주석 - #!은 제외
# echo 이스케이프된 #이나 매개변수 치환/산술 상수 확장에 나오는 #은 주석을 나타내지 않음
echo '이 #은 주석 x'
echo ${PATH#*:}
echo $(( 2#101011 ))

# 명령어 구분자: ';'를 이용해 두 개 이상의 명령어를 한 줄에서 같이 쓸 수 있게 해줌

# case 옵션 종료자: ';;' => 이중 세미콜론을 이용해 case 종료
variable=( "abc" "cde" )
case "$variable" in
    abc) echo "$variable = abc" ;; 
    xyz) echo "$variable = xyz" ;;
esac

# dot 명령어

# partial quoting - 6장 참조

# full quoting - 6장 참조

# 콤마 연산자: 연속적인 산술 연산에 쓰임
let "t2 = ((a = 9, 15 / 3))" # "a"를 세트하고 "t2"를 계산`