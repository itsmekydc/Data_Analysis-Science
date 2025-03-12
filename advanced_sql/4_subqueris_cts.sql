-- Fungsi ini membantu meringankan query 
-- or maksudnya buat temporary query table

-- Sub Queris
SELECT *
FROM ( -- subqueris dimulai dari sini
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- sub query berarkhir disini


-- CTS
WITH january_jobs AS ( -- CTE Definition Start Here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1  
) -- CTE Definition end here

SELECT *
FROM january_jobs;


SELECT
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true

-- Mencoba SubQuery dari query utama diatas 

SELECT name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM  job_postings_fact
    WHERE job_no_degree_mention = true
)

SELECT  company_id,
        name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM  job_postings_fact
    WHERE job_no_degree_mention = true
)

-- CTEs - Common table expression

SELECT
company_id,
COUNT (*)
FROM job_postings_fact
GROUP BY company_id

WITH company_job_count AS (
    SELECT
    company_id,
    COUNT (*)
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT *
FROM company_job_count

-- 2 perintah query diatas output querynya sama aja

WITH company_job_count AS (
    SELECT
    company_id,
    COUNT (*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT  company_dim.name AS company_name,
        company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count 
ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC

-- Quart yang agak kompleks karena menggabungkan kedua tabel