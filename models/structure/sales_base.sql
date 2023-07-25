{{ 
    config(
        materialized="table",
        incremental_strategy = "merge",
        schema="structure"
    ) 
}}

SELECT
    orderid,
    custkey,
    product,
    ARBITRARY(CAST(quantity AS integer)) AS quantity,
    ARBITRARY(CAST(price AS double)) AS price,
    orderdate,
    current_date AS create_dt,
    current_date AS last_update_dt
FROM {{ ref('sales_land') }}
GROUP BY 1, 2, 3, 6