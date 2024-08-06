USE sqldb;
SELECT * FROM usertbl;

-- USERTBL의 인덱스 목록 확인
SHOW INDEX FROM usertbl;

-- usertbl의 데이터 크기와 인데스 크기 확인
SHOW TABLE STATUS LIKE 'usertbl';

-- usertbl 의 addr 컬럼에 대해 idx_usertbl_addr 이름으로 인덱스를 만들고 인덱스 목록을 확인하세요
CREATE INDEX idx_usertbl_addr
ON usertbl(addr);

SHOW INDEX FROM usertbl;


ANALYZE TABLE usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

-- 출생년도(birthYear)에 보조 인덱스 생성 
CREATE UNIQUE INDEX idx_usertbl_birthYear 
ON usertbl(birthYear);

-- 중복값이 있어 인덱스 생성 에러 발생

-- 이름(name)에 보조 인덱스 생성
CREATE UNIQUE INDEX idx_usertbl_name 
ON usertbl(name);

SHOW INDEX FROM usertbl;

-- 이름 (name)에 보조 인덱스 삭제 
DROP INDEX idx_usertbl_name
ON usertbl;

-- name,birthYear 조합으로 인덱스 생성
-- 컹엄 조합시 , ,로 이어서 널어준다
-- 여러개의 컬럼으로 인덱스를 만들 경우 각 컬럼 당 한 행이 추가 된다
CREATE UNIQUE INDEX idx_usertbl_name_birthYear
ON usertbl(name,birthYear);

SHOW INDEX FROM usertbl;