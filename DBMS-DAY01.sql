-- sqldeveloper
-- ������ ����Ʈ : sqliteonline.com
-- Database Management System > ������ ���̽��� �����ϴ� ����
-- DB > �԰�ȭ�� �������� ����
-- RDBMS > R(Relational) > ����
-- RDBMS > ���輺���� ����ؼ� �԰�ȭ�� �������� ������ �����ϴ� ����
-- �ܼ� GUI�����δ� ������ ��ƴ�
-- ���� ��Ȯ�ϰ� ��ɾ ���� ������ �ؾ��Ѵ�.
-- SQL > DB ���� ��ɾ� ����

-- ���̺� > �����͸� �԰�ȭ�� ���
-- ���̺� �̸�
--�̸��� �����ϴ� ���̹� ��
-- 1. �̸��� �����ڿ� ����� �׸��� ���ڷ� �̷����
-- 2. ù���ڴ� �����̾����
-- 3. �ߺ��� �ȵ�
-- 4. ������ ����� �� ����

create table test_4
(
    age number(3), -- �ڷ���
    name nvarchar2(5),
    birth Date,
    sleep timestamp
);
drop table test_4

-- �ڷ��� -- 
-- ������ : ���ڸ� �����ϴ� ���� > number(�ڸ���), number(�ڸ���,�Ҽ����ڸ���) > ũ�� 5Byte ~ 22Byte
-- ������
-- char : ���ڸ� �޴� ����, ���� �ڸ��� ���� > ASCII > �ִ� 2000����
-- nchar : ���ڸ� �޴� ����, ���� �ڸ��� ���� > UTF-16  > �ִ� 1000����
-- varchar2 : ���� �ڸ��� ���� > �ִ� 4000����
-- nvarchar2 : ���� �ڸ��� ���� > UTF-16 > �ִ� 2000����
-- clob : large object > MB �̻��� ������ �����͸� �����Ҷ� ����ϴ� ��� > 128TB > �������� 
-- Ư����
-- ��¥ : ��¥�� �����ϴ� ���� > ��/��/�� > Date
-- �ð� : �ð��� ����ϴ� ���� > ��/��/��/��/��/��/�и��� > TimeStamp
-- ���� : �̹���, ����, ��������, ... > �������� > blob > large object

create table test_5
( 
    name nvarchar2(10)  
);

-- ȸ������ ���� ���¸� ����ÿ�
-- ȸ�������� �̸�, ����, �̸����ּ�, �ֹι�ȣ, ���ּ�, �ڵ�����ȣ ����

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
    'ȫ�浿',
    45,
    'AWDWAD@naver.com',
    148513218,
    '����� ������ ������'
);
select * from member;



-- �л� ������ ����
-- �л��� ����, ����, ���� ������ �̸�, �г��� �����
-- 3���� �л��� ������ �� ���
-- 3���� �л��� 1���� ���� ������ �Ⱥ��� ���� ���� ������ ����

create table students
(
    math number(3),
    engl number(3),
    Scic number(3),
    name nvarchar2(10),
    year number(1)
);
insert into students values(75,50,90,'ȫ�浿',3);
insert into students values(75,50,90,'�Ӳ���',2);
insert into students 
(
    math,engl,name,year
)
values(75,50,'�ӽ���',1);
select * from students;

-- �������� ������ ����
-- �ߺ� �Ұ�
-- �ߺ��Ұ�, ������ �Է�
-- Ư�� ��

create table A
(
    Q number(3) primary key, -- �ߺ��Ұ�, ������ �Է�
    W number(3),
    E number(3),
    R number(3)
);

-- ���θ� ��ǰ ��� DBMSȭ �Ͻÿ�
-- ��ǰ�� ��ǰ��, ��ǰ����, ��ǰ �Ǹ���, ��ǰ ������ �䱸��
-- ��ǰ���� �ߺ��� �Ǿ �ȵ�
-- ��ǰ �Ǹ��ڴ� ������ �����ؾ���

create table product
(
    name nvarchar2(10) primary key,
    price number(15),
    Seller nvarchar2(10) not null,
    num number(10)
);
insert into product values('¥��',5000,'��ȭ�丮',5);
insert into product values('«��',6000,'��ȭ�丮',3);
insert into product(name, seller) values('��¥��','��ȭ�丮');
select * from product;


-- Ʈ����� > ���� �����ϱ� ���� ������ ���� > commit
-- ���� ��¥ ���ϱ� > select sysdata from dual; > ��¥�� �ð��� +1�� �ϸ� ���� ��¥ �ð��� ����
-- ���� �ð� ���ϱ� > select systimestamp from dual;
-- �������� �̿��� �˻��ϴ¹� > select dbms_random.values() from dual; > 0 ~ 1
-- �������� �̿��� �˻��ϴ¹� > select dbms_random.string('a',3) from dual; > ������ ���� N����

insert into product values(
    dbms_random.string('a',20),
    dbms_random.value() * 500+4500,
    dbms_random.string('a',10),
    dbms_ramdom.value() * 20+2
);
select * from product;



