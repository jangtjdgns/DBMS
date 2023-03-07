-- 1일차 연습문제

# 전체 데이터베이스 리스팅
SHOW DATABASES;

# `mysql` 데이터 베이스 선택
USE `mysql`;

# 테이블 리스팅
SHOW TABLES;

# `db` 테이블의 구조 확인
DESC `db`;

# 기존에 `board` 데이터베이스가 존재 한다면 삭제
DELETE DATABASE IF EXISTS `board`;

# 새 데이터베이스(`board`) 생성
CREATE DATABASE `board`;

# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;

# `board` 데이터 베이스 선택
USE `board`;

# 테이블 확인
SHOW TABLES;

# 게시물 테이블(`article`)을 만듭니다.
CREATE TABLE `article`(
    title VARCHAR(50),
    `body` VARCHAR(50)
);

# 잘 추가되었는지 확인
SHOW TABLES;

# 제목은 '제목1', 내용은 '내용1'인 데이터 하나 추가 
INSERT INTO `article`
SET title = '제목1',
    `body` = '내용1';

# 제목 조회
SELECT title
FROM article;

# 내용 조회
SELECT `body`
FROM article;

# 제목, 내용 칼럼 데이터 조회
SELECT title, `body`
FROM article;

# 내용, 제목 칼럼 데이터 조회
SELECT `body`, title
FROM article;

# 모든 데이터 조회
SELECT *
FROM article;

# 제목1, 내용1 데이터 추가
INSERT INTO article
SET title = '제목1'
    `body` = '내용1';

# 제목2, 내용2 데이터 추가
INSERT INTO article
SET title = '제목2'
    `body` = '내용2';

# 데이터 조회
SELECT *
FROM article;

# 제목 데이터 aaa로 수정(모두 수정됨..)
UPDATE article
SET title = 'aaa';

# `body`가 내용2인 것만 조회
SELECT *
FROM article
WHERE `body` = '내용2';

# 내용2만 새로운내용2 로 수정
UPDATE article
SET `body` = '새로운내용2'
WHERE `body` = '내용2';

# 데이터 조회
SELECT *
FROM article;

# 데이터 삭제 (모든 데이터가 삭제...)
DELETE FROM article;

# 제목1, 내용1 데이터 추가
INSERT INTO artifle
SET title = '제목1'
    `body` = '내용1';

# 제목2, 내용2 데이터 추가
INSERT INTO artifle
SET title = '제목2'
    `body` = '내용2';

# 제목이 제목1인 것만 삭제
DELETE FROM article
WHERE title = '제목1';
