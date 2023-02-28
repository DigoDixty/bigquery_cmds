SELECT 
job_id,
parent_job_id,
creation_time,
DATE(creation_time) AS creation_date,
project_id,
user_email,
job_type,
statement_type,
query,
total_bytes_billed/POWER(2,30) AS total_bytes_billed_GB,
cast(5.0*(total_bytes_billed/POWER(2,40)) AS numeric) AS query_cost_usd,
total_slot_ms
FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE DATE(creation_time) = '2023-02-26'
AND user_email = 'name@gmail.com'
ORDER BY query_cost_usd DESC
