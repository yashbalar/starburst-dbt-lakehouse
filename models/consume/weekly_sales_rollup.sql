{{ 
    config(
        materialized="view"
    ) 
}}

SELECT SUM(quantity + price) AS total, DATE_FORMAT(CAST(orderdate AS timestamp), '%v') AS week 
FROM {{ ref('sales_base')}}
GROUP BY DATE_FORMAT(CAST(orderdate AS timestamp), '%v')