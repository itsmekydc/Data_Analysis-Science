SELECT *
FROM company_dim

COPY company_dim
FROM 'C:\Users\lucky\OneDrive\Documents\Learning Code\SQL\SQL_DATAANALYSIS_FOR_JOB\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\lucky\OneDrive\Documents\Learning Code\SQL\SQL_DATAANALYSIS_FOR_JOB\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\lucky\OneDrive\Documents\Learning Code\SQL\SQL_DATAANALYSIS_FOR_JOB\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\lucky\OneDrive\Documents\Learning Code\SQL\SQL_DATAANALYSIS_FOR_JOB\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM job_postings_fact
LIMIT 10;

SELECT '2023-02-19'::DATE,
'123'::INTEGER,
'true'::BOOLEAN,
'3.141':: REAL;

SELECT 
    job_title_short as job_title,
    job_location as location,
    job_posted_date as date
FROM 
    job_postings_fact;

-- kode diatas date nya ada timestamp

SELECT 
    job_title_short as job_title,
    job_location as location,
    job_posted_date::DATE as date
FROM 
    job_postings_fact;

-- Kode diatas menghilangkan timestamp pada hasilnya