INSERT INTO job_applied
            (job_id,
             application_sent_date,
             custom_resume, 
             resume_file_name, 
             cover_letter_sent, 
             cover_tetter_file_name, 
             status)
VALUES      (1,
             '2024-02-01',
             true,
             'resume_01.pdf',
             true,
             'cover_letter_01',
             'submitted'),
             (2,
             '2024-02-02',
             false,
             'resume_02.pdf',
             false,
             'cover_letter_02',
             'submitted'),
             (3,
             '2024-02-03',
             true,
             'resume_03.pdf',
             true,
             'cover_letter_03',
             'rejected'),
             (4,
             '2024-02-04',
             false,
             'resume_04.pdf',
             false,
             'cover_letter_04',
             'rejected'),
             (5,
             '2024-02-05',
             true,
             'resume_05.pdf',
             true,
             'cover_letter_05',
             'ghosted');

-- Diatas belajar insert data ke kolom tiap table

SELECT *
FROM job_applied

-- diatas belajar select semua isi table

ALTER TABLE job_applied
RENAME COLUMN contact to contact_name

-- diatas belajar ganti nama kolom di table

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE INT;

-- diatas belajar ganti tipe data di kolom

ALTER TABLE job_applied
DROP COLUMN contact_name;

-- diatas belajar hapus kolom 

DROP TABLE job_applied;

-- diatas belajar cara menghapus table

ALTER TABLE job_applied
ADD contact VARCHAR (50);

-- diatas belajar cara menambhakan kolom tabel

UPDATE job_applied
SET contact = 'Valdy_tamvan'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Lucky_tamvan'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Anjay_tamvan'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Cabs_tamvan'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Ipul_tamvan'
WHERE job_id = 5;

-- belajar mengupdate data

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

SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
    LIMIT 10;

-- Kode diatas mencari waktu UTC pada databse

SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
    job_postings_fact
    LIMIT 10;

-- mencari utc dan ekstrak data bulan dan tahun di tanggal

SELECT 
        COUNT(job_id) AS job_posted_count,
        EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    month
ORDER BY
    job_posted_count DESC;

-- menghitung lowongan data analyst setiap bulan 
