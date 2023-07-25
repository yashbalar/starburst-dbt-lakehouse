{{ 
    config(
        materialized="view",
        schema="land"
    ) 
}}

select *
from s3glue.yash_dbt_lakehouse_external.customer_land
