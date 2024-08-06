-- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.

-- 1번
-- GROUP BY로 userID별 그룹을 만들어서 amount의 총 합계를 SUM으로 구해줌
SELECT * FROM buytbl;
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl
GROUP BY userID;

-- 각 구매 개수 * 가격을 구해준 후 총합을 구해줌
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매액'
FROM buytbl
GROUP BY userID;


-- 2번
-- 전체 개수의 평균이므로 그룹화가 불필요
SELECT AVG (amount) AS '평균 구매 개수' FROM buytbl;

-- userID별로 평균값이 필요하므로 그룹화 필요
SELECT userID, AVG (amount) AS '평균 구매 개수' FROM buytbl
GROUP BY userID;

-- 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
-- MAX로는 가장 키가 큰사람 , MIN으로는 가장 키가 작은 사람 출력
-- OR을 사용해야 둘 중 하나만 만족해도 출력 가능
SELECT name , height FROM usertbl;
WHERE height = (SELECT MAX(height) FROM usertbl)
OR height = (SELECT MIN(height) FROM usertbl);


-- 3번
SELECT * FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;


-- 4번
-- 사용자 별 총 구매액을 출력하세요.
-- ~별이 나오면 GROUP BY 예상 가능
SELECT userID AS '사용자' ,SUM(price * amount) AS '총구매액' FROM buytbl
GROUP BY userID;

-- 총 구매액이 1,000이상인 사용자만 출력하세요
-- WHERE절은 그룹화하기 전에 필터링하는 작업이다
-- 따라서 그룹화된 데이터에 조건을 추가하려면 HAVING을 사용해야한다
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액' FROM buytbl
GROUP BY userID
HAVING SUM(price * amount) >=1000;


-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오
SELECT SUM(population) FROM city WHERE countrycode ='KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수중 최소값을 구하시오 단, 결과를 나타내는 테이블의 필드는 '최소값'으로 표시하시오
SELECT MIN(population) AS '최소값' FROM city WHERE countrycode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오
SELECT AVG(population) FROM city WHERE countrycode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오. 단 결과를 나타내는 테이블의 필드는 '최대값'으로 표시하시오
SELECT MAX(population) AS '최대값' FROM city WHERE countrycode = 'KOR';

-- country 테이블 각 레코드의 name 칼럼의 글자 수를 표시하시오
-- LENGTH :해당 문자열의 길이
SELECT name, LENGTH(name) FROM country;

-- country 테이블의 나라명을 (Name 칼럼명) 앞 세글자만 대문자로 표시하시오
-- UPPER : 특정 글자 대문자로 변경
-- MID : 문자열 추출(문자열, 시작 위치,길이), 시작 위치는 1부터 시작
SELECT UPPER(MID(name, 1, 3)) FROM country;

-- country 테이블의 기대수명을 소수점 첫째자리에서 반올림해서 표시하시오
-- ROUND : 반올림 (반올림 할 값, 몇째 자리에서 반올림할지)
SELECT name AS '이름', ROUND(lifeexpectancy,1) as '기대수명' FROM country;