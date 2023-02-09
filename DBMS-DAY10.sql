-- Ʈ����� > commit, rollback, savepoint
-- Ʈ����� > Ÿ�Ӷ���
-- �߸��� �����ͺ��̽��� ������ ������ؼ� ���� �帧ǥ
-- Ʈ����ǿ��� �ð��� ����
-- select, insert, delete, drop, crate, alter, grant, revoke
-- Ʈ����ǿ��� ��� ��ɾ ��ϵ�

-- Ʈ������� �̿��Ͽ� ������ ��� �ϴ°�?
-- commit, rollback, savepoint

-- rollback > Ư�� �������� �ۼ��� ��� ���ǹ�(��ɾ�)�� �ǵ�����
-- savapoint > ���� �ۼ��� ����(���ݱ��� �귯�� Ʈ�����) �ϳ��� �������� ������

select * from peopel;
select * from employee;
savepoint a; -- a��� �̸��� ����

select * from peopel;
select * from employee;
select * from peopel;
select * from employee;

rollback a;

-- �ѹ�� ���̺�����Ʈ ������ �����Ͱ� ���� �ҽ�
-- ���̺�����Ʈ�� ���� �ۼ��ϸ� > �뷮�� ���� �ʿ� > ��ȿ����
-- �ð�����, �߿��� �̺�Ʈ ����, ...

-- ���̺�����Ʈ�� ������ ���ؼ� ���� ��� > commit
-- ���� �뷮�� �����ϰԵ� Ʈ����� Ȥ�� ���̺� ����Ʈ�� �����ϱ� ���ؼ� ���� ���
-- Ʈ������� ���� ���� > ����
-- commit > �� �������� �ۼ��� Ʈ������� ��� �����ϸ鼭 ���� DB�� ����(����)

-- commit, rollback, savepoint
savepoint a;
rollback a;
commit;
rollback;

-- people�� ����� 2�� �Է��غ��ÿ�
-- spl�� ����ÿ�
-- test ���̺��� ����ÿ�
-- sp2�� ����ÿ�
-- test ���̺� �����͸� 4�� �Է��Ͻÿ�
-- test ���̺� �Է��� �����͸� �ѹ��Ͻÿ�
-- test ���̺� �����͸� 2�� �Է��Ͻÿ�
-- ��� �����͸� �ѹ��Ͻÿ�

insert into people(name) values ('�����');
insert into people(name) values ('ȫ�浿');
savepoint sp1;
create table test(
    name nvarchar2(64),
    regist nvarchar2(64),
    phone number(15),
    birthday number(10)
);
savepoint sp2;
insert into test values('ȫ�浿','����� ������', '01041545644','0102134')
insert into test values('ȫ�浿','����� ������', '01041545645','0101234')
insert into test values('ȫ�浿','����� ������', '01041545647','0103456')
insert into test values('ȫ�浿','����� ������', '01041545649','0107895')
rollback to savepoint sp2;
insert into test values('ȫ�浿','����� ������', '01041545644','0102134')
insert into test values('ȫ�浿','����� ������', '01041545644','0102134')
rollback;

-- ���÷����� ���� ��� �ذ��
-- ���÷��� ����
-- īī���� ������ ȭ�� > ���� ����
-- ���� ���� > DB ����
-- DB ���

-- ������ ������ > �����ڼ� ����
-- �ϵ������ ���
-- ���� ����

-- ����Ʈ������ ���
-- DB ����ȭ
-- 1. �Լ��� �ִ��� ���� ���
-- 2. ������ ������ �ִ��� �����ض� 
-- 3. ���������� �ִ��� ���� Ȱ���ض� 
-- 4. ���� �񱳸� Ȱ���ض� > = any, in, ... / =, !=, <>, >, <
-- 5. ������ ��ȯ�� �����ض� 

-- �ű� ������ ������ > ���� �뷮 ����
-- 1. ����Ī �ϵ� > NAS
-- 2. ������ ���� > ZIP 

-- ���� ���� > ��ŷ > �߸��� �������� �Է�
-- �������� �ս� ���� 
-- 1. �������� �˻�
-- 2. ���� ����(�ٸ� ��ġ)
-- 3. �����͸� ������ ������

-- ��� ������ ��û�ϴ� ����Ʈ APT���� ������ �����
-- ����� ���������� ��û�ϴ� �ð��� �ʹ� �����ɸ��ٴ°�
-- �Ʒ� ���� ��û�� �ٲ㺸�ÿ�
select * from
(select 
    case 
        when substr(registnumber,8,1) = '1' then '����'
        when substr(registnumber,8,1) = '3' then '����'
        when substr(registnumber,8,1) = '5' then '����'
        when substr(registnumber,8,1) = '7' then '����'
        when substr(registnumber,8,1) = '9' then '����'
        when substr(registnumber,8,1) = '2' then '����'
        when substr(registnumber,8,1) = '4' then '����'
        when substr(registnumber,8,1) = '6' then '����'
        when substr(registnumber,8,1) = '8' then '����'
        else '����'
    end as gender, keycode
from people inner join student on people.keycode = student.people) where keycode = 583;

select * from   
(select 
    case when translate(substr(registnumber,8,1) = '1357924680' then '��������������������') as gender, keycode
from people inner join student on people.keycode = student.people) where keycode = 583;

select 
    substr(registnumber,8,1) as gender, keycode
from people inner join student on people.keycode = student.people where keycode = 583;

-- score ������ �����Ͽ� �뷮�� Ȯ���Ͻÿ�
-- �ս� ����
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
-- ���� ����
-- ��Ʈ ���� ����





