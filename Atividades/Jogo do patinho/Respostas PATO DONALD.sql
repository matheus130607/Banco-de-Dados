-- Atividade 1 --
show tables;

-- Atividade 2 --
describe ducks;

-- Atividade 3 --
select * from ducks;

-- Atividade 4 --
SELECT * 
FROM ducks 
WHERE age <= 2;

-- Atividade 5 --
SELECT *
FROM DUCKS
ORDER BY AGE;

-- Atividade 6 --
SELECT *
FROM DUCKS
ORDER BY AGE LIMIT 3;

-- Atividade 7 --
SELECT name, age * 12 AS age_in_months 
FROM ducks;

-- Atividade 8 --
SELECT DISTINCT species 
FROM ducks;

-- Atividade 9 --
SELECT * 
FROM duck_surveys; 
-- USING SAMPLE 10;

-- Atividade 10 --
SELECT COUNT(*),
AVG(AGE) AS AVERAGE, MIN(AGE) AS MINIMUM, MAX(AGE) AS MAXIMUM;
 -- FROM DUCKS;
