{{ 
    config(
        materialized="table",
        incremental_strategy = "merge",
        schema="structure"
    ) 
}}

SELECT
    CAST(custkey AS bigint) AS custkey, 
    name, 
    state, 
    CAST(zip AS integer) AS zip, 
    DATE(cust_since) AS cust_since, 
    DATE(last_update_dt) AS last_update_dt
FROM {{ ref('customers_land') }}
