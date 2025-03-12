SELECT
    job_schedule_type,
    AVG(salary_hour_avg) AS rata_gaji_perjam,
    AVG(salary_year_avg) AS rata_gaji_tahunan
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type
ORDER BY job_schedule_type;


SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS gaji_tahunan,
    AVG(salary_hour_avg) AS gaji_perjam
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01' AND job_schedule_type IS NOT NULL
GROUP BY job_schedule_type

SELECT 
EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month, COUNT(*) AS job_count
FROM job_postings_fact
WHERE EXTRACT (YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY month
ORDER by month;



SELECT
    companies.name
FROM company_dim AS companies
LEFT JOIN job_postings_fact AS jobs ON companies.company_id = jobs.company_id
WHERE jobs.job_health_insurance IS TRUE
    AND EXTRACT(QUARTER FROM jobs.job_posted_date AT TIME ZONE 'America/New_York') = 2
    AND EXTRACT(YEAR FROM jobs.job_posted_date AT TIME ZONE 'America/New_York') = 2023;


-- lATIHAN CASE EXPRESSION 

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

-- lATIHAN UNION OPERATION
SELECT 
    quater1_job_postings.job_title_short,
    quater1_job_postings.job_location,
    quater1_job_postings.job_via,
    quater1_job_postings.job_posted_date::DATE
FROM
    (
        SELECT *
        FROM january_jobs
        UNION ALL
        SELECT *
        FROM february_jobs
        UNION ALL
        SELECT *
        FROM march_jobs
    ) as quater1_job_postings
WHERE quater1_job_postings.salary_year_avg > 70000


-- LATIHAN SUBQUERIS AND CTES
WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT (*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job -- DIKASIH ISTILAH BIAR BISA JOIN TABLE
    INNER JOIN job_postings_fact AS job_postings ON
        job_postings.job_id = skills_to_job.job_id
    WHERE job_postings.job_work_from_home = true
    GROUP BY skill_id
    )

SELECT  skills.skill_id,
        skills AS skill_name,
        skill_count
FROM remote_job_skills
INNER JOIN skills_dim as skills ON skills.skill_id = remote_job_skills.skill_id

WITH company_job_postings AS (
    SELECT
    company_id,
    COUNT (*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT  company_dim.name AS company_name,
        CASE
        WHEN total_jobs < 10 THEN 'Low'
        WHEN total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'High'
        END company_level
FROM company_dim
LEFT JOIN company_job_postings 
ON company_job_postings.company_id = company_dim.company_id
ORDER BY total_jobs DESC