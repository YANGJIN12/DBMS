-- 기본키, 외래키, ERD

-- 기본키
-- 중복되지않고, 비어있으면 안되는 제약조건
-- 다른 외부테이블과의 연결서을 유지하기 위해서

-- 외래키
-- 다른 테이블과의 연결성을 제약하는 조건

-- 기본키는 외래키와 연결되기 위해서 존재함
-- 외래키를 기본키가 아닌것과 연결하면 오류가 발생함(oracle이 아니면 가능함) 


create table A(
    keycode number(9),
    keycode2 number(9),
    constraint pk primary key (keycode, keycode2)
);

create table B(
    keycode number(9),
    keycode2 number(9),
    constraint fk foreign key (keycode,keycode2) references A(keycode,keycode2)
);

-- ERD(Entity Relationship Diagram)

create table person(
    name nvarchar2(20) not null,
    regist nvarchar2(15) primary key,
    gender nvarchar2(2) check(gender in('남','여'))
);

create table student(
    regist nvarchar2(15) primary key,
    score number(3),
    code number(3),
    constraint fk_sp foreign key (regist) references person(regist)
);

create table employee(
    regist nvarchar2(15) not null,
    payment number(20),
    constraint fk_ep foreign key (regist) references person(regist)
);

-- not null 수정
-- alter table employee modify 

-- insert

insert into employee values ('123456-15415612', 450000);
insert into employee values ('123456-15411316', 450000);

insert into student values ('123456-31231657', 85, 2065748);
insert into student values ('123456-31231748', 58, 2065747);
insert into student values ('123456-31231129', 75, 2065749);
insert into student values ('123456-31231455', 80, 2065746);

insert into person values ('홍길동', '123456-3123164', '남');
insert into person values ('이지수', '123456-3123174', '여');
insert into person values ('홍진덕', '123456-3123167', '남');
insert into person values ('박광덕', '123456-3123168', '남');

-- insert의 원리
-- index > 목차
-- 묵시적 허용
insert into person
(regist, name)
values
('123456-1234576', '홍길동')
;

-- 묵시적 허용없이 모든 데이터를 입력하는 employee insert를 하시오
-- 묵시적 허용을 이용하여 regist만 입력하는 student insert를 하시오

insert into employee (regist, payment) values ('123456-1234541', 123);
insert into student (regist) values ('123456-1234578');

-- select > 선택하다
select name, gender, person.regist, student.regist, score, code from person, student;

-- 조건
select name, gender, person.regist, student.regist, score, code from person, student where score < 70;

select regist, score +1 +1 as score from student;


-- 학생 정보와 알바생 정보를 엮어서 출력하되 월급 정보를 두배로 늘리시오
-- 학생 정보 중 점수만 + 50하여 출력하시오
-- 알바생 정보와 학생 정보를 엮어서 월급 * 점수를 출력하시오

select payment * 2 as payment from student, employee;
select regist, score + 50, code as score from student;
select payment * score as payment from employee, student;


