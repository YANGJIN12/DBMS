-- �⺻Ű, �ܷ�Ű, ERD

-- �⺻Ű
-- �ߺ������ʰ�, ��������� �ȵǴ� ��������
-- �ٸ� �ܺ����̺���� ���Ἥ�� �����ϱ� ���ؼ�

-- �ܷ�Ű
-- �ٸ� ���̺���� ���Ἲ�� �����ϴ� ����

-- �⺻Ű�� �ܷ�Ű�� ����Ǳ� ���ؼ� ������
-- �ܷ�Ű�� �⺻Ű�� �ƴѰͰ� �����ϸ� ������ �߻���(oracle�� �ƴϸ� ������) 


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

-- ERD(Entity Releational Diagram)

create table person(
    name nvarchar2(20) not null,
    regist nvarchar2(15) primary key,
    gender nvarchar2(2) check(gender in('��','��'))
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

-- not null ����
-- alter table employee modify 

-- insert

insert into employee values ('123456-15415612', 450000);
insert into employee values ('123456-15411316', 450000);

insert into student values ('123456-31231657', 85, 2065748);
insert into student values ('123456-31231748', 58, 2065747);
insert into student values ('123456-31231129', 75, 2065749);
insert into student values ('123456-31231455', 80, 2065746);

insert into person values ('ȫ�浿', '123456-3123164', '��');
insert into person values ('������', '123456-3123174', '��');
insert into person values ('ȫ����', '123456-3123167', '��');
insert into person values ('�ڱ���', '123456-3123168', '��');

-- insert�� ����
-- index > ����
-- ������ ���
insert into person
(regist, name)
values
('123456-1234576', 'ȫ�浿')
;

-- ������ ������ ��� �����͸� �Է��ϴ� employee insert�� �Ͻÿ�
-- ������ ����� �̿��Ͽ� regist�� �Է��ϴ� student insert�� �Ͻÿ�

insert into employee (regist, payment) values ('123456-1234541', 123);
insert into student (regist) values ('123456-1234578');

-- select > �����ϴ�
select name, gender, person.regist, student.regist, score, code from person, student;

-- ����
select name, gender, person.regist, student.regist, score, code from person, student where score < 70;

select regist, score +1 +1 as score from student;


-- �л� ������ �˹ٻ� ������ ��� ����ϵ� ���� ������ �ι�� �ø��ÿ�
-- �л� ���� �� ������ + 50�Ͽ� ����Ͻÿ�
-- �˹ٻ� ������ �л� ������ ��� ���� * ������ ����Ͻÿ�

select payment * 2 as payment from student, employee;
select regist, score + 50, code as score from student;
select payment * score as payment from employee, student;


