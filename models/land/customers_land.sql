{{ 
    config(
        materialized="view",
        schema="land"
    ) 
}}

select *
from s3glue.yash_dbt_lakehouse_land.customer_land
