USE scott;

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

#29. 이름,부서명을 조회하시오.단, 사원테이블에 부서번호가 40에 속한 사원이 없지만 부서번호 40인 부서명도 출력되도록 하시오. (hint : outer join) 
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM EMP AS e
RIGHT JOIN DEPT AS d ON e.DEPTNO = d.DEPTNO;

#서브 쿼리는 SELECT 문 안에서 ()로 둘러싸인 SELECT 문을 말하며 쿼리문의 결과를 메인 쿼리로 전달하기 위해 사용된다.
#사원명 'JONES'가 속한 부서명을 조회하시오.
#부서번호를 알아내기 위한 쿼리가 서브 쿼리로 사용. 

-- join, sub query 사용 x
SELECT e.ENAME AS '사원명', DNAME AS '부서명'
FROM EMP AS e, DEPT AS d
WHERE e.ENAME = 'JONES'
AND e.DEPTNO = d.DEPTNO;

-- join 사용
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM EMP AS e
INNER JOIN DEPT AS d ON e.DEPTNO = d.DEPTNO
AND e.ENAME = 'JONES';

-- SELECT 절에서의 서브쿼리
SELECT e.ENAME AS '사원명',
    (
    SELECT d.DNAME
    FROM DEPT AS d
    WHERE e.DEPTNO = d.DEPTNO
    ) AS '부서명'
FROM EMP AS e
WHERE e.ENAME = 'JONES';

-- FROM 절에서의 서브쿼리 (DEPT 서브쿼리)
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM EMP AS e,
    (
    SELECT DNAME, DEPTNO
    FROM DEPT
    ) AS d
WHERE e.ENAME = 'JONES'
AND e.DEPTNO = d.DEPTNO;

-- FROM 절에서의 서브쿼리 (EMP 서브쿼리)
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM (
    SELECT ENAME, DEPTNO
    FROM EMP
    WHERE ENAME = 'JONES'
    ) AS e, DEPT AS d
WHERE e.DEPTNO = d.DEPTNO;

-- WHERE 절에서의 서브쿼리 
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM EMP AS e, DEPT AS d
WHERE (e.ENAME, d.DNAME) IN
    (
    SELECT e.ENAME, d.DNAME
    FROM EMP AS e, DEPT AS d
    WHERE d.DEPTNO = e.DEPTNO
    AND e.ENAME = 'JONES'
    );

-- WHERE 절에서의 EMP 단일행 서브쿼리, DEPT 다중행 서브쿼리
SELECT e.ENAME AS '사원명', d.DNAME AS '부서명'
FROM EMP AS e, DEPT AS d
WHERE e.ENAME =     -- = or IN
    (
    SELECT ENAME
    FROM EMP
    WHERE ENAME = 'JONES'
    )
AND d.DEPTNO IN
    (
    SELECT DEPTNO
    FROM DEPT
    )
AND e.DEPTNO = d.DEPTNO;

-- where 절에서의 다중행 서브쿼리 (JONES의 부서명만 조회)
SELECT DNAME AS '부서명'
FROM DEPT
WHERE DEPTNO IN
    (
    SELECT DEPTNO
    FROM EMP
    WHERE ENAME = 'JONES'
    );

#30. 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 조회하시오. (hint : sub query)
SELECT e.ENAME AS '사원명',
    (
    SELECT d.DNAME
    FROM DEPT AS d
    WHERE d.DEPTNO = 10
    ) AS '부서명'
FROM EMP AS e
WHERE e.DEPTNO = 10;

#31. 평균 월급여보다 더 많은 월급여를 받은 사원의 사원번호,이름,월급여 조회하시오. (hint : sub query) 
-- 평균 월급
SELECT AVG(SAL) AS '평균월급' FROM EMP;

-- 월급이 평균 월급 초과인 사원
SELECT EMPNO AS '사원번호', ENAME AS '사원명', SAL AS '월급여'
FROM EMP
WHERE SAL >
    (
    SELECT AVG(SAL)
    FROM EMP
    );
    
#32. 부서번호가 10인 사원중에서 최대급여를 받는 사원의 사원번호, 이름을 조회하시오. (hint : sub query)
SELECT EMPNO AS '사원번호', ENAME AS '사원명'
FROM EMP
WHERE DEPTNO = 10
AND SAL IN
    (
    SELECT MAX(SAL)
    FROM EMP
    );