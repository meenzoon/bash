## 루프
# 입력된 데이터를 처리하는 for문
for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do 
    echo $planet
done

planets=( "Mercury" "Venus" "Earth" "Mars" "Jupiter" "Saturn" "Uranus" "Neptune" "Pluto" )

# 변수를 이용한 for 문
for planet in ${planets[@]}
do
    echo "variable: $planet"
done

:<<'END'
start=0
end=10
while [ "$start" -lt "$end" ]
do
    echo -n "$start"
    ((start++))
done


while [ "$var1" != end ]
do
    echo "변수값을 넣으세요 #1 (끝내려면 end)"
    read var1
    echo "변수 #1 = $var1"
done

until [ "$var1" = end ]
do
    echo "변수값을 넣으세요 #1"
    echo "(끝내려면 end)"
    read var1
    echo "변수 #1 = $var1"
done


while []


## 루프 제어

## 테스트와 분기
variable=( "abc" "cde" )
case "$variable" in
    abc) echo "$variable = abc" ;; 
    xyz) echo "$variable = xyz" ;;
esac


PS3='Choose your favorite vegetable: 's
echo

select vegetable in "bean" "carrot" "potato" "onion"
do
  echo
  echo "your favorite vegetable is '$vegetable'"
  echo
  break
done

exit 0
END