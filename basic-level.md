# 기초 단계

## 목록
1. [**종료와 종료 상태**](#1-종료와-종료-상태)
2. [**특수 문자**](#2-특수-문자)
3. [**변수**](#3-변수)
4. [**quoting**](#4-quoting)
5. [**테스트**](#5-테스트)
6. [**연산자**](#6-연산자)

___

## 1. 종료와 종료 상태
### 
- 
    ```
    ```

&#9650; [위로](#기초-단계)
___

## 2. 특수 문자


&#9650; [위로](#기초-단계)
___

## 3. 변수


&#9650; [위로](#기초-단계)
___

## 4. quoting


&#9650; [위로](#기초-단계)
___

## 5. 테스트
- if/then/else if/else
    ```
    if [ 0 ]
    then
        echo "number: 0"
    elif [ 1 ]
        echo "number: 1"
    else
        echo "0도 아니고 1도 아님"
    fi
    ```
- 파일 테스트 연산자

    | 옵션값     | 설명     |
    |-----------|---------|
    | -e        | 존재하는 파일 |
    | -f        | 보통 파일(디렉토리나 디바이스 파일이 아님) |
    | -s        | 파일 크기가 0이 아님 |
    | -d        | 파일이 디렉토리 |
    | -b        | 파일이 블럭 디바이스(플로피나 시디롬 등등) |
    | -c        | 파일이 문자 디바이스(키보드, 모뎀, 사운드 카드 등등) |
    | -p        | 파일이 파이프 |
    | -h        | 파일이 심볼릭 링크 |
    | -L        | 파일이 심볼릭 링크 |
    | -S        | 파일이 소켓 |
    | -t        | 파일 디스크립터가 터미널 디바이스와 연관이 있음 |
    | -r        | 테스트를 돌리는 사용자가 읽기 퍼미션을 갖고 있음 |
    | -w        | 테스트를 돌리는 사용자가 쓰기 퍼미션을 갖고 있음 |
    | -x        | 테스트를 돌리는 사용자가 실행 퍼미션을 갖고 있음 |
    | -g        | 파일이나 디렉토리에서 set-group-id 플래그가 세트되어 있음 |
    | -u        | 파일에 set-user-id 플래그가 세트되어 있음 |
    | -k        | sticky bit가 세트 |
    | -O        | 자신이 소유자 |
    | -G        | 그룹 아이디가 자신과 같음 |
    | -N        | 마지막으로 읽힌 후에 변경 됐음 |
    | f1 -nt f2 | f1 파일이 f2파일보다 최신임 |
    | f1 -ot f2 | f1 파일이 f2파일보다 예전것임 |
    | f1 -ef f2 | f1 파일과 f2 파일이 같은 파일을 하드 링크하고 있음 |
    | !         | 조건이 안 맞으면 참 |

- 정수 비교

    | 옵션값     | 설명     |
    |-----------|---------|
    | -eq       | 같음 |
    | -ne       | 같지 않음 |
    | -gt       | 더 큼 |
    | -ge       | 더 크거나 같음 |
    | -lt       | 더 작음 |
    | -le       | 더 작거나 같음 |
    | <         | 더 작음(이중 소괄호에서) |
    | <=        | 더 작거나 같음(이중 소괄호에서) |
    | >         | 더 큼(이중 소괄호에서) |
    | >=        | 더 크거나 같음(이중 소괄호에서) |

- 문자열 비교

    | 옵션값     | 설명     |
    |-----------|---------|
    | = | 같음 |
    | == | =와 동의어 |
    | != | 같지 않음 |
    | < | 아스키 알파벳 순서에서 더 작음 |
    | > | 아스케 알파벳 순서에서 더 큼 |
    | -z | 문자열이 "null" |
    | -n | 문자열이 "null"이 아님 |

- 복합 비교

    | 옵션값     | 설명     |
    |-----------|---------|
    | -a        | 논리 and |
    | -o        | 논리 or  |


&#9650; [위로](#기초-단계)
___

## 6. 연산자
### 연산자
- 할당 연산자
  * =  : 변수 할당(다음에 빈 칸이 들어가면 안 됨)

- 산술 연산자  
  * +  : 더하기  
  * -  : 빼기
  * *  : 곱하기
  * /  : 나누기
  * % : 정수 나누기 나머지 값
  * +=, -=, *=, /=, %=
  * ** : 제곱 연산자
    ```
    let "z=5**3"
    echo "z = $z" # 125
    ```

- 비트 연산자
  * <<  : left-shift
  * <<= : left-shift-equal
    ```
    let "var <<= 2" # var를 2비트만큼 왼쪽으로 쉬프트(4를 곱하는 것과 동일)
    ```
  * \>\>  : right-shift
  * \>\>= : right-shift-equal
  * &   : AND
  * &=  : AND-equal
  * |   : OR
  * |=  : OR-equal
  * ~   : negate
  * !   : NOT
  * ^   : XOR
  * ^=  : XOR-equal

- 논리 연산자
  * && : and
  * || : or

- 기타 연산자
  * , : comma 연산자, 두 개 이상의 산술 연산의 묶음, 이 연산자로 묶인 모든 연산은 부효과가 생길 가능성을 가지고 평가되고 제일 마지막 연산의 결과만 리턴

&#9650; [위로](#기초-단계)
___
