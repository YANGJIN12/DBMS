-- 테이블 생성 > 제약조건
-- 테이블 생성의 절차
create table person(
    name nvarchar2(64) not null, -- 열이름 자료형(크기) 옵션
    regist nvarchar2(16) primary key -- 기본키 > 식별자
);

-- default > 제약조건 x
create table person(
    name nvarchar2(64) default '홍길동' -- 기본값
);

-- unique > 중복이 되지 않게하는 제약조건
create table person(
    regist nvarchar2(15) unique -- 동일한 값을 입력하지 마시오
    -- unique는 빈칸 입력이 가능함
    -- 빈칸은 값이 아니기 때문에 여러개를 입력할 수 있음
);

-- check > 데이터 검수
-- 숫자 범위 검수
-- 열이름 between A and B > 열이름의 숫자가 A와 B 사이에있는지 검수
-- 데이터 검수
-- 열이름 in (A,B,C,...) > 오른쪽에 있는 그룹중에 존재하는지 검수
-- 문자열 검수
-- 비슷한 분자열 검색
-- like

create table person(
    name nvarchar2(20) check(name like '김%'),
    gender nvarchar2(4) check(gender in ('남성', '여성')),
    age number(4) check(age between 0 and 130)
    
);

-- 제약조건의 올바른 작성 방식
create table person(
    age number(4),
    constraint age_check check(age between 20 and 130)
);

-- 관계 제약조건 - 외래키
-- 테이블의 중복
-- 사람 > 이름, 나이, 몸무게, 주소
-- 학생 > 이름, 나이, 몸무게, 주소, 학교, 학년
-- 알바 > 이름, 나이, 몸무게, 주소, 알바종류, 시급

-- 사람 > 이름, 나이, 몸무게, 주소
-- 학생 > 학교, 학년
-- 알바 > 알바종류, 시급

-- RDBMS를 이용하여 중복을 최소화하는 기법
-- 외래키 > 중복을 최소화하기위한 기법
-- 중복을 최소화하기위한 제약조건 > 다른 테이블에 해당하는 키값이 존재해야지만 삽입 가능
create table person(
    regist nvarchar2(15) primary key,
    name nvarchar2(64) default '홍길동'
);

create table student(
    regist nvarchar2(15) primary key,
    grade number(4) default 1,
    constraint fk_student_person foreign key (regist) references person(regist)
);

select * from all_constraints where table_name like '%PERSON%';
select * from all_constraints;

-- 테이블 수정
-- 열 추가
alter table person add (age number(4));
-- 열 삭제
alter table person drop column age;
-- 열 수정
alter table person modify(age number(3));
-- 열 이름 수정
alter table person rename column age to age_;
-- 제약조건 추가
alter table person add constraints unique_name unique (age);
-- 널 제약조건 추가
alter table person modify age not null;
-- 제약조건 삭제
alter table person drop constraint unique_name;



-- 학생 테이블을 이름, 나이로 생성
-- 학생 테이블에 학년 열을 추가
-- 학생 테이블의 학년에 비어있지 않음을 제약조건으로 추가
-- 학생 테이블의 나이를 number(3)으로 변경
-- 학생 테이블의 이름을 삭제

create table student(
    name nvarchar2(15),
    age number(10)
);

alter table student add (grade number(3));
alter table student modify grade not null;
alter table student modify (age number(3));
alter table student drop column name;

drop table person;

select * from person;

drop table person;

commit;














