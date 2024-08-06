SELECT * FROM sqldb.buytbl;

-- CREATE VIEW : 뷰 생성
-- CONCAT(문자열 1,문자열2): 문자열 두개 합치기
-- VIEW 는 테이블에서 필요한 내용만 뽑아낸 작은 가상의 테이블이다
CREATE VIEW v_userbuytbl
AS
SELECT U.userid,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS '연락처'
FROM usertbl U INNER JOIN buytbl B
ON U.userid = B.userid;


SELECT * FROM v_userbuytbl WHERE name='김범수';