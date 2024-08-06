--   기본 DB가 선택 안되어있을 경우에는
-- 1) use 데이터 베이스명;
-- 2) shopdb.prodicttbl처럼 사용
-- 3) 데이터베이스명 더블 클릭


--  * : 모두 선택 , FROM 뒤에는 테이블 명, SELECT 뒤에는 컬럼(열)
SELECT * FROM producttbl;
-- 데이터를 두개 이상 검색 할 때는 ,로 이어준다
SELECT memberName, memberAddress FROM membertbl;
-- WHERE 절 뒤에는 조건식, = 이 같다라는 뜻으로 쓰임
SELECT * FROM membertbl WHERE memberName = '지운이';