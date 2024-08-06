-- 1.sqldb데이터베이스에서 다음 조건을  출력하세요
USE sqldb;


-- 1-1)사용자 별로 구매 이력을 출력함 ->buytbl 과 usertbl 둘 다 필요하다
	-- 모든 컬럼 출력 -> SELECT *
	-- 구매 이력이 없는 정보는 출력 x -> INNER JOIN운 두 테이블의 모두 정보가 존재해야 출력된다
-- JOIN 시 보통 테이블의 별칭을 정해준다
-- ON 뒤에는 어떤 칼럼을 기준으로 합쳐줄건지를 적어준다
SELECT * 
FROM buytbl b INNER JOIN usertbl u 
ON b.userID = u.userID;

-- 1-2) 앞에 결과에서 userID가 'JYP'인것만 출력하세요
-- 앞에 쿼리에서 where절만 추가 
-- 어떤 테이블의 userID 여도 동일한 결과가 출력된다
SELECT * 
FROM buytbl b INNER JOIN usertbl u 
ON b.userID = u.userID
WHERE b.userID = 'JYP';



-- 2.sqldb 데이토베이스에서 다음 조건을 처리하세요 

-- 2-1)각 사용자별로 구매 이력을 출력하세요 -> buytbl 과 usertbl 둘 다 필요
-- 2-2)연결컬럼은 userID로 함 ->	ON b.userID = u.userID
-- 2-3)결과는 userID를 기준으로 오름차순으로 정렬함 ->ORDER BY userID
-- 2-4)구매이력이 없는 사용자도 출력하세요 -> OUTER JOIN (usertbl 기준)


-- 2-5)userID ,name,prodNamme, addr,연락처 를 다음과 같이 출력하세요 ->SELECT문에 해당 컬럼 넣기
-- 연락처는 mobile1과 mobile2 를 합쳐서 만듬 -> CONCAT(u.mobile1,u.mobile2) AS '연락처'
SELECT u.userID,u.name,b.prodName,u.addr,CONCAT(mobile1,mobile2) AS '연락처'
FROM usertbl u LEFT OUTER JOIN buytbl b
ON b.userID = u.userID
ORDER BY userID;

-- 3.sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요
SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbL
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);

-- 4.sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력하세요
SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbL
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);
