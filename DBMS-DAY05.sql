select * from people;

-- 데이터 변환 > 함수
-- 함수 > 적절한 입력을 받으면 일련의 과정을 거쳐 결과를 추출하는 기능


-- 함수의 사용법 
-- 1. 함수의 명칭
-- 2. 함수의 입력값
-- 명칭(입력값) > 함수 호출 방식

-- - 시스템 함수 -
-- 문자형 함수
-- lower > 소문자화
-- lower(문장)
select lower('This is My Hell Party') from dual;

-- upper > 대문자화
-- upper(문장)
select upper('This is My Hell Party') from dual;

-- initcap > 첫글자만 대문자
select initcap('this is my hell party') from dual;

-- 문자열 덧셈
-- concat > 두개의 문장을 합친 결과
select concat(concat('서울특별시','노원구'), '학원') from dual;

-- 문자열 쪼개기
-- substr > 한개의 문장에서 일부를 추출하는 결과
-- substr(원본문장, 시작하는 글자 위치, 글자 개수)
select substr(regist,3,2) as month, substr (regist,5,2) as day from people;

-- 글자의 개수를 구하는 함수
-- length > 문장의 글자 개수를 결과
select length(regist) from people;

-- ltrim, rtrim, trim > 공백 제거
-- 띄어쓰기 제거 x > 공백 제거
-- 띄어쓰기, 밥, 핸디, ...
select ltrim(concat('  ',concat(name, '  '))) as name from people;
select rtrim(concat('  ',concat(name, '  '))) as name from people;
select trim(concat('  ',concat(name, '  '))) as name from people;

-- lpad, rpad > padding > 두꺼운
-- lpad or rpad (원본문장, 글자개수, 글자)
select lpad(name, 10, 'a') as name from people;
select rpad(name, 10, 'a') as name from people;

-- people에서 regist의 성별정보를 찾아서 5성, 4성 식으로 출력
select concat(substr(regist,8,1), '성') as sex from people;

-- 글자 변환 > A > B
-- 2종류
-- 대응 변환
-- translate > 각각의 글자를 다른 글자로 변환해야 할때
-- 주민번호 > 1번 남, 2번 여, 3번 남, 4번 여, ...
-- translate(원본문장, 탐색문장, 변환문장)
select translate(substr(regist,8,1), '1357924680', '남남남남남여여여여여') as gender from people;
-- 글자 대응 변환이다보니 특별한 기능이 존재
select translate('12345', '23451', '0000') from dual;

-- 검색 변환
-- 특정문장(1글자 이상)을 다른문장(1글자 이상)으로 바꾸는 기능
-- replace(원본문장, 검색문장, 변환문장)
-- 주민번호 생년월일의 월이 4월생인 대상은 7월생으로 변경해라
select replace(regist, '04','07') from people;

-- 숫자형 함수
-- 반올림, 올림, 내림
-- round(숫자, 반올림할 자리수 위치) > 숫자를 반올림
select 123.456789, round(123.456789, 1) from dual;
-- trunc(숫자, 내림할 자리수 위치) > 숫자를 내림
select 123.456789, trunc(123.456789, 1) from dual;
-- floor(숫자) > 내림
select 123.456789, floor(123.456789) from dual;
-- ceil(숫자) > 올림
select 123.456789, ceil(123.456789) from dual;

-- 나머지
-- mod(앞숫자,뒤숫자) > 앞숫자를 뒤숫자로 나눈 나머지를 구하는 함수
select floor(7 / 3), mod(7,3) from dual;

-- 절대값, 부호
-- abs(숫자) > 부호를 제거하는 기능
select 1, -1, abs(1), abs(-1) from dual;
-- sign(숫자) > 부호를 구하는 기능
select 3, -3, sign(3), sign(-3), sign(0) from dual;

-- 제곱 함수
-- 특정 숫자를 다른 숫자만큼 곱하는 함수
-- power(숫자,승수) > 숫자^승수를 구하는 함수
select power(2,50) from dual;

-- log, sin, cos, tan > 안배울것 
-- log(지수,숫자), sin(숫자), cos(숫자), tan(숫자)

-- 날짜 함수 > 날짜 > 숫자의 다른 형태
-- 1월 1일, 3월 1일
-- 지나온 날짜를 총합
-- 1월 1일 > 1, 1월 2일 > 2, 2월 1일 > 32
select sysdate, systimestamp from dual;
select sysdate + 1 from dual;

-- 달 더하기
-- add_months(날짜, 달숫자) > 특정 날짜로부터 N개월 이후의 날짜를 구하는 기능
select 
    add_months(sysdate, 1) as now1, 
    add_months(sysdate, 2) as now2, 
    sysdate + 30 as now_1,
    sysdate + 60 as now_2
from dual;

-- 마지막 날
-- last_day(날짜) > 해당 달의 마지막 일을 구하는 함수
select last_day(sysdate+6+365) from dual;

-- 타임존 변경
-- new_time(날짜, 기존 타임존, 변경할 타임존)
-- AST, ADT, BST, BDT, ...
select new_time(sysdate, 'AST', 'YST') from dual;

-- 요일 구하기
-- next_day(날짜, 요일) > 해당 날짜로부터 가장 빨리오는 요일의 날짜를 구하는 기능
-- 일요일, 월요일, Monday, Tuesday > 풀네임
-- 일, 월, Mon, Tue > 축약네임
-- 1,2,3,4,5,6,7 > 숫자 > 1번이 일요일, 2번 월, ...
select next_day(sysdate, '수') from dual;

-- 개월차 구하기
-- month_between(날짜1, 날짜2) > 두 날짜사이의 개월수를 구하는 기능
select (sysdate + 60) - sysdate from dual;
select months_between(sysdate, add_months(sysdate, 3)) from dual;

-- 변환 함수 > 숫자를 문자로, 문자를 숫자로, 날짜의 모양
-- 문자로 변환
-- to_char(숫자) > 문자의 형태로 변경
-- to_char(숫자,형식) 
-- to_char(날짜,형식) > 날짜를 특정한 형태로 변경하는 기능
-- 날짜 형식 종류
-- MM > 달 수 
-- MON > 달 이름
-- MONTH > 달 이름 전체
-- DD > 날짜
-- D > 요일
-- DY > 요일
-- DAY > 요일
-- YYYY > 연도
-- YY > 연도 뒤 두자리
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD MON MONTH') from dual;
select to_char(sysdate, 'YYYY-MM-DD D DY DAY') from dual;
-- 9 > 숫자 1자리
-- 0 > 빈 자리 > 숫자 자리를 만드는건 동일 빈칸대신 0을 채워라
-- $ > 해당하는 문장 앞에 $를 붙여라
-- . > 소수점
select to_char(123456789,'9999999999') from dual;
select to_char(123456789,'0000009999999999') from dual;
select to_char(123456789.123456789,'999999999.999') from dual;

-- 숫자로 변환
select to_number('1234') + 5 from dual;

-- 날짜로 변환 > 글자로된 날짜를 날짜 데이터로 변경 변환 기능
select to_date('2023-01-27', 'YYYY-MM-DD') from dual;

-- 시스템이 제공하는 시스템함수 기초

-- 사람 정보 중 주민번호에서 성별 정보를 추출하시오
-- 사람 정보 중 주민번호에서 생일 정보를 추출하시오
select 
    name, regist, phone, location,
    concat(
        translate(
            substr(regist,8,1),
            '1357924680',
            '남남남남남여여여여여'
            ),
        '성'
    ) as gender
from people;

select 
    name, regist, phone, location,
    to_char(
        to_date(
        substr(regist,1,6),
        'YYMMDD'
        ),
        'MM/DD'
    ) as birth2,
    concat(
        concat(
            to_char(to_number(substr(regist,3,2))),
            '/'
        ),
        substr(regist,5,2)
    )as birth
from
people;

-- 사람 정보를 출력하시오
-- 사람은 탄생일, 생일, 성별, 외국인 여부, 이름, 주소를 가진다
-- 행정상 잘못된 주민번호는 제외하고 출력하시오
-- 내년 생일의 요일을 출력하시오
-- 주민번호 5,6,7,8은 외국인이다
-- 주민번호 9,0은 행정상 잘못된 주민번호이다

select
    name, regist, phone, location,
    to_char(
        to_date(
            substr(regist,1,6),
                'YYYYMMDD'
            ),
            'YYYY/MM/DD'
        ) as birthday,
      to_char(
        to_date(
            substr(regist,1,6), 'MMDD'
            ),
            'MM/DD'
        ) as birth,
     concat(
        translate(
            substr(regist,8,1),
                '1357924680',
                '남남남남남여여여여여'
            ),
        '성'
    ) as gender,
    translate(
        substr(regist,8,1),
        '5678123490','OOOOXXXXXX'
    ) as foreigner,
    to_char(
        add_months(
            to_date(
                concat(
                    to_char(sysdate, 'YYYY'),
                        to_char(
                            to_date(
                                substr(regist,1,6),'YYMMDD'
                            ),
                            'MMDD'
                        )
                    ),'YYYYMMDD'
                ),12
            ),'DAY'
        ) as thisbirth
from
people
where
    substr(regist,8,1) != '9' or 
    substr(regist,8,1) != '0';






