SELECT *
FROM january_jobs;

SELECT *
FROM february_jobs;

SELECT *
FROM march_jobs;

-- UNION 
--  combines results from two or more SELECT statements
--  They need to have the same amount of columns, and the data type must match

SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs


-- UNION ALL
-- - combine the result of two or more SELECT statements
-- They need to have the same amount of columns, and the data type must match

SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs

-- Perbedaan utama : UNION menghapus duplikat, 
-- sedangkan UNION ALL menyertakan semua duplikat