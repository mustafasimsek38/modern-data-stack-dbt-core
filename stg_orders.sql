/*
    Staging Katmanı: Ham veriyi temizleme, isimlendirme standartlarını 
    düzenleme ve veri tiplerini güvenli hale getirme aşaması.
*/

WITH raw_orders AS (
    SELECT * FROM {{ source('raw_ecommerce', 'orders') }}
)

SELECT
    id AS order_id,
    user_id AS customer_id,
    status AS order_status,
    -- Tarih formatını standartlaştırma
    CAST(order_date AS DATE) AS order_date,
    -- Null/Eksik tutarları sıfırlama
    COALESCE(amount, 0) AS order_amount
FROM raw_orders
