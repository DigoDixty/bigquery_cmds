SELECT project_id, user_email, job_type, cast(start_time as date), state, destination_table.project_id,destination_table.dataset_id,
count(1) qtd, replace(cast(sum(total_bytes_billed/1024/1024/1024/1024) as string),'.',',') tb_billed, replace(cast(sum(total_bytes_billed/1024/1024/1024/1024)*5*5.3 as string),'.',',')  cost_estimaded
FROM `region-us`.INFORMATION_SCHEMA.JOBS
WHERE true
and start_time >= '2023-01-01'
group by 1,2,3,4,5,6,7
order by tb_billed desc
