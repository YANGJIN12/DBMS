-- sqldeveloper
-- 데모판 사이트 : sqliteonline.com
-- Database Management System > 데이터 베이스를 관리하는 도구
-- DB > 규격화된 데이터의 집합
-- RDBMS > R(Relational) > 관계
-- RDBMS > 관계성까지 고려해서 규격화된 데이터의 집합을 관리하는 도구
-- 단순 GUI만으로는 관리가 어렵다
-- 아주 명확하게 명령어를 토대로 관리를 해야한다.
-- SQL > DB 관리 명령어 도구

-- 테이블 > 데이터를 규격화한 모양
-- 테이블 이름
--이름을 결정하는 네이밍 룰
-- 1. 이름은 영문자와 언더바 그리고 숫자로 이루어짐
-- 2. 첫글자는 영문이어야함
-- 3. 중복은 안됨
-- 4. 예약대는 사용할 수 없음

create table test_4
(
    age number(3), -- 자료형
    name nvarchar2(5),
    birth Date,
    sleep timestamp
);
drop table test_4

-- 자료형 -- 
-- 숫자형 : 숫자를 저장하는 형태 > number(자릿수), number(자릿수,소수점자릿수) > 크기 5Byte ~ 22Byte
-- 문자형
-- char : 문자를 받는 형태, 고정 자리수 형태 > ASCII > 최대 2000글자
-- nchar : 문자를 받는 형태, 고정 자리수 형태 > UTF-16  > 최대 1000글자
-- varchar2 : 가변 자리수 형태 > 최대 4000글자
-- nvarchar2 : 가변 자리수 형태 > UTF-16 > 최대 2000글자
-- clob : large object > MB 이상의 단위의 데이터를 저장할때 사용하는 기능 > 128TB > 참조형식 
-- 특수형
-- 날짜 : 날짜를 저장하는 형태 > 연/월/일 > Date
-- 시간 : 시간을 기록하는 형태 > 연/월/일/시/분/초/밀리초 > TimeStamp
-- 이진 : 이미지, 음악, 실행파일, ... > 참조형식 > blob > large object

create table test_5
( 
    name nvarchar2(10)  
);

-- 회원정보 관리 형태를 만드시오
-- 회원정보는 이름, 나이, 이메일주소, 주민번호, 집주소, 핸드폰번호 포함

create table member
(
    name nvarchar2(20),
    age number(20),
    email nvarchar2(20),
    idcard number(20),
    adress nvarchar2(20),
    phone number(20)

);
    
insert into member
(
    name, age, email, idcard, adress
)
values
(
    '홍길동',
    45,
    'AWDWAD@naver.com',
    148513218,
    '서울시 뭐뭐구 뭐뭐동'
);
select * from member;



-- 학생 성적부 관리
-- 학생은 수학, 영어, 과학 점수와 이름, 학년이 저장됨
-- 3명의 학생을 저장한 후 출력
-- 3명의 학생중 1명은 과학 시험을 안봐서 과학 시험 점수가 없음

create table students
(
    math number(3),
    engl number(3),
    Scic number(3),
    name nvarchar2(10),
    year number(1)
);
insert into students values(75,50,90,'홍길동',3);
insert into students values(75,50,90,'임꺽정',2);
insert into students 
(
    math,engl,name,year
)
values(75,50,'임신혜',1);
select * from students;

-- 제약조건 종류가 많음
-- 중복 불가
-- 중복불가, 무조건 입력
-- 특정 값

create table A
(
    Q number(3) primary key, -- 중복불가, 무조건 입력
    W number(3),
    E number(3),
    R number(3)
);

-- 쇼핑몰 상품 목록 DBMS화 하시오
-- 상품을 상품명, 상품가격, 상품 판매자, 상품 개수를 요구함
-- 상품명은 중복이 되어선 안됨
-- 상품 판매자는 무조건 존재해야함

create table product
(
    name nvarchar2(10) primary key,
    price number(15),
    Seller nvarchar2(10) not null,
    num number(10)
);
insert into product values('짜장',5000,'중화요리',5);
insert into product values('짬뽕',6000,'중화요리',3);
insert into product(name, seller) values('간짜장','중화요리');
select * from product;


-- 트랜잭션 > 내가 저장하기 전의 내용을 제거 > commit
-- 오늘 날짜 구하기 > select sysdata from dual; > 날짜나 시간에 +1을 하면 내일 날짜 시간이 나옴
-- 현재 시간 구하기 > select systimestamp from dual;
-- 랜덤값을 이용해 검색하는법 > select dbms_random.values() from dual; > 0 ~ 1
-- 랜덤값을 이용해 검색하는법 > select dbms_random.string('a',3) from dual; > 무작위 글자 N글자

insert into product values(
    dbms_random.string('a',20),
    dbms_random.value() * 500+4500,
    dbms_random.string('a',10),
    dbms_ramdom.value() * 20+2
);
select * from product;



