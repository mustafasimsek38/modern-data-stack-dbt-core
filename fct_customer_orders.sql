/*
    Marts Katmanı: Şirket yönetiminin raporlarda göreceği 
    KPI ve Metriklerin (Örn: Müşteri bazlı toplam harcama) hesaplandığı yer.
*/

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

final AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(order_amount) AS lifetime_value,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date
    FROM orders
    GROUP BY customer_id
)

SELECT * FROM final
