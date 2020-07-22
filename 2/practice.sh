#!/bin/bash

# 문제: 시간과 날짜, 현재 로그인해 있는 모든 사용자들, 시스템 업타임(uptime)을 보여주는 스크립트를 만들어 보세요. 그 다음에는 로그 파일에 그 정보들을 저장하도록 해 보세요.
# 출력
# 시간/날짜
date
# 현재 로그인해있는 사용자 출력
users
# 시스템 업타임 출력
uptime

# log 저장
date >> ../logs/2-2.log
users >> ../logs/2-2.log
uptime >> ../logs/2-2.log