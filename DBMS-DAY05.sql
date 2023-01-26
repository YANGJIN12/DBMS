select * from people;

-- ������ ��ȯ > �Լ�
-- �Լ� > ������ �Է��� ������ �Ϸ��� ������ ���� ����� �����ϴ� ���


-- �Լ��� ���� 
-- 1. �Լ��� ��Ī
-- 2. �Լ��� �Է°�
-- ��Ī(�Է°�) > �Լ� ȣ�� ���

-- - �ý��� �Լ� -
-- ������ �Լ�
-- lower > �ҹ���ȭ
-- lower(����)
select lower('This is My Hell Party') from dual;

-- upper > �빮��ȭ
-- upper(����)
select upper('This is My Hell Party') from dual;

-- initcap > ù���ڸ� �빮��
select initcap('this is my hell party') from dual;

-- ���ڿ� ����
-- concat > �ΰ��� ������ ��ģ ���
select concat(concat('����Ư����','�����'), '�п�') from dual;

-- ���ڿ� �ɰ���
-- substr > �Ѱ��� ���忡�� �Ϻθ� �����ϴ� ���
-- substr(��������, �����ϴ� ���� ��ġ, ���� ����)
select substr(regist,3,2) as month, substr (regist,5,2) as day from people;

-- ������ ������ ���ϴ� �Լ�
-- length > ������ ���� ������ ���
select length(regist) from people;

-- ltrim, rtrim, trim > ���� ����
-- ���� ���� x > ���� ����
-- ����, ��, �ڵ�, ...
select ltrim(concat('  ',concat(name, '  '))) as name from people;
select rtrim(concat('  ',concat(name, '  '))) as name from people;
select trim(concat('  ',concat(name, '  '))) as name from people;

-- lpad, rpad > padding > �β���
-- lpad or rpad (��������, ���ڰ���, ����)
select lpad(name, 10, 'a') as name from people;
select rpad(name, 10, 'a') as name from people;

-- people���� regist�� ���������� ã�Ƽ� 5��, 4�� ������ ���
select concat(substr(regist,8,1), '��') as sex from people;

-- ���� ��ȯ > A > B
-- 2����
-- ���� ��ȯ
-- translate > ������ ���ڸ� �ٸ� ���ڷ� ��ȯ�ؾ� �Ҷ�
-- �ֹι�ȣ > 1�� ��, 2�� ��, 3�� ��, 4�� ��, ...
-- translate(��������, Ž������, ��ȯ����)
select translate(substr(regist,8,1), '1357924680', '��������������������') as gender from people;
-- ���� ���� ��ȯ�̴ٺ��� Ư���� ����� ����
select translate('12345', '23451', '0000') from dual;

-- �˻� ��ȯ
-- Ư������(1���� �̻�)�� �ٸ�����(1���� �̻�)���� �ٲٴ� ���
-- replace(��������, �˻�����, ��ȯ����)
-- �ֹι�ȣ ��������� ���� 4������ ����� 7�������� �����ض�
select replace(regist, '04','07') from people;

-- ������ �Լ�
-- �ݿø�, �ø�, ����
-- round(����, �ݿø��� �ڸ��� ��ġ) > ���ڸ� �ݿø�
select 123.456789, round(123.456789, 1) from dual;
-- trunc(����, ������ �ڸ��� ��ġ) > ���ڸ� ����
select 123.456789, trunc(123.456789, 1) from dual;
-- floor(����) > ����
select 123.456789, floor(123.456789) from dual;
-- ceil(����) > �ø�
select 123.456789, ceil(123.456789) from dual;

-- ������
-- mod(�ռ���,�ڼ���) > �ռ��ڸ� �ڼ��ڷ� ���� �������� ���ϴ� �Լ�
select floor(7 / 3), mod(7,3) from dual;

-- ���밪, ��ȣ
-- abs(����) > ��ȣ�� �����ϴ� ���
select 1, -1, abs(1), abs(-1) from dual;
-- sign(����) > ��ȣ�� ���ϴ� ���
select 3, -3, sign(3), sign(-3), sign(0) from dual;

-- ���� �Լ�
-- Ư�� ���ڸ� �ٸ� ���ڸ�ŭ ���ϴ� �Լ�
-- power(����,�¼�) > ����^�¼��� ���ϴ� �Լ�
select power(2,50) from dual;

-- log, sin, cos, tan > �ȹ��� 
-- log(����,����), sin(����), cos(����), tan(����)

-- ��¥ �Լ� > ��¥ > ������ �ٸ� ����
-- 1�� 1��, 3�� 1��
-- ������ ��¥�� ����
-- 1�� 1�� > 1, 1�� 2�� > 2, 2�� 1�� > 32
select sysdate, systimestamp from dual;
select sysdate + 1 from dual;

-- �� ���ϱ�
-- add_months(��¥, �޼���) > Ư�� ��¥�κ��� N���� ������ ��¥�� ���ϴ� ���
select 
    add_months(sysdate, 1) as now1, 
    add_months(sysdate, 2) as now2, 
    sysdate + 30 as now_1,
    sysdate + 60 as now_2
from dual;

-- ������ ��
-- last_day(��¥) > �ش� ���� ������ ���� ���ϴ� �Լ�
select last_day(sysdate+6+365) from dual;

-- Ÿ���� ����
-- new_time(��¥, ���� Ÿ����, ������ Ÿ����)
-- AST, ADT, BST, BDT, ...
select new_time(sysdate, 'AST', 'YST') from dual;

-- ���� ���ϱ�
-- next_day(��¥, ����) > �ش� ��¥�κ��� ���� �������� ������ ��¥�� ���ϴ� ���
-- �Ͽ���, ������, Monday, Tuesday > Ǯ����
-- ��, ��, Mon, Tue > ������
-- 1,2,3,4,5,6,7 > ���� > 1���� �Ͽ���, 2�� ��, ...
select next_day(sysdate, '��') from dual;

-- ������ ���ϱ�
-- month_between(��¥1, ��¥2) > �� ��¥������ �������� ���ϴ� ���
select (sysdate + 60) - sysdate from dual;
select months_between(sysdate, add_months(sysdate, 3)) from dual;

-- ��ȯ �Լ� > ���ڸ� ���ڷ�, ���ڸ� ���ڷ�, ��¥�� ���
-- ���ڷ� ��ȯ
-- to_char(����) > ������ ���·� ����
-- to_char(����,����) 
-- to_char(��¥,����) > ��¥�� Ư���� ���·� �����ϴ� ���
-- ��¥ ���� ����
-- MM > �� �� 
-- MON > �� �̸�
-- MONTH > �� �̸� ��ü
-- DD > ��¥
-- D > ����
-- DY > ����
-- DAY > ����
-- YYYY > ����
-- YY > ���� �� ���ڸ�
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD MON MONTH') from dual;
select to_char(sysdate, 'YYYY-MM-DD D DY DAY') from dual;
-- 9 > ���� 1�ڸ�
-- 0 > �� �ڸ� > ���� �ڸ��� ����°� ���� ��ĭ��� 0�� ä����
-- $ > �ش��ϴ� ���� �տ� $�� �ٿ���
-- . > �Ҽ���
select to_char(123456789,'9999999999') from dual;
select to_char(123456789,'0000009999999999') from dual;
select to_char(123456789.123456789,'999999999.999') from dual;

-- ���ڷ� ��ȯ
select to_number('1234') + 5 from dual;

-- ��¥�� ��ȯ > ���ڷε� ��¥�� ��¥ �����ͷ� ���� ��ȯ ���
select to_date('2023-01-27', 'YYYY-MM-DD') from dual;

-- �ý����� �����ϴ� �ý����Լ� ����

-- ��� ���� �� �ֹι�ȣ���� ���� ������ �����Ͻÿ�
-- ��� ���� �� �ֹι�ȣ���� ���� ������ �����Ͻÿ�
select 
    name, regist, phone, location,
    concat(
        translate(
            substr(regist,8,1),
            '1357924680',
            '��������������������'
            ),
        '��'
    ) as gender
from people;

select 
    name, regist, phone, location,
    to_char(
        to_date(
        substr(regist,1,6),
        'YYMMDD'
        ),
        'MM/DD'
    ) as birth2,
    concat(
        concat(
            to_char(to_number(substr(regist,3,2))),
            '/'
        ),
        substr(regist,5,2)
    )as birth
from
people;

-- ��� ������ ����Ͻÿ�
-- ����� ź����, ����, ����, �ܱ��� ����, �̸�, �ּҸ� ������
-- ������ �߸��� �ֹι�ȣ�� �����ϰ� ����Ͻÿ�
-- ���� ������ ������ ����Ͻÿ�
-- �ֹι�ȣ 5,6,7,8�� �ܱ����̴�
-- �ֹι�ȣ 9,0�� ������ �߸��� �ֹι�ȣ�̴�

select
    name, regist, phone, location,
    to_char(
        to_date(
            substr(regist,1,6),
                'YYYYMMDD'
            ),
            'YYYY/MM/DD'
        ) as birthday,
      to_char(
        to_date(
            substr(regist,1,6), 'MMDD'
            ),
            'MM/DD'
        ) as birth,
     concat(
        translate(
            substr(regist,8,1),
                '1357924680',
                '��������������������'
            ),
        '��'
    ) as gender,
    translate(
        substr(regist,8,1),
        '5678123490','OOOOXXXXXX'
    ) as foreigner,
    to_char(
        add_months(
            to_date(
                concat(
                    to_char(sysdate, 'YYYY'),
                        to_char(
                            to_date(
                                substr(regist,1,6),'YYMMDD'
                            ),
                            'MMDD'
                        )
                    ),'YYYYMMDD'
                ),12
            ),'DAY'
        ) as thisbirth
from
people
where
    substr(regist,8,1) != '9' or 
    substr(regist,8,1) != '0';






