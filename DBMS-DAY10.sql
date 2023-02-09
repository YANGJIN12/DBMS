-- 트랜잭션 > commit, rollback, savepoint
-- 트랜잭션 > 타임라인
-- 잘못된 데이터베이스의 오류를 잡기위해서 만든 흐름표
-- 트랜잭션에는 시간이 없음
-- select, insert, delete, drop, crate, alter, grant, revoke
-- 트랜잭션에는 모든 명령어가 기록됨

-- 트랜잭션을 이용하여 복구를 어떻게 하는가?
-- commit, rollback, savepoint

-- rollback > 특정 시점까지 작성한 모든 질의문(명령어)를 되돌려라
-- savapoint > 현재 작성한 시점(지금까지 흘러온 트랜잭션) 하나의 기준으로 만들어라

select * from peopel;
select * from employee;
savepoint a; -- a라는 이름의 시점

select * from peopel;
select * from employee;
select * from peopel;
select * from employee;

rollback a;

-- 롤백과 세이브포인트 사이의 데이터가 몽땅 소실
-- 세이브포인트를 많이 작성하면 > 용량이 많이 필요 > 비효율적
-- 시간단위, 중요한 이벤트 단위, ...

-- 세이브포인트의 관리를 위해서 생긴 기능 > commit
-- 많은 용량을 차지하게된 트랜잭션 혹은 세이브 포인트를 정리하기 위해서 생긴 기능
-- 트랜잭션을 몽땅 제거 > 저장
-- commit > 현 시점까지 작성된 트랜잭션을 모두 삭제하면서 실제 DB에 동작(저장)

-- commit, rollback, savepoint
savepoint a;
rollback a;
commit;
rollback;

-- people에 사람을 2명 입력해보시오
-- spl을 만드시오
-- test 테이블을 만드시오
-- sp2를 만드시오
-- test 테이블에 데이터를 4개 입력하시오
-- test 테이블에 입력한 데이터를 롤백하시오
-- test 테이블에 데이터를 2개 입력하시오
-- 모든 데이터를 롤백하시오

insert into people(name) values ('김양진');
insert into people(name) values ('홍길동');
savepoint sp1;
create table test(
    name nvarchar2(64),
    regist nvarchar2(64),
    phone number(15),
    birthday number(10)
);
savepoint sp2;
insert into test values('홍길동','서울시 도봉구', '01041545644','0102134')
insert into test values('홍길동','서울시 도봉구', '01041545645','0101234')
insert into test values('홍길동','서울시 도봉구', '01041545647','0103456')
insert into test values('홍길동','서울시 도봉구', '01041545649','0107895')
rollback to savepoint sp2;
insert into test values('홍길동','서울시 도봉구', '01041545644','0102134')
insert into test values('홍길동','서울시 도봉구', '01041545644','0102134')
rollback;

-- 컴플레인이 생길 경우 해결법
-- 컴플레인 종류
-- 카카오톡 서버실 화재 > 정보 삭제
-- 서버 분할 > DB 분할
-- DB 백업

-- 서버가 느려짐 > 접속자수 증가
-- 하드웨어적 방법
-- 서버 증량

-- 소프트웨어적 방법
-- DB 최적화
-- 1. 함수를 최대한 적게 써라
-- 2. 동일한 동작은 최대한 적게해라 
-- 3. 서브쿼리를 최대한 적게 활용해라 
-- 4. 단일 비교를 활용해라 > = any, in, ... / =, !=, <>, >, <
-- 5. 데이터 변환을 적게해라 

-- 신규 가입을 못받음 > 서버 용량 부족
-- 1. 스위칭 하드 > NAS
-- 2. 데이터 압축 > ZIP 

-- 서버 오류 > 해킹 > 잘못된 데이터의 입력
-- 데이터의 손실 방지 
-- 1. 서버에서 검사
-- 2. 서버 증설(다른 위치)
-- 3. 데이터를 여러번 보내기

-- 사람 정보를 요청하는 사이트 APT에서 문제가 생겼다
-- 사람의 성별정보를 요청하는 시간이 너무 오래걸린다는것
-- 아래 성별 요청을 바꿔보시오
select * from
(select 
    case 
        when substr(registnumber,8,1) = '1' then '남성'
        when substr(registnumber,8,1) = '3' then '남성'
        when substr(registnumber,8,1) = '5' then '남성'
        when substr(registnumber,8,1) = '7' then '남성'
        when substr(registnumber,8,1) = '9' then '남성'
        when substr(registnumber,8,1) = '2' then '여성'
        when substr(registnumber,8,1) = '4' then '여성'
        when substr(registnumber,8,1) = '6' then '여성'
        when substr(registnumber,8,1) = '8' then '여성'
        else '여성'
    end as gender, keycode
from people inner join student on people.keycode = student.people) where keycode = 583;

select * from   
(select 
    case when translate(substr(registnumber,8,1) = '1357924680' then '남남남남남여여여여여') as gender, keycode
from people inner join student on people.keycode = student.people) where keycode = 583;

select 
    substr(registnumber,8,1) as gender, keycode
from people inner join student on people.keycode = student.people where keycode = 583;

-- score 정보를 압축하여 용량을 확보하시오
-- 손실 압축
insert into student values
( 
    8001,0,0,2,
    case 
        when 95 < 50 then 'A'
        when 85 < 50 then 'B'
        when 75 < 50 then 'C'
        when 65 < 50 then 'D'
        else 'F'
    end
);
-- 원본 압축
-- 비트 연산 단위





