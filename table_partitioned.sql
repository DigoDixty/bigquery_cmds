CREATE TABLE if not exists
  mydataset.newtable (transaction_id INT64, transaction_date DATE)
PARTITION BY
  transaction_date
OPTIONS(
  partition_expiration_days=3,
  require_partition_filter=true
);

select * from mydataset.newtable where transaction_date = current_date();

drop table if exists mydataset.newtable;

SELECT ddl
FROM  GA.INFORMATION_SCHEMA.TABLES
WHERE  table_name="newtable";



