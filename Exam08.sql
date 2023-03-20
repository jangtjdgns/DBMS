USE scott;
#21. 부서별 최대 급여와 최소 급여를 구하는 쿼리 (hint : group by, min(), max())
SELECT DEPTNO AS '부서번호', MAX(SAL) AS '부서별 최대 급여'
FROM EMP
GROUP BY DEPTNO;

#22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만) (hint : group by, having)
SELECT DEPTNO AS '부서번호', AVG(SAL) AS '부서별 급여 평균'
FROM EMP
GROUP BY DEPTNO
HAVING `부서별 급여 평균` >= 2000;

#23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라. (hint : group by, having)
SELECT DEPTNO AS '부서번호', AVG(SAL) AS '부서별 급여 평균'
FROM EMP
WHERE SAL >= 1000
GROUP BY DEPTNO
HAVING `부서별 급여 평균` >= 2000;

#24. 사원명과 부서명을 조회하시오. (hint : inner join)
SELECT E.ENAME AS '사원명', D.DNAME AS '부서명'
FROM EMP AS E
INNER JOIN DEPT AS D ON E.DEPTNO = D.DEPTNO;

#25. 이름,월급여,월급여등급을 조회하시오. (hint : inner join, between)
SELECT E.ENAME AS '사원명', E.SAL AS '월급여', S.GRADE AS '월급여등급'
FROM EMP AS E
INNER JOIN SALGRADE AS S ON E.SAL BETWEEN LOSAL AND HISAL
ORDER BY `월급여등급` DESC;

#26. 이름,부서명,월급여등급을 조회하시오. 
SELECT E.ENAME AS '사원명', D.DNAME AS '부서명', S.GRADE AS '월급여등급'
FROM EMP AS E
INNER JOIN DEPT AS D ON E.DEPTNO = D.DEPTNO
INNER JOIN SALGRADE AS S ON E.SAL BETWEEN S.LOSAL AND HISAL
ORDER BY `월급여등급` DESC;

#27. 이름,직속상사이름을 조회하시오. (hint : self join)
SELECT E1.ENAME AS '사원명', E2.ENAME AS '직속상사'
FROM EMP AS E1
INNER JOIN EMP AS E2 ON E1.MGR = E2.EMPNO;

#28. 이름,직속상사이름을 조회하시오.(단 직속 상사가 없는 사람도 직속상사 결과가 null값으로 나와야 함) (hint : outer join)
###외부OUTER 조인. A LEFT JOIN B는 조인 조건에 만족하지 못하더라도 왼쪽 테이블 A의 행을 나타내고 싶을 때 사용한다. 반대로 A RIGHT JOIN B는 조인 조건에 만족하지 못하더라도 오른쪽 테이블 B의 행을 나타내고 싶을 때
SELECT E1.ENAME AS '사원명', E2.ENAME AS '직속상사'
FROM EMP AS E1
LEFT JOIN EMP AS E2 ON E1.MGR = E2.EMPNO;
