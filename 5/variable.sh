#!/bin/bash
## 변수 치환
a=375

# $variable은 ${variable}을 짧게 쓴 표현
echo $a
echo ${a}  # 위 명령어와 동일

hello="A B  C    D"
echo $hello
echo "$hello"
# 변수를 quoting 해주면 공백문자 보존

hello=  # 널 값을 가지도록 세팅
# 변수에 null을 세팅하는 것과 unset 하는 것은 결과는 같지만 엄연히 다름 - 다음 참조


## 변수 할당(Variable Assignment)
# = : 할당 연산자(앞 뒤에 공백이 있으면 안 됨)

## 특수한 변수 타입
# 환경 변수: 쉘의 동작과 사용자 인터페이스에 영향을 미치는 변수

# 위치 매개변수: 명령어줄에서 스크립트로 넘어온 인자들 - $0: 스크립트 이름, $1: 첫 번째 인자: $10부터는 ${10} 형태로 표현해야함
# ./scriptname 1 2 3 4 5 6 7 8 9 10

echo $0
echo $1