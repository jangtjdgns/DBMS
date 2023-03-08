# 전체 데이터베이스 리스팅
SHOW DATABASES;

# `mysql` 데이터 베이스 선택
USE `mysql`;

# 테이블 리스팅
SHOW TABLES;

# 특정 테이블의 구조
DESC db;

# `test` 데이터 베이스 선택
USE `test`;

# 테이블 리스팅
SHOW TABLES;

# 기존에 a1 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS `a1`;

# 새 데이터베이스(`a1`) 생성
CREATE DATABASE `a1`;

# 데이터베이스(`a1`) 선택
USE `a1`;

# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;

# 테이블 확인
SHOW TABLES;

# 게시물 테이블 article(title, body)을 만듭니다.
# VARCHAR(100) => 문자 100개 저장가능
# text => 문자 많이 저장가능
CREATE TABLE article(
    title VARCHAR(100),
    `body` TEXT
);

# 잘 추가되었는지 확인, 리스팅과 구조까지 확인
SHOW TABLES;
DESC article;

# 데이터 하나 추가(title = 제목, body = 내용)
INSERT INTO article
SET title = '제목',
    `body` = '내용';

# 데이터 조회(title 만)
SELECT title
FROM article;

# 데이터 조회(title, body)
SELECT title, `body`
FROM article;

# 데이터 조회(body, title)
SELECT `body`, title
FROM article;

# 데이터 조회(*)
SELECT *
FROM article;

# 데이터 또 하나 추가(title = 제목, body = 내용)
INSERT INTO article
SET title = '제목',
    `body` = '내용';

# 데이터 조회(*, 어떤게 2번 게시물인지 알 수 없음)
SELECT *
FROM article;

# 테이블 구조 수정(id 칼럼 추가, first)
ALTER TABLE article ADD COLUMN id INT(10)

# 데이터 조회(*, id 칼럼의 값은 NULL)
SELECT *
FROM article;

# 기존 데이터에 id값 추가(id = 1, id IS NULL)
UPDATE article
SET id = 1;

# 데이터 조회(*, 둘다 수정되어 버림..)
SELECT *
FROM article;

# 기존 데이터 중 1개만 id를 2로 변경(LIMIT 1)
UPDATE article
SET id = 2
LIMIT 1;

# 데이터 조회(*)
SELECT *
FROM article;

# 데이터 1개 추가(id = 3, title = 제목3, body = 내용3)
INSERT INTO article
SET id = 3,
    title = '제목3',
    `body` = '내용3';

# 데이터 조회(*)
SELECT *
FROM article;

# 2번 게시물, 데이터 삭제 => DELETE
DELETE
FROM article
WHERE id = 2;

# 데이터 조회(*)
SELECT *
FROM article;

# 날짜 칼럼 추가 => regDate DATETIME
ALTER TABLE article ADD COLUMN regDate DATETIME;

# 테이블 구조 확인
DESC article;

# 데이터 조회(*, 날짜 정보가 비어있음)
SELECT *
FROM article;

# 1번 게시물의 비어있는 날짜정보 채움(regDate = 2018-08-10 15:00:00)
UPDATE article
SET regDate = '2018-08-10 15:00:00'
WHERE id = 1;

# 데이터 조회(*, 이제 2번 게시물의 날짜 정보만 넣으면 됩니다.)
SELECT *
FROM article;

# NOW() 함수 실행해보기
SELECT NOW();

# 3번 게시물의 비어있는 날짜정보 채움(NOW())
UPDATE article
SET regDate = NOW()
WHERE id = 3;

# 데이터 조회(*)
SELECT *
FROM article;

# 테이블 삭제
DROP TABLE article;

# article 테이블 추가
CREATE TABLE article(
    title VARCHAR(100),
    `body` TEXT
);

# 제목1인 데이터 추가
INSERT INTO article
SET title = '제목1',
    `body` = '내용1';

# 제목2인 데이터 추가
INSERT INTO article
SET title = '제목2',
    `body` = '내용2';

# 데이터 조회(*)
SELECT *
FROM article;

# 제목2인 데이터 삭제
DELETE
FROM article
WHERE title = '제목2';

# 제목3, 내용3 데이터 추가 (x2)
INSERT INTO article
SET title = '제목3',
    `body` = '내용3';

# 제목3인 게시물 중 두번째 것만 제목을 새제목3으로 수정 (게시물 구분 안됨)
UPDATE article
SET title = '새제목3'
WHERE title = '제목3'
LIMIT 1;

# 테이블 구조 확인
SELECT * FROM article;
DESC article;

# 테이블 구조 수정 - 칼럼 추가(ADD), 기존 칼럼 삭제(DROP), 기존 칼럼 내용 변경(MODIFY)
# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
ALTER TABLE article ADD COLUMN id INT(10);
SELECT * FROM article;

# 기존 데이터에 id값 추가
UPDATE article
SET id = 1;

# 기존 데이터 중 1개만 id를 2로 변경
UPDATE article
SET id = 2
LIMIT 1;
 
# 데이터 조회
SELECT *
FROM article;

# 2번 게시물만 조회
SELECT *
FROM article
WHERE id = 2;

# 2번 게시물, 데이터 삭제 => DELETE
DELETE
FROM article
WHERE id = 2;

# 데이터 조회
SELECT *
FROM article;

# 3번 게시물 id를 3으로 변경
UPDATE article
SET id = 3
WHERE title = '제목3';

# 1번 게시물 제목을 제목2로 변경
UPDATE article
SET title = '제목1'
WHERE id = 1;

# 데이터 조회
SELECT *
FROM article;

# 모든 데이터 삭제
DELETE
FROM article;

# 데이터 조회
SELECT *
FROM article;

# 번호 1, 제목1, 내용1 추가
INSERT INTO article
SET id = 1,
    title = '제목1',
    `body` = '내용1';

# 번호 1, 제목2, 내용2 추가 -> 추가가 안되어야 하는데 되고 있다.
INSERT INTO article
SET id = 1,
    title = '제목1',
    `body` = '내용1';

# id컬럼에 unique 제약을 걸어야 한다. not null 제약을 걸어야 한다.
# 컬럼에 제약을 거는 방법
# 1. 테이블 만들 때 
# 2. 테이블 구조 변경으로
# 다시 테스트하기 위해 aritlce 데이터 삭제
DELETE
FROM article;

ALTER TABLE article MODIFY COLUMN id INT(10) NOT NULL UNIQUE;

# 번호 1, 제목1, 내용1 추가
INSERT INTO article
SET id = 1,
    title = '제목1',
    `body` = '내용1';

# 번호 2, 제목2, 내용2 추가 
INSERT INTO article
SET id = 2,
    title = '제목2',
    `body` = '내용2';

# 번호 없이 제목3, 내용3 추가 -> 번호가 없으면 not null이기 때문에 기본값 0으로 잡히기 됨
INSERT INTO article
SET title = '제목3',
    `body` = '내용3';

# 번호 없이 제목4, 내용4 추가 -> 위에서 기본값 0으로 추가를 했기 때문에 중복 발생
INSERT INTO article
SET title = '제목4',
    `body` = '내용4';

SELECT * FROM article;

# 자동증가 제약 걸기
DELETE FROM article;
ALTER TABLE article MODIFY id INT(10) UNIQUE NOT NULL AUTO_INCREMENT FIRST;

# 테이블 구조 확인
SELECT * FROM article;
DESC article;

# 번호 없이 제목4, 내용4 까지 추가 -> id를 따로 저장하지 않아도 자동증가하면서 잘 추가됨
INSERT INTO article
SET title = '제목1',
    `body` = '내용1';
    
INSERT INTO article
SET title = '제목2',
    `body` = '내용2';
    
INSERT INTO article
SET title = '제목3',
    `body` = '내용3';
    
INSERT INTO article
SET title = '제목4',
    `body` = '내용4';

# 데이터 확인
SELECT *
FROM article;