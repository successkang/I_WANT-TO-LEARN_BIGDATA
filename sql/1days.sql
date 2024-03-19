# 데이터 베이스 선택
use ubion;
# 데이터 베이스에서 emp table 데이터를 모두 출력
select * from emp;
# emp table에서 sal 컬럼(필드)의 데이터가 1500이상인 사원의 정보 출력
select * from emp where sal >= 1500;

# emp table에서 job이 manager고 sal이 1500이상인 사원의 이름 출력
#인덱스(레코드, 행)의 조건 : job = manager, sal >= 1500
#컬럼(필드, 열)의 조건 : 사원의 이름
select `ename` from `emp` 
where job = 'manager' 
and  sal >= 1500; 

#emp table에서 sal이 1500이상이고 2500이하인 사원의 정보 출력
#case 1
select * from `emp` 
where sal >= 1500
and sal <= 2500;

#case2
select * from `emp`
where sal 
between 1500 and 2500;


# emp table 에서 job이 manager거나 salesman인
#사원인 정보를 출력

select * from `emp`
where job = 'manager'
or job = 'salesman';

#case 2
select * from `emp`
where job
in ('salesman', 'manager'); 

# 사원의 이름이 특정문자(s)로 시작하는 사원의 정보 출력
select * from `emp`
where ename like 's%';

#사원의 이름이 특정문자(s)로 시작하는 사원의 정보 출력
select * from `emp`
where ename like '%a%';

#사원의 이름이 특정 문자로 끝이나는 사원의 정보 출력
select * from `emp`
where `ename` like '%s';

# 두개의 테이블을 특정 조건에 맞게 열 결합
select * from
`emp` inner join `dept`
on `emp`.DEPTNO = `dept`.DEPTNO
where loc = 'chicago';

# 두개의 table을 특정 조건에 맞기 열 겹합 후 
#부서 번호가 20인 사원 정보 출력
select * from
`emp` inner join `dept`
on `emp`.deptno = `dept`.deptno
where `emp`.deptno = 20;


## 부서의 지역이 new york인 사원의 정보만 출력

select * from
`emp` inner join `dept`
on `emp`.deptno = `dept`.deptno
where loc = 'new york';

# case2 (sub query)
select * 
from `emp` 
where `deptno` 
      in (
      select `deptno` 
	  from `dept`
      where `loc` != 'new york'
      );


# 단순한 행 결합 (유니언 결합)
SELECT * FROM `TRAN_1`
union
SELECT * FROM `TRAN_2`;

# `` 를 사용하는 이유
# TABLE의 이름이나 컬럼의 이름에 공백이 존재하는 경우
SELECT * FROM `SALES RECORDS`;
select `ITEM TYPE`, `SALES CHANNEL` 
FROM `SALES RECORDS`;


## 그룹화 
# 조건 처리하고 그룹
# 그룹화 하기 전에 조건 후 그룹화
# 그룹화 하기전에 조건 후 그룹화 후 조건 후 정렬

#SALES RECORDS에서 대륙병 총이윤의 합계
SELECT `REGION`, 
SUM(`TOTAL PROFIT`) AS `SUM`
FROM `SALES RECORDS`
group by `REGION`
ORDER BY `SUM` desc;


## 국가(COUNTRY)별 총 이윤 (TOTAL PROFIT)을 구하고
# 총이윤을 기준으로 내림차순 정렬
SELECT `COUNTRY`, SUM(TOTAL PROFIT) AS SUM
FROM `SALES RECORDS`
GROUP BY `COUNTRY`
ORDER BY `TOTAL PROFIT` DESC
LIMIT 3;
    
    
    ## 아시아의 국가들 중 총 이윤이 합계 높은 5개 국가 출력
SELECT 
  `COUNTRY`, `TOTAL PROFIT` 
FROM 
  `SALES RECORDS`
where 
   `REGION` IN ('ASIA')
ORDER BY `TOTAL PROFIT` DESC 
LIMIT 5;





