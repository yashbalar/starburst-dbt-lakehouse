{{ 
    config(
        materialized="view",
        schema = "yash_dbt_lakehouse_consume"
    ) 
}}

SELECT SUM(quantity+price) total, DATE_FORMAT(CAST(orderdate AS timestamp), '%m') month 
FROM {{ ref('sales_base') }}
GROUP BY  DATE_FORMAT(CAST(orderdate AS timestamp), '%m')