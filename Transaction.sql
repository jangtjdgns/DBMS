 # Transaction
 -- 하나의 업무단위, 하나의 업무에 사용되는 다수 쿼리들은 모두 성공하거나, 모두 실패해야함
 -- 데이터의 무결성을 보장하기 위해 사용
 
DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;
 
CREATE TABLE `account`(
   accountNO INT(10) PRIMARY KEY AUTO_INCREMENT,
   amount INT(10) NOT NULL
);

DELETE FROM `account`;

INSERT INTO `account` SET amount = 20000;   -- 1
INSERT INTO `account` SET amount = 10000;   -- 2

SELECT * FROM `account`;

# 1이 2의 계좌에 10000원 입급 예시

# 트렌젝션 시작
START TRANSACTION;

## 1의 계좌에서 10000원 감소 -> 소지 금액 : 10000원
UPDATE `account`
SET amount = amount - 10000
WHERE accountNo = 1;
-- 만약 여기서 어떠한 이유로 작업이 중단된다면
-- 1의 계좌에서 10000원이 감소된 상태로 처리가 끝나고, 2는 10000원을 받지 못하게 된다. -> 이런 상황이 잃어나면 안된다.
ROLLBACK; -- 이런 상황이 발생하면 ROLLBACK을 통해 START TRANSACTION 부분으로 모든 작업을 되돌린다.

SELECT * FROM `account`;
## 2의 계좌에 10000원 증가 -> 소지 금액 : 20000원
UPDATE `account`
SET amount = amount + 10000
WHERE accountNo = 2;

COMMIT; -- 문제없이 진행되면 START TRANSACTION ~ COMMIT 사이에 있는 모든 작업들을 DB에 반영한다.
        -- 만약 그렇지 않으면 작업이 중단된 시점에 ROLLBACK을 수행하여 처음으로 돌아간다.