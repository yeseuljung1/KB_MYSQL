-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl1을 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
USE sqldb;

CREATE TABLE tbl1 (tbl1
	a INT PRIMARY KEY,
	b INT,
	c INT
);

-- ---------------------------------------------------------------------------------------------------------

-- 해당 테이블에 대한 인덱스를 보여줌
-- PK 제약조건을 걸면, 해당 속성이 클러스터형 인덱스로 자동 생성됨
SHOW INDEX FROM tbl1;

-- ---------------------------------------------------------------------------------------------------------

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl2를 생성하고,자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl2 (
-- PK는 클러스트형 인덱스 자동 생성, 테이블 당 하나만 생성됨
	a INT PRIMARY KEY,
    -- UNIQUE는 보조 인덱스 자동 생성, 보조 인덱스는 여러개 성성 가능
	b INT UNIQUE,
	c INT UNIQUE,
	d INT
);

SHOW INDEX FROM tbl2;

-- ---------------------------------------------------------------------------------------------------------

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl3를 생성하고,자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl3 (
	a INT UNIQUE,
	b INT UNIQUE,
	C INT UNIQUE,
	d INT
);
-- UNIQUE 컬럼만 세개기 때문에 보조 인덱스만 3개 생성됨
SHOW INDEX FROM tbl3;

-- ---------------------------------------------------------------------------------------------------------

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl4를 생성하고,자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl4 (
--  UNIQUE + NOT NULL 은 PK와 동일 하게 클러스터형 인덱스로 생성된다.
	a INT UNIQUE NOT NULL,
	b INT UNIQUE,
	C INT UNIQUE,
	d INT
);
-- a는 클러스트형 인덱스
-- b는 보조형 인덱스

SHOW INDEX FROM tbl4;

-- ---------------------------------------------------------------------------------------------------------

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl5를 생성하고,자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl5 (
	a INT UNIQUE NOT NULL,
	b INT UNIQUE,
	C INT UNIQUE,
	d INT PRIMARY KEY
);
-- 한테이블에는 무조선 클러스트형 인덱스가 하나만 가능하기 때문에 우선 순위가 높은 PK가 클러스터형 인덱스가 되고 나머지 UNIQUE 값들은 모두 보조형 인덱스가 된다
SHOW INDEX FROM tbl5;

-- ---------------------------------------------------------------------------------------------------------

-- testdb에 다음 컬럼 목록을 가지는 usertbl을 만드세요.
-- testdb 가 존재하지 않으면 만들어주겠다
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
-- usertbl이 존재하면 지워주겠다
DROP TABLE IF EXISTS usertbl; 
CREATE TABLE usertbl(
	 userID CHAR(8) NOT NULL PRIMARY KEY,
	 name VARCHAR(10) NOT NULL,
	 birthYear INT NOT NULL,
	 addr NCHAR(2) NOT NULL
);

-- ---------------------------------------------------------------------------------------------------------

-- 아래 데이터를 추가하고, 클러스터형 인덱스의 테이블 내용을 확인하세요.
INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES ('SSK', '성시경', 1979, '서울');

-- PRIMARY KEY 인 userid 기준으로 데이터가 정렬되어있다(ABC순)
SELECT * FROM usertbl;

-- ---------------------------------------------------------------------------------------------------------

-- ALTER를 사용하여 usertbl에서 PRIMARY KEY 제약조건을 제거하고,name 컬럼에 pk_name이라는 제약조건명으로 기본키를 설정하세요.
ALTER TABLE usertbl DROP PRIMARY KEY;
ALTER TABLE usertbl ADD CONSTRAINT pk_name PRIMARY KEY (name);

-- ---------------------------------------------------------------------------------------------------------
