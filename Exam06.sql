# a5 데이터베이스 삭제/생성/선택
DROP DATABASE IF EXISTS `a5`;
CREATE DATABASE `a5`;
USE `a5`;

# 부서(dept) 테이블 생성 및 홍보부서 기획부서 추가
CREATE TABLE dept(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    `name` VARCHAR(50) NOT NULL UNIQUE -- 부서명은 유니크 해야됨
);

INSERT INTO dept
SET regDate = NOW(),
    `name` = '홍보';
    
INSERT INTO dept
SET regDate = NOW(),
    `name` = '기획';

SELECT * FROM dept;
DESC dept;

# 사원(emp) 테이블 생성 및 홍길동사원(홍보부서), 홍길순사원(홍보부서), 임꺽정사원(기획부서) 추가
CREATE TABLE emp(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    deptName VARCHAR(100) NOT NULL  
);

INSERT INTO emp
SET regDate = NOW(),
    `name` = '홍길동',
    deptName = '홍보';

INSERT INTO emp
SET regDate = NOW(),
    `name` = '홍길순',
    deptName = '홍보';

INSERT INTO emp
SET regDate = NOW(),
    `name` = '임꺽정',
    deptName = '기획';
    
SELECT * FROM emp;
DESC emp;

# 홍보를 마케팅으로 변경
-- dept 수정
UPDATE dept
SET `name` = '마케팅'
WHERE `name` = '홍보';

SELECT * FROM dept;

-- emp 수정
UPDATE emp
SET deptName = '마케팅'
WHERE deptName = '홍보';

SELECT * FROM emp;

# 마케팅을 홍보로 변경
-- dept 수정
UPDATE dept
SET `name` = '홍보'
WHERE `name` = '마케팅';

SELECT * FROM dept;

-- emp 수정
UPDATE emp
SET deptName = '홍보'
WHERE deptName = '마케팅';

SELECT * FROM emp;

# 홍보를 마케팅으로 변경
-- dept 수정
UPDATE dept
SET `name` = '마케팅'
WHERE `name` = '홍보';

SELECT * FROM dept;

-- emp 수정
UPDATE emp
SET deptName = '마케팅'
WHERE deptName = '홍보';

SELECT * FROM emp;

# 구조를 변경하기로 결정(사원 테이블에서, 이제는 부서를 이름이 아닌 번호로 기억)
ALTER TABLE emp CHANGE deptName deptId INT(10) UNSIGNED NOT NULL;

UPDATE emp
SET deptId = 1
WHERE `name` = '홍길동'
OR `name` = '홍길순';

UPDATE emp
SET deptId = 2
WHERE `name` = '임꺽정';

SELECT * FROM emp;

# 사장님께 드릴 인명록을 생성
SELECT *
FROM emp;
SELECT * FROM dept;
# 사장님께서 부서번호가 아니라 부서명을 알고 싶어하신다.
# 그래서 dept 테이블 조회법을 알려드리고 혼이 났다.
SELECT *
FROM dept
WHERE id = 1;

# 사장님께 드릴 인명록을 생성(v2, 부서명 포함, 올바른 조인 룰(ON) 적용)
# 보고용으로 좀 더 편하게 보여지도록 고쳐야 한다고 지적받음
SELECT e.*, d.name
FROM emp AS e
INNER JOIN dept AS d ON e.deptId = d.id;

# 사장님께 드릴 인명록을 생성(v3, 사장님께서 보시기에 편한 칼럼명(AS))
SELECT e.id AS '사원번호', e.name AS '사원명', DATE_FORMAT(e.regDate, '%y년 %c월 %d일') AS '입사일', d.name AS '부서명'
FROM emp AS e
INNER JOIN dept AS d ON e.deptId = d.id;