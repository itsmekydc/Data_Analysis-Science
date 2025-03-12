CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

CREATE TABLE april_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

CREATE TABLE may_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

CREATE TABLE june_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

CREATE TABLE july_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

CREATE TABLE august_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

CREATE TABLE september_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

CREATE TABLE october_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

CREATE TABLE november_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

CREATE TABLE december_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

SELECT job_posted_date
FROM march_jobs;

-- Belajar Case Expression

SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
    END location_category
FROM job_postings_fact;

-- Fungsi case sama buat filtering tanpa where tapi harus open case sama end, end itu buat nama kolommnya


SELECT 
    COUNT (job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
    END location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

SELECT
    job_title_short,
    job_location,
    CASE
    WHEN salary_year_avg > 135000 THEN 'High'
    WHEN salary_year_avg > 55000 THEN 'Standard'
    ELSE 'LOW'
    END different_buckets
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY different_buckets;

SELECT
    COUNT (job_id) AS number_of_jobs,
    CASE
    WHEN salary_year_avg > 135000 THEN 'High'
    WHEN salary_year_avg > 55000 THEN 'Standard'
    ELSE 'LOW'
    END different_buckets
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY different_buckets
ORDER BY different_buckets;