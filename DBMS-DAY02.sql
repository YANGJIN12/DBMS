-- ���̺� ���� > ��������
-- ���̺� ������ ����
create table person(
    name nvarchar2(64) not null, -- ���̸� �ڷ���(ũ��) �ɼ�
    regist nvarchar2(16) primary key -- �⺻Ű > �ĺ���
);

-- default > �������� x
create table person(
    name nvarchar2(64) default 'ȫ�浿' -- �⺻��
);

-- unique > �ߺ��� ���� �ʰ��ϴ� ��������
create table person(
    regist nvarchar2(15) unique -- ������ ���� �Է����� ���ÿ�
    -- unique�� ��ĭ �Է��� ������
    -- ��ĭ�� ���� �ƴϱ� ������ �������� �Է��� �� ����
);

-- check > ������ �˼�
-- ���� ���� �˼�
-- ���̸� between A and B > ���̸��� ���ڰ� A�� B ���̿��ִ��� �˼�
-- ������ �˼�
-- ���̸� in (A,B,C,...) > �����ʿ� �ִ� �׷��߿� �����ϴ��� �˼�
-- ���ڿ� �˼�
-- ����� ���ڿ� �˻�
-- like

create table person(
    name nvarchar2(20) check(name like '��%'),
    gender nvarchar2(4) check(gender in ('����', '����')),
    age number(4) check(age between 0 and 130)
    
);

-- ���������� �ùٸ� �ۼ� ���
create table person(
    age number(4),
    constraint age_check check(age between 20 and 130)
);

-- ���� �������� - �ܷ�Ű
-- ���̺��� �ߺ�
-- ��� > �̸�, ����, ������, �ּ�
-- �л� > �̸�, ����, ������, �ּ�, �б�, �г�
-- �˹� > �̸�, ����, ������, �ּ�, �˹�����, �ñ�

-- ��� > �̸�, ����, ������, �ּ�
-- �л� > �б�, �г�
-- �˹� > �˹�����, �ñ�

-- RDBMS�� �̿��Ͽ� �ߺ��� �ּ�ȭ�ϴ� ���
-- �ܷ�Ű > �ߺ��� �ּ�ȭ�ϱ����� ���
-- �ߺ��� �ּ�ȭ�ϱ����� �������� > �ٸ� ���̺� �ش��ϴ� Ű���� �����ؾ����� ���� ����
create table person(
    regist nvarchar2(15) primary key,
    name nvarchar2(64) default 'ȫ�浿'
);

create table student(
    regist nvarchar2(15) primary key,
    grade number(4) default 1,
    constraint fk_student_person foreign key (regist) references person(regist)
);

select * from all_constraints where table_name like '%PERSON%';
select * from all_constraints;

-- ���̺� ����
-- �� �߰�
alter table person add (age number(4));
-- �� ����
alter table person drop column age;
-- �� ����
alter table person modify(age number(3));
-- �� �̸� ����
alter table person rename column age to age_;
-- �������� �߰�
alter table person add constraints unique_name unique (age);
-- �� �������� �߰�
alter table person modify age not null;
-- �������� ����
alter table person drop constraint unique_name;



-- �л� ���̺��� �̸�, ���̷� ����
-- �л� ���̺� �г� ���� �߰�
-- �л� ���̺��� �г⿡ ������� ������ ������������ �߰�
-- �л� ���̺��� ���̸� number(3)���� ����
-- �л� ���̺��� �̸��� ����

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














