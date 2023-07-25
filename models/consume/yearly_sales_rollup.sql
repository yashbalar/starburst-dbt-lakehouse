{{ 
    config(
        materialized="view",
        schema="consume"
    ) 
}}

SELECT SUM(quantity+price) total, DATE_FORMAT(CAST(orderdate AS timestamp), '%Y') year 
FROM {{ ref('sales_base') }}
GROUP BY DATE_FORMAT(CAST(orderdate AS timestamp), '%Y')