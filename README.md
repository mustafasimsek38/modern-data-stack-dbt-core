# Modern Data Stack (MDS): Cloud DWH & dbt Core Entegrasyonu

Bu proje, modern veri ekiplerinin (Data Analytics Engineering) en çok kullandığı veri dönüşüm aracı olan **dbt (Data Build Tool)** kullanılarak bulut veritabanları (Snowflake/BigQuery) üzerinde uçtan uca kurumsal bir veri ambarı dönüşüm boru hattı (Data Transformation Pipeline) modellemesidir.

## 🛠️ Mimari Katmanlar (Multi-Layer Architecture)
- **Staging Katmanı (`models/staging`):** Ham verilerin (Raw Data) okunup, veri tiplerinin normalize edildiği ve isimlendirme standartlarının (CamelCase -> snake_case) uygulandığı katman.
- **Marts Katmanı (`models/marts`):** İş kurallarının uygulandığı, BI araçlarının (Power BI, Looker) doğrudan beslendiği ve müşteri ömür boyu değeri (LTV) gibi metriklerin üretildiği analitik katman.

## 🧪 Otomatik Veri Kalitesi Testleri (Data Testing)
`schema.yml` dosyası aracılığıyla, dbt'nin dahili test mekanizmaları kullanılarak veri ambarına giren veriler için otomatik kalite kontrolleri kurgulanmıştır:
- **Unique & Not Null:** Anahtar kolonların benzersizliği ve doluluğu.
- **Accepted Values:** Statü kolonlarının sadece iş kurallarına uygun değerler içermesi kontrolü.

## 🧰 Teknolojiler
- **dbt Core (v1.x)**
- **Cloud DWH** (Snowflake / Google BigQuery SQL standartları)
- **JinJa Templating** (`{{ ref() }}` ve `{{ source() }}` dinamik bağımlılık yönetimi)
