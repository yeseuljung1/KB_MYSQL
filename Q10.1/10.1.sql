--  USE sqldb;
-- SELECT *  FROM buytbl;

-- -- 트랜잭션 시작
-- START TRANSACTION; 

-- -- 1.2번 삭제
-- DELETE FROM buytbl WHERE num = 1;
-- DELETE FROM buytbl WHERE num = 2;

-- SELECT *  FROM buytbl;

-- -- 1.2번 다시 복구
-- ROLLBACK;

-- SELECT *  FROM buytbl;



-- 1이면 켜진거 0이면 꺼진것
-- SELECT @@autocommit;
-- SELECT @@autocommit = false;





-- 데이터베이스가 존재하는 경우 삭제
DROP DATABASE IF EXISTS jdbc_ex;

-- 데이터베이스 생성
CREATE DATABASE jdbc_ex;

-- 데이터베이스 선택
USE jdbc_ex;

-- 사용자가 존재하는 경우 삭제
DROP USER IF EXISTS 'jdbc_ex'@'%';

-- 사용자 생성 및 권한 부여
-- jdbc_ex = user id / % = 접속 ip /IDENTIFIED BY 'jdbc_ex' = 비밀번호
CREATE USER 'jdbc_ex'@'%' IDENTIFIED BY 'jdbc_ex';
-- GRANT ~ ON :권한 부여하는 명령어
--  ALL PRIVILEGES :모든 권한 부여
-- jdbc_ex 라는 사용자에게 jdbc_ex 데이터베이스 내의 모든 권한 부여
GRANT ALL PRIVILEGES ON jdbc_ex.* TO 'jdbc_ex'@'%';
-- 권한 즉시 서버에 적용
FLUSH PRIVILEGES;

