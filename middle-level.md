# 중급 단계

## 목록
1. [**변수 재검토**](#1-변수-재검토)
2. [**루프와 분기**](#2-루프와-분기)
3. [**내부 명령어**](#3-내부-명령어)
4. [**외부 필터, 프로그램, 명령어**](#4-외부-필터,-프로그램,-명령어)
5. [**시스템과 관리자용 명령어**](#5-시스템과-관리자용-명령어)
6. [**명령어 치환**](#6-명령어-치환)
7. [**산술 확장**](#7-산술-확장)
8. [**I/O 재지향**](#8-I/O-재지향)
9. [**Here Documents**](#9-Here-Documents)
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
  * ${string#substring}: $string의 앞 부분에서부터 가장 짧게 일치하는 $substring을 삭제
  * ${string##substring}: $string으 이파 부분에서부터 가장 길게 일치하는 $substring을 삭제

  ```
  stringZ=abcABC123ABCabc
  echo ${stringZ#a*C} #123ABCabc - 'a'와 'C' 사이에서 가장 짧게 일치되는 부분을 삭제
  echo ${stringZ##a*C} #123ABCabc - 'a'와 'C' 사이에서 가장 길게 일치되는 부분을 삭제
  ```
  * ${string%substring}: $string의 뒷 부분에서부터 가장 짧게 일치하는 $substring을 삭제
  * ${string%%substring}: $string의 뒷 부분에서부터 가장 길게 일치하는 $substring을 삭제
  ```
  stringZ=abcABC123ABCabc

  echo ${stringZ%b*c} # abcABC123ABCa
  # $stringZ의 뒷 부분부터 계산해서 'b'와 'c' 사이에서 가장 짧게 일치하는 부분을 삭제.

  echo ${stringZ%%b*c} # a
  # $stringZ의 뒷 부분부터 계산해서 'b'와 'c' 사이에서 가장 길게 일치하는 부분을 삭제.
  ```

- 문자열 조각 대치  
  * ${string/substring/replacement}: 처음 일치하는 $substirng을 $replacement로 대치
  * ${string//substring/replacement}: 일치하는 모든 $substirng을 $replacement로 대치
  ```
  stringZ=abcABC123ABCabc

  echo ${stringZ/abc/xyz} # xyzABC123ABCabc
  # 처음 일치하는 'abc'를 'xyz'로 대치.

  echo ${stringZ//abc/xyz} # xyzABC123ABCxyz
  # 일치하는 모든 'abc'를 'xyz'로 대치.
  ```
  * ${string/#substring/replacement}: $substring이 $string의 맨 앞에서 일치하면 $replacement로 대치
  * ${string/%substring/replacement}: $substring이 $string의 맨 뒤에서 일치하면 $replacement로 대치
  ```
  stringZ=abcABC123ABCabc

  echo ${stringZ/#abc/xyz} # XYZABC123ABCabc
  # 맨 앞에서 일치하는 'abc'를 'XYZ'로 대치.

  echo ${stringZ//abc/xyz} # abcABC123ABCXYZ
  # 맨 뒤에서 일치하는 'abc'를 'XYZ'로 대치.
  ```

### 매개변수 치환
- 변수 조작/확장
  * ${parameter}: 변수 parameter 값

  * ${parameter-default}: 매개변수가 없으면 default 값 사용

  * ${parameter=default}, ${parameter:=default}: 매개변수가 세트되어 있지 않다면 기본값으로 세트

  * ${parameter+alt_value}, ${parameter:+alt_value}: 매개변수가 세트되어 있다면 alt_value를 쓰고 아니라면 널 스트링을 씁니다.

  * ${parameter?err_msg}, ${parameter:?err_msg}: 매개변수가 세트되어 있으면 그 값을 쓰고 아니라면 err_msg를 출력

- 변수 길이/문자열 조각(substring) 삭제
  * ${#var}
    + 문자열 길이
    + ${#*}, ${#@} 는 위치 매개변수의 갯수 출력
    + 배열에 대해${#array[*]} 나 ${#array[@]} 라고 하면 배열 요소의 개수 출력
    ```

    ```

  * ${var#pattern}, ${var##pattern}: $pattern이 $var의 앞 부분과 가장 길거나 가장 짧게 일치한느 부분을 삭제
    ```

    ```

  * ${var%pattern}, ${var%%pattern}: $pattern이 $var의 뒷 부분과 가장 짧거나 가장 길게 일치하는 부분을 삭제

- 변수 확장/문자열 조각 대치
  * ${var:pos}: var 변수가 pos offset 부터 시작하도록 확장

  * ${var:pos:len}: var 변수가 post에서 최대 len만큼의 길이를 갖도록 확장

  * ${var/patt/replacement}: var에 첫번째로 일치하는 patt를 replacement로 변경

  * ${var//patt/replacement}: var에서 일치하는 모든 patt을 replacement로 변경

  * ${var/#patt/replacement}: var의 prefix가 patt와 일치하면 replacement로 변경

  * ${var/%patt/replacement}: var의 suffix가 patt와 일치하면 replacement로 변경

  * ${!varprefix*}, ${!varprefix@}: 이미 선언된 변수들 중에 varprefix로 시작하는 변수들

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
### I/O
- echo: 변수나 표현식을 표준출력으로 출력

- printf: 형식화된 출력을 해주는 명령어로서, echo의 확장판
  ```
    printf "%s %s \n" "안녕들 하신가," "지구인 여러분"
    # "안녕들 하신가, 지구인 여러분"
  ```

- read: 변수값을 표준입력에서 읽어 들입니다. 즉 키보드에서 사용자의 입력을 받아 처리

### 파일 시스템
- cd: 디렉토리 이동 명령어

- pwd: 현재 작업 디렉토리 출력

- pushd: dir-name을 디렉토리 스택에 넣고 동시에 현재 디렉토리를 그 디렉토리로 옮겨주는 명령어

- popd: 디렉토리 스택의 제일 위에 있는 디렉토리르 지우고 동시에 현재 디렉토리를 그 디렉토리로 이동

- dirs: 디렉토리 스택의 목록을 출력

### 변수
- let: let명령어는 변수에 대해서 산술 연산 수행

- eval
  * eval arg1 [arg2] ... [argN]
  * 목록에 들어 있는 인자를 명령어로 변환

- set: 내부 스크립트 변수값을 바꿔주는 명령어

- unset: 쉘 변수를 효과적으로 null로 세트해서 그 변수를 지우는 효과

- export: 현재 실행중인 스크립트나 쉘의 모든 자식 프로세스가 변수를 사용할 수 있게 하는 명령어

- declare, typeset: 변수의 특성을 지정하거나 제한

- readonly: 상수 전용 변수 선언

- getopts: 명령어 줄에서 스크립트로 넘어온 argument 파싱

### 스크립트 동작
- source: 해당 스크립트를 실행하는 명령어

- exit: 스크립트 무조건 종료

- exec: 현재의 프로세스를 주어진 명령어로 대치

- shopt: 쉘이 실행중에 옵션을 바꿀 수 있게 하는 명령어

### 작업 제어 명령어
- jobs: 백그라운드로 돌고 있는 작업들을 작업 번호와 함께 출력

- disown: 쉘의 활성화 작업 테이블에서 특정 작업 삭제

- fg, bg
  * fg: 백그라운드에서 실행중인 작업을 포그라운드로 전환
  * bg: 중지되어 있던 작업을 백그라운드로 실행

- wait: 백그라운드로 실행중인 모든 작업이나 옵션으로 주어진 특정 작업 번호나 프로세스 아이디가 끝날때까지 스크립트 실행 중단

- suspend: Control-Z와 비슷한 효과, 쉘 suspend

- logout: 로그인 쉘 종료

- times: 명령어를 실행하는 데 쓰인 시스템 시간에 대한 통계 정보 출력

- kill: 실행중인 프로세스 강제 종료


&#9650; [위로](#중급-단계)
___

## 4. 외부 필터, 프로그램, 명령어
### 기본 명령어
- ls: 파일 목록을 보여주는 기본 명령어
  | 옵션값     | 설명     |
  |-----------|---------|
  | -R        | 하위 디렉토리까지 출력  |
  | -s        | 파일 크기순 정렬       |
  | -t        | 파일 변경 시간으로 정렬 |
  | -i        | 파일의 inode를 출력   |
- cat, tac  
  * cat: concatnate에서 따온 말로 파일을 표준출력으로 뿌려준다. 보통 재지향과 같이 써 여러 파일을 한 파일로 만들어 줍니다.
  | 옵션값     | 설명     |
  |-----------|---------|
  | -n        | 모든 줄 앞에 줄번호를 붙임 |
  | -b        | 빈 줄이 아닌 줄에만 줄번호를 붙임 |
  | -v        | 출력할 수 없는 문자들을 ^ 표기법으로 출력  |
  ```
    cat filename cat file.1 file.2 file.3 > file.123
  ```
  * tac: cat과 반대로 파일 끝에서부터 거꾸로 보여주는 명령어  
- rev: 파일의 각 줄을 거꾸로 뒤집어 표준출력으로 내보냅니다. tac와 다른 점은 줄의 순서는 그대로 살리고 각 줄을 줄 끌에서 줄 처음으로 뒤집는다는 것
  ```
  bash$ cat file1.txt
  This is line 1.
    This is line 2.

  bash$ tac file1.txt
  This is line 2.
    This is line 1.

  bash$ rev file1.txt
  .1 enil si siht
    .2 enil si siht
  ```
- cp: 파일 복사 명령어

- mv: 파일 이동 명령어

- rm: 파일을 삭제, -f 옵션은 읽기 전용 파일도 강제로 삭제

- rmdir: 디렉토리 삭제

- mkdir: 디렉토리 만들기

- chmod: 파일 속성 변경

- chattr: 파일 속성 변경, chmod와 같은 역할이지만 문법이 약간 다르고 ext2 파일 시스템에서만 동작

- ln: 파일에 대한 링크를 만들어 주는 명령어

### 복잡한 명령어
- find: 파일을 찾아내는 명령어  
  find (옵션) [찾을 위치] (EXPRESSION)
    
    | 옵션 | 설명     |
    |------|---------|
    | -P | 심볼릭 링크를 따라가지 않고, 심볼릭 링크 자체 정보 사용              |
    | -L | 심볼릭 링크에 연결된 파일 정보 사용                                |
    | -H | 심볼릭 링크를 따라가지 않으나, Command Line Argument 처리 시는 예외 |
    | -D | 디버그 메시지 출력                                              |

    | EXPRESSION | 설명     |
    |------------|---------|
    | -name      | 지정된 문자열 패턴에 해당하는 파일 검색 |
    | -empty     | 빈 디렉토리 또는 크기가 0인 파일 검색 |
    | -delete    | 검색된 파일 또는 디렉토리 삭제 |
    | -exec      | 검색된 파일에 대해 지정된 명령 실행 |
    | -path      | 지정된 문자열 패턴에 해당하는 경로에서 검색 |
    | -print     | 검색 결과를 출력. 검색 항목은 newline으로 구분 |
    | -print0    | 검색 결과를 출력. 검색 항목은 null로 구분 |
    | -size      | 파일 크기를 사용하여 파일 검색 |
    | -type      | 지정된 파일 타입에 해당하는 파일 검색 |
    | -mindepth  | 검색을 시작할 하위 디렉토리 최소 깊이 저장 |
    | -maxdepth  | 검색할 하위 디렉토리의 최대 깊이 지정 |
    
    ```
      find ~/ -name '*.txt'
      # '~/' 위치에 있는 txt 파일 타입 찾기
      
    ```

- xargs: 명령어에 인자들을 필터링해서 넘겨주고 그 명령어를 다시 조합하는데 쓸 수도 있습니다.
    ```
      ls | xargs -n 8 echo 
      # 현재 디렉토리의 파일들을 한 줄에 8개씩 끊어서 보여줍니다.
    ```

- expr: 주어진 연산에 따라 자동으로 계산하거나 평가합니다. 이 때 인자는 빈칸으로 분리되야 합니다. 산술, 비교, 문자열, 논리 연산등이 가능
  ```
    expr 3 + 5  #return 8
    expr 5 % 3  #return 2 
    y=`expr $y + 1`  #변수값 증가
    z=`expr substr $string $position $length`  #$string의 $position에서 부터 $length만큼의 문자열조각($substring)을 추출해 냄
  ```

### 시간/날짜 명령어
- date: 날짜와 시간을 표준 출력으로 보여준다.
  ```
    bash$ date +%Y
    2020

    bash$ date +%s #+%s는 UNIX_TIMESTAMP 형식으로 시간 출력
    1595899384
  ```

- zdump: 주어진 타임 존에 해당하는 시간을 에코

- time: 명령어 실행 시간에 대한 아주 자세한 통계들을 보여줍니다.

- touch: 파일에 대한 접근/수정 시각을 현재 시각이나 특정한 시각으로 바꿔 주는 유틸리티

- at: 주어진 명령어들을 특정시간에 수행하며, crontab과 다른 점은 한 번만 수행하려고 할 때 주로 사용

- batch: at와 비슷한 작업 제어 명령어지만 다른 점은 시스템 부하가 0.8 이하인 경우에만 명령어들을 실행

- cal: 깔끔한 형태의 월별 달력을 표준출력으로 출력합니다. 현재를 비롯해 아주 먼 과거나 미래도 보여줍니다.

- sleep: argument로 주어진 초시간 동안 아무일도 안 하면서 멈추어 있습니다.

- usleep: sleep과 같은 역할이지만 micro second 단위로 동작

- hwclock, clock: 시스템의 하드웨어 클럭을 읽거나 조절해 줍니다. clock 명령어는 hwclock과 동의어

### 텍스트 처리 명령어
- sort

- tsort

- diff, patch

- diff3

- sdiff
  
- cmp

- comm
  
- uniq

- expand, unexpand

- cut

- colrm

- paste

- join

- head

- tail

- grep

- look

- sed

- awk

- wc

- tr

- fold

- fmt

- ptx

- column

- nl

- pr

- gettext

- iconv

- recode

- groff, gs, TeX

- lex, yacc

### 파일, 아카이브(archive) 명령어
  #### archiving
- tar: 유닉스 표준 아카이브 유틸리티  

    | 옵션값    | 설명     |
    |----------|---------|
    | -c       | 새 아카이브 만들기 |
    | --delete | 지우기(아카이브에 들어있는 파일) |
    | -r       | 덧붙이기(파일을 아카이브로) |
    | -t       | 목록(아카이브 내용) |
    | -u       | 아카이브 업데이트 |
    | -x       | -x 뽑아내기(아카이브에 들어있는 파일) |
    | -z       | 아카이브를 gzip으로 압축          |
    <br>

- shar: 쉘 아카이브 유틸리티. 쉘 아카이브 파일은 실제로는 #!/bin/sh 헤더와 아카이브를 풀기 위한 명령어들로 이루어진 쉘 스크립트로써, 압축되지 않은 파일들이 쭉 붙어 있는 파일입니다. shar 아카이브는 아직도 인터넷 뉴스 그룹에서 볼 수 있는데 여기 말고 다른 곳에서는 tar/gzip 때문에 거의 안 씁니다. shar 아카이브는 unshar 명령어로 풀어 줍니다.
  
- ar: 주로 바이너리 오브젝트 파일 라이브러리에서 쓰이는 아카이브를 위한 생성,조작 유틸리티
  
- cpio: tar/gzip 때문에 이제 거의 안 쓰이지만 디렉토리 트리를 옮기려는 경우 등의 쓰임새가 아직 남아 있음

  #### 압축
- gzip: 표준 GNU/UNIX 압축 유틸리티로서, 성능이 떨어지고 특허가 걸려있는 compress를 대신한다.

- bzip2: 크기가 큰 파일에 대해서는 gzip보다 효율적인 압축 유틸리티

- compress, uncompress: 상용 유닉스 배포판에서 찾을 수 있는 오래되고 특허가 걸려있는 유틸리티, 대부분 gzip으로 바뀌었음

- sq: 정렬된 아스키 낱말 목록에 대해서만 동작하는 필터

- zip, unzip: 도스의 PKZIP과 호환되는 크로스 플랫폼 파일 아카이빙 및 압축 유틸리티

  #### 파일 정보
- file: 파일 종류를 구분지어 주는 유틸리티

- which: 시스템에 특정 명령어나 유틸리티가 설치되어 있는지 알아내려고 할 때 유용

- whereis: whichis와 유사하지만 전체 경로명도 같이 알려준다.

- whatis: 시스템 명령어와 중요한 설정 파일을 확인하고 싶을때 유용

- vdir: 자세한 디렉토리 목록

- shred: 파일을 지우기 전에 랜덤 비트 패턴을 여러번 덮어 써서 보안상 안전하게 삭제

- locate, slocate: locate는 자체 데이터베이스에서 파일을 찾아준다. slocate는 locate 보안 강화 버전

- strings: 바이너리나 데이터 파일안에서 사람이 읽을 수 있는 문자를 찾을 수 있습니다.

  #### 유틸리티
- basename: 파일명에서 경로 정보를 떼어내고 오직 파일이름만 보여준다.

- dirname: 파일명에서 basename을 떼어내고 오직 경로 정보만 보여준다.

- split: 한 파일을 작은 조각으로 나눠주는 유틸리티

- sum, cksum, md5sum: 체크섬을 생성해 주는 유틸리티

  #### 인코딩과 암호화
- uuencode: 바이너리 파일을 아스키 문자로 인코드해서 이메일을 보내거나 뉴스 그룹에 포스팅 할 때 제대로 전송될 수 있게 해준다.

- uudecode: uuencode된 파일을 decode 원래 바이너리 파일로 만들어준다.

  #### 기타 명령어
- make: 바이너리 패키지를 빌드 및 컴파일해주는 유틸리티, 소스 파일에서 추가 변경 사항이 발생하면 정해진 동작을 하도록 하는데 사용

- install: 특별한 목적을 갖고 있는 파일 복사 명령어로서 cp와 비슷하지만 복사될 파일의 소유권과 속성을 설정해 줄 수 있습니다.

- more, less: 텍스트 파일이나 스트림을 표준출력으로 한 번에 한 쪽씩 표시해주는 페이저, 스크립트의 출력을 위한 필터로도 사용 가능

### 통신 명령어


### 터미널 제어 명령어


### 수학용 명령어


### 기타 명령어



&#9650; [위로](#중급-단계)
___

## 5. 시스템과 관리자용 명령어
### 사용자와 그룹
  - chown: 파일의 소유자/그룹 변경
  
  - chgrp: 파일의 그룹 소유권을 변경

  - useradd, userdel: user 추가, 삭제

  - id: 현재 사용자의 실제 ID와 유효 사용자 ID, 그룹 ID를 출력

  - who: 시스템에 현재 로그인해 잇는 모든 사용자를 보여줍니다.

  - w: 로그인 되어 있는 사용자와 그 사용자와 관련된 모든 프로세스를 보여 줍니다. 이는 who의 확장 버전 w의 출력에 grep으로 파이프를 걸어서 특정한 사용자나 프로세스를 찾을 수 있습니다.

  - logname: 현재 사용자의 로그인 이름을 /var/run/utmp에서 찾아서 보여줍니다. whoami와 거의 동일한 명령어

  - su: 다른 사용자로 프로그램이나 스크립트를 실행 시킴

  - users: 로그인 하고 있는 모든 사용자 출력

  - ac: 사용자가 로그인 해 있던 시간을 /var/log/wtmp에서 읽어서 출력

  - last: 사용자가 마지막으로 로그인 한 시간을 /var/log/wtmp에서 읽어서 출력

  - groups: 현재 사용자가 속해 있는 그룹을 출력

  - newgrp: 로그아웃 없이 사용자의 그룹 ID를 변경


### 터미널
  - tty

  - stty

  - tset

  - setserial

  - getty, agetty

  - mesg

  - wall

  - dmesg

### 정보 및 통계
  - uname: 시스템 사양(OS, 커널 버전등)을 표준출력으로 보여준다.

  - arch: 시스템 아키텍처를 출력, uname -m과 동일한 명령어

  - lastcomm: /var/account/pacct 파일에 저장돼 있는 이전 명령어들에 대한 정보를 알려준다.

  - lastlog: 시스템의 모든 사용자가 마지막으로 로그인한 시간을 출력

  - lsof: 현재 열려 있는 파일 출력, 파이프르 통해 grep이나 awk로 넘겨서 파싱해서 분석할 수 있다.

  - strace: 시스템 콜과 시그널을 추적해서 진단하고 디버깅해 주는 도구

  - free: 메모리와 캐쉬 사용량을 탭이 들어간 형태로 출력

  - procinfo: /proc 가상 파일시스템에서 여러 정보와 통계를 뽑아내서 광범위하고 자세하게 출력

  - lsdev: 설치된 하드웨어 디바이스의 목록을 출력  
    (CentOS 7.6에서는 해당 명령어 사용 불가, 아래와 같은 형태로 사용)
    ```
    cat /proc/devices
    ```

  - du: 디스크의 파일 사용량을 재귀적으로 출력

  - df: 파일 시스템 사용량을 탭이 들어간 형태로 출력

  - stat: 주어진 파일에 대해서 자세한 통계 출력

  - vmstat: 가상 메모리 통계를 보여줌

  - netstat: 라우팅 테이블이나 활성화되어 있는 네트워크 연결같은 네트워크 통계와 정보를 출력

  - uptime: 시스템이 얼마나 오랫동안 돌고 있었는지 관련 통계와 함께 출력

  - hostname: 시스템의 호스트명 출력

  - hostid: 호스트 머신에 대한 32비트 16진수 구분자를 에코

### 시스템 로그
  - logger: 사용자가 만들어낸 메시지를 시스템 로그(/var/log/messages)에 추가

  - logrotate: 시스템 로그 파일들을 적당하게 로테이트 시키고, 압축하고, 지우고, 메일을 보내는 일들을 처리

### 작업 제어
  - ps: 프로세스 통계 출력

  - pstree: 현재 실행중인 프로세를 tree 형태로 출력, -p 옵션을 주면 PID까지 출력

  - top: cpu를 집중적으로 사용하는 프로세스를 중심으로 최신 정보 출력

  - nice: 백그라운드 작업의 우선순위를 바꿔줍니다. 우선순위는 19(제일 낮음)에서 -20(제일 높음)까지 인데, 오직 root만이 음수(높은) 우선순위를 줄 수 있습니다.

  - nohup: 사용자가 로그아웃을 하더라도 명령어가 계속 실행되게 해준다.

  - pidof: 실행중인 작업의 프로세스 ID(PID)를 식별

  - fuser: 어떤 파일이나, 파일 집합, 디렉토리에 접근하고 있는 프로세스를 PID로 식별

  - crond: 시스템 관리용 스케쥴러 프로그램으로, 시스템 로그 파일을 정리하고 지운다거나 slocate 데이터베이스를 업데이트 하는 등의 일을 해준다.

### 프로세스 제어 및 부팅
  - init: 모든 프로세스의 부모 프로세스, 시스템 부팅 과정의 제일 마지막에 불리면서 /etc/inittab을 읽어서 시스템의 런레벨을 결정, 오직 root만이 telinit으로 호출 가능

  - telinit: init을 가리키는 심볼릭 링크로서, 시스템 런레벨을 바꿀때 쓰는데 보통은 시스템 관리나 긴급하게 파일시스템을 수리해야 할 때 사용

  - runlevel: 현재와 바로저의 런레벨을, 시스템이 정지 상태인지(0), 단일 사용자 모드인지(1), 다중 사용자 모드인지(2나 3), X 윈도우 모드인지(5), 리부팅 중인지(6) 등으로 보여준다.

  - halt, shutdown, reboot: 보통 시스템 전원을 끄기 전에 시스템을 정지시키는 명령어들

### 네트워크
  - ifconfig: 네트워크 인터페이스 설정 및 튜닝 유틸리티

  - route: 커널 라우팅 테이블 정보를 보거나 바꾸는 명령어

  - chkconfig: 네트워크 설정을 체크

  - tcpdump: 네트워크 패킷 스니퍼

### 파일시스템
  - mount: 파일시스템 마운트

  - umount: 현재 마운트되어 있는 파일 시스템을 언마운트

  - sync, rsync: 버퍼에 들어 있는 최신 데이터를 하드 드라이브로 즉시 쓰게한다.

  - losetup: 루프백 디바이스를 설정

  - mkswap: 스왑 파티션이나 스왑 파일을 만들어 준다.

  - swapon, swapoff: 스왑 파티션이나 스왑 파일들을 활성화/비활성화 시킨다.

  - mke2fs: 리눅스 ext2 파일 시스템 생성

  - tune2fs: ext2 파일 시스템 튜닝 명령어

  - dumpe2fs: 아주 자세한 파일 시스템 정보를 표준출력으로 덤프

  - hdparm: 하드 디스크 매개변수를 보여주거나 수정 가능

  - fdisk: 보통은 하드드라이브일, 저장용 디바이스에 대해서 파티션 테이블을 만들고 변경할 수 있게 해준다.

  - fsck, e2fsck, debugfs: 파일 시스템 체크, 치료, 디버그용 명령어들

  - badblocks: 저장용 디바이스에 대해 badblock을 체크 해 주는 명령어

  - mkbootdisk: MBR이 깨진 상황등에서 시스템을 다시 살릴 수 있도록 부팅 디스켓을 만들어 주는 명령어

  - chroot: root 디렉토리를 바꿔주는 명령어

  - lockfile: 잠금 파일을 만들어주는 명령어

  - mknod: 블럭 디바이스나 문자 디바이스 파일 생성 명령어

  - tmpwatch: 특정 기간동안 접근이 없는 파일을 자동으로 삭제하는 명령어

  - MAKEDEV: 디바이스 파일을 만들어 주는 유틸리티

### 백업
  - dump: 디스크 파티션을 그대로 읽고 바이너리 형태로 백업 파일 생성

  - restore: dump로 백업된 파일들을 복구시켜주는 명령어

  - fdformat: 플로피 디스크에 대해 로우레벨 포맷을 해주는 명령어

### 시스템 리소스
  - ulimit: 시스템 리소스에 대해 최대 한계 지정

  - umask: 사용자 파일 생성 마스크

  - rdev: 루트 디바이스, 스왑 영역, 비디오 모드에 대한 정보를 얻거나 변경

### 모듈
  - lsmod

  - insmod

  - modprobe

  - depmod

### 기타 명령어들
  - env

  - ldd

  - strip

  - nm

  - rdist

&#9650; [위로](#중급-단계)
___

## 6. 명령어 치환
- 명령어 치환은 하나나 그 이상의 명령어의 출력을 재할당, 말그대로 한 명령어의 출력을 다른 문맥으로 연결

- 역따옴표를 사용하여 명령어 줄에서 사용할 수 있는 텍스트를 생성
```
textfile_listing=`ls *.txt` #현재 디렉토리의 모든 *.txt 파일의 이름을 담고 있는 변수
echo $textfile_listing

textfile_listing2=$(ls *.txt) #명령어 치환의 다른 형태
echo $textfile_listing2
```

&#9650; [위로](#중급-단계)
___

## 7. 산술 확장
- 문자열을 산술식으로 변환할 때는 역따옴표나 이중 소괄호, let을 써서 수행 가능
```
z=`expr $z + 3`

z=$(($z+3))
# $((EXPRESSION))은 산술 확장, 명령어 치환과 헷갈림 주의

let z=z+3
let "z += 3"
# quote를 해 주면 빈칸을 비롯해서 특수한 연산자의 사용이 가능
```

&#9650; [위로](#중급-단계)
___

## 8. I/O 재지향


&#9650; [위로](#중급-단계)
___

## 9. Here Documents


&#9650; [위로](#중급-단계)
___
