# 중급 단계

## 목록
1. [**변수 재검토**](#1-변수-재검토)
2. [**루프와 분기**](#2-루프와-분기)
3. [**내부 명령어**](#3-내부-명령어)

___

## 1. 변수 재검토
### 내부 변수
- $BASH: Bash 실행 파일 경로, 보통 /bin/bash  
- $BASH_ENV: 스크립트가 실행될 때 어디에서 bash 시작 파일을 읽을 것인지를 나타내는 환경변수


### 문자열 조작
- 사용되는 기본 문자열
```
stringZ=abcdABCD1234ABCDabcd
```

- 문자열 길이  
  * ${#string}  
  * expr length $string  
  * expr "$string" : '.*'  
```
echo ${#stringZ}              # 20
echo `expr length $stringZ`   # 20
echo `expr "$stringZ" : '.*'` # 20
```

- 문자열 시작에서부터 매칭되는 문자열조각(substring) 길이  
  * expr match "$string" '$substring'  
  * expr "$string" : '$substring'  
```
echo `expr match "$stringZ" 'abcd[A-Z]*.2'` # 10
echo `expr "$stringZ" : 'abcd[A-Z]*.2'`     # 10
```

- 인덱스  
  * expr index $string $substring  
  * $string에서 일치하는 $substring 의 첫 문자의 위치
```
echo `expr index "$stringZ" C12` # 7
echo `expr index "$stringZ" bCA` # 2
```

- 문자열 조각 추출  
  * $string의 $position부터의 문자열 조각을 추출
  * ${string:position}
  * ${string:position:length}
```
echo ${stringZ:7}
echo ${stringZ:3:2}
```

- 문자열 조각 삭제

```

```

- 문자열 조각 대치  

```

```

### 매개변수 치환


### 변수 타입 지정


### 변수 간접 참조


### 랜덤한 정수 만들기


### 이중소괄호



&#9650; [위로](#중급-단계)
___

## 2. 루프와 분기
### 루프
- for(in) 루프  
  * 사용법  
for [condition]  
do  
&emsp;command  
done  
```
for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do 
    echo $planet
done
```
- while  
  * 특정 조건을 확인하면서 그 조건이 참일 경우 루프 실행  
  * 사용법  
while [condition]  
do  
&emsp;command  
done 
```
start=0
end=10
while [ "$start" -lt "$end" ]
do
    echo -n "$start"
    ((start++))
done
```
- until  
  * 특정 조건을 확인하면서 그 조건이 거짓열 경우 루프 실행(while 반대)  
  * 사용법  
until [condition-is-true]  
do  
&emsp;command  
done 
```
until [ "$var1" = end ]
do
    echo "변수값을 넣으세요 #1"
    echo "(끝내려면 end)"
    read var1
    echo "변수 #1 = $var1"
done
```

### 루프 제어
- break
  * 자신이 속해 있는 루프 종료
- continue
  * 해당 루프 사이클 내에 남아 있는 나머지 명령어들을 건너 뛰고 다음 단계 루프 수행

### 테스트와 분기
- case
  * 사용법:  
    case "$variable" in  
    &emsp;"$condition1" ) command;;  
    &emsp;"$condition2" ) command;;  
    esac
```
variable=( "abc" "cde" )
case "$variable" in
    abc) echo "$variable = abc" ;; 
    xyz) echo "$variable = xyz" ;;
esac
```

- select
  * select는 Korn 쉘에서 따온 것인데 메뉴를 만들때 쓸 수 있습니다.
  * 사용법:  
    select variable [in list]  
    do  
    &emsp;command...  
    &emsp;break  
    done  
```
PS3='Choose your favorite vegetable: '

echo

select vegetable in "bean" "carrot" "potato" "onion"
do
  echo
  echo "your favorite vegetable is '$vegetable'"
  echo
  break
done

exit 0
```
&#9650; [위로](#중급-단계)
___

## 3. 내부 명령어