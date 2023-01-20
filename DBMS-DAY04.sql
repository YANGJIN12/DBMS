-- select 

select * from cars;
-- 정렬절(order by 열)
-- 정렬 순서 기능
-- asc > 오름차순
-- desc > 내림차순
select * from cars order by speed asc;
select * from cars order by speed desc;

-- 조건절 where
-- 내가 선택한 내용물들 중 일부를 골라내는 기능
select * from cars 
where speed = 1;


-- 글자에서 쓰이는 검수
-- 동일 데이터 검수
-- 동일한 값이 존재하는 데이터만 선택
select * from cars where color = '붉은색';
select * from cars where color = '푸른색';

-- 검수 연산(논리 연산)
-- 여러개의 검수의 결과값을 연산하는 기능
select * from cars where color = '붉은색' and color = '푸른색';
select * from cars where color = '붉은색' or color = '푸른색';

-- 비동일 데이터 검수
-- 동일하지 않은 데이터 선택
select * from cars where color != '붉은색';

-- 빈칸 검수
select * from cars where color = NULL;
select * from cars where color is NULL;

-- 비어있지 않은칸 검수
select * from cars where color != NULL;
select * from cars where color is not NULL;

-- 문자열 탐색
-- 특정한 글자를 골라내라
-- 비슷한 글자 모양을 골라내라
-- 특수한 효과
-- % 비슷한 글자 > 무엇이든 될 수 있는 글자 > 0글자 이상
-- _ 비슷한 글자 > 무엇이든 될 수 있는 글자 > 1글자
select * from cars where color like '%은색';
select * from cars where color like '_색';

-- 광고메일은 메일을 받는 포털 사이트마다 구조가 다르기 때문
-- select * from email where mail like '%@naver.%';

-- 중형이거나 소형인 차량을 검색
-- 붉은색 소형차량을 검색
-- 붉은색이 아닌 대형차량을 검색

select * from cars where scale = '중형' or scale = '소형';
select * from cars where color = '붉은색' and scale = '소형';
select * from cars where color != '붉은색' and scale = '대형';

-- 숫자에서 쓰이는 검수
-- 비교 검수
-- 숫자가 크다, 작다, 크거나 같다, 작거나 같다, 같지 않다
select * from cars where speed > 100;
select * from cars where speed < 100;
select * from cars where speed >= 100;
select * from cars where speed <= 100;
select * from cars where speed = 100;
select * from cars where speed <> 100;

-- 범위 검수
-- 숫자의 범위를 검사하고 싶을 때
select * from cars where 100 < speed and speed < 120;
select * from cars where speed between 100 and 119;

-- 데이터 목록 검수
-- 범위나, 특정한 값이 아니라 여러개중 한개가 들어있는지
select * from cars where color in ('붉은색', '푸른색');

-- 데이터 중복 검수
select distinct scale, color from cars;

-- 붉은색 차량 중 속도가 느린 차량을 모두 고르시오
-- 푸른색 차량 중 대형이 아닌 차량을 모두 고르시오
-- 푸른색이거나 붉은색 차량 중 속도가 보통인것을 모두 고르시오
-- 속도가 빠른 차량 중 무게가 1 미만인것을 모두 고르시오
-- 속도가 90이하는 느린차량 120이상은 빠른차량

select * from cars where color = '붉은색' and speed <= 90;
select * from cars where color = '푸른색' and scale != '대형'; -- scale in ('중형','소형')
select * from cars where color = '푸른색' or color = '붉은색' and speed between 90 and 120; -- speed > 90 and speed < 120
select * from cars where speed >= 120 and weight < 1;

-- 수정과 삭제
-- 여러가지 절차를 거친다
-- 수정과 삭제는 먼저 대상을 선택한 후 수정과 삭제가 이루어진다

-- 삭제 
-- 모든 데이터 목록에서 선택한 데이터를 삭제해라
delete from cars where color = '붉은색';
select * from cars;

-- 수정
-- 모든 데이터 목록에서 선택한 데이터를 수정해라
update cars set speed = speed + 500 where color = '푸른색';
select * from cars;
update cars set speed = weight * 100 where color = '푸른색';

-- 붉은색 소형 차량의 속도를 현재 속도의 70%로 변경하고
-- 붉은색이 아닌 중형 차량의 속도를 120%로 변경하시오

update cars set speed = speed * 0.7 where color = '붉은색' and scale = '소형';
update cars set speed = speed * 1.2 where color != '붉은색' and scale = '중형';

select DBMS_RANDOM.VALUE() from dual;

create table product(
    price number(20),
    fresh number(10),
    weight number(40,20),
    scale number(10)
);

insert into product (fresh, weight, scale) 
values
(
    DBMS_RANDOM.value() * 50,
    DBMS_RANDOM.value() * 3,
    DBMS_RANDOM.value() * 8 
);

select * from product;


-- 제로백이 70% 줄어든 상태가 10보다 높은 경우 색상을 붉은색으로 변경하시오
-- 무게가 1.2보다 큰데 속도가 120보다 작은 경우 차량 크기를 중형으로 변경하시오
-- 속도가 30% 줄어든 상태가 60보다 작은 경우 차량을 삭제하시오
-- 붉은색이 아닌 차량 중 무게가 1.1을 넘고 소형이거나 중형인 차량은 제로백을 50% 감소하시오

update cars set color = '붉은색' where zero * 0.3 > 10; 
update cars set scale = '중형' where weight > 1.2 and speed < 120;
delete from cars where speed * 0.7 < 60;
update cars set zero = zero * 0.5 where color != '붉은색' and weight > 1.1 and scale in ('소형','중형');
