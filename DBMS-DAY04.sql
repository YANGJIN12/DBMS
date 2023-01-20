-- select 

select * from cars;
-- ������(order by ��)
-- ���� ���� ���
-- asc > ��������
-- desc > ��������
select * from cars order by speed asc;
select * from cars order by speed desc;

-- ������ where
-- ���� ������ ���빰�� �� �Ϻθ� ��󳻴� ���
select * from cars 
where speed = 1;


-- ���ڿ��� ���̴� �˼�
-- ���� ������ �˼�
-- ������ ���� �����ϴ� �����͸� ����
select * from cars where color = '������';
select * from cars where color = 'Ǫ����';

-- �˼� ����(�� ����)
-- �������� �˼��� ������� �����ϴ� ���
select * from cars where color = '������' and color = 'Ǫ����';
select * from cars where color = '������' or color = 'Ǫ����';

-- ���� ������ �˼�
-- �������� ���� ������ ����
select * from cars where color != '������';

-- ��ĭ �˼�
select * from cars where color = NULL;
select * from cars where color is NULL;

-- ������� ����ĭ �˼�
select * from cars where color != NULL;
select * from cars where color is not NULL;

-- ���ڿ� Ž��
-- Ư���� ���ڸ� ��󳻶�
-- ����� ���� ����� ��󳻶�
-- Ư���� ȿ��
-- % ����� ���� > �����̵� �� �� �ִ� ���� > 0���� �̻�
-- _ ����� ���� > �����̵� �� �� �ִ� ���� > 1����
select * from cars where color like '%����';
select * from cars where color like '_��';

-- ��������� ������ �޴� ���� ����Ʈ���� ������ �ٸ��� ����
-- select * from email where mail like '%@naver.%';

-- �����̰ų� ������ ������ �˻�
-- ������ ���������� �˻�
-- �������� �ƴ� ���������� �˻�

select * from cars where scale = '����' or scale = '����';
select * from cars where color = '������' and scale = '����';
select * from cars where color != '������' and scale = '����';

-- ���ڿ��� ���̴� �˼�
-- �� �˼�
-- ���ڰ� ũ��, �۴�, ũ�ų� ����, �۰ų� ����, ���� �ʴ�
select * from cars where speed > 100;
select * from cars where speed < 100;
select * from cars where speed >= 100;
select * from cars where speed <= 100;
select * from cars where speed = 100;
select * from cars where speed <> 100;

-- ���� �˼�
-- ������ ������ �˻��ϰ� ���� ��
select * from cars where 100 < speed and speed < 120;
select * from cars where speed between 100 and 119;

-- ������ ��� �˼�
-- ������, Ư���� ���� �ƴ϶� �������� �Ѱ��� ����ִ���
select * from cars where color in ('������', 'Ǫ����');

-- ������ �ߺ� �˼�
select distinct scale, color from cars;

-- ������ ���� �� �ӵ��� ���� ������ ��� ���ÿ�
-- Ǫ���� ���� �� ������ �ƴ� ������ ��� ���ÿ�
-- Ǫ�����̰ų� ������ ���� �� �ӵ��� �����ΰ��� ��� ���ÿ�
-- �ӵ��� ���� ���� �� ���԰� 1 �̸��ΰ��� ��� ���ÿ�
-- �ӵ��� 90���ϴ� �������� 120�̻��� ��������

select * from cars where color = '������' and speed <= 90;
select * from cars where color = 'Ǫ����' and scale != '����'; -- scale in ('����','����')
select * from cars where color = 'Ǫ����' or color = '������' and speed between 90 and 120; -- speed > 90 and speed < 120
select * from cars where speed >= 120 and weight < 1;

-- ������ ����
-- �������� ������ ��ģ��
-- ������ ������ ���� ����� ������ �� ������ ������ �̷������

-- ���� 
-- ��� ������ ��Ͽ��� ������ �����͸� �����ض�
delete from cars where color = '������';
select * from cars;

-- ����
-- ��� ������ ��Ͽ��� ������ �����͸� �����ض�
update cars set speed = speed + 500 where color = 'Ǫ����';
select * from cars;
update cars set speed = weight * 100 where color = 'Ǫ����';

-- ������ ���� ������ �ӵ��� ���� �ӵ��� 70%�� �����ϰ�
-- �������� �ƴ� ���� ������ �ӵ��� 120%�� �����Ͻÿ�

update cars set speed = speed * 0.7 where color = '������' and scale = '����';
update cars set speed = speed * 1.2 where color != '������' and scale = '����';

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


-- ���ι��� 70% �پ�� ���°� 10���� ���� ��� ������ ���������� �����Ͻÿ�
-- ���԰� 1.2���� ū�� �ӵ��� 120���� ���� ��� ���� ũ�⸦ �������� �����Ͻÿ�
-- �ӵ��� 30% �پ�� ���°� 60���� ���� ��� ������ �����Ͻÿ�
-- �������� �ƴ� ���� �� ���԰� 1.1�� �Ѱ� �����̰ų� ������ ������ ���ι��� 50% �����Ͻÿ�

update cars set color = '������' where zero * 0.3 > 10; 
update cars set scale = '����' where weight > 1.2 and speed < 120;
delete from cars where speed * 0.7 < 60;
update cars set zero = zero * 0.5 where color != '������' and weight > 1.1 and scale in ('����','����');
