# ✈️ Küresel Uçuş Fiyatlandırma Analizi (SQL)

## 📌 Proje Özeti
Bu proje, havayolu şirketlerinin fiyatlandırma stratejilerini, uçuş mesafesine bağlı maliyet değişimlerini ve pazar konumlandırmalarını ortaya çıkarmak amacıyla küresel uçuş bilet fiyatları veri setini incelemektedir. Analizin temel amacı, ham verilerden şirketler için anlamlı iş içgörüleri elde ederken ileri düzey SQL sorgulama yetkinliklerini (CTEs, Subqueries, Window Functions) sergilemektir.

## 🛠️ Kullanılan Teknolojiler ve Yetenekler
* **Veritabanı Yönetimi:** Microsoft SQL Server
* **Uygulanan Temel Yetenekler:** * Keşifsel Veri Analizi (EDA)
  * Veri Gruplama ve Birleştirme (`GROUP BY`, `HAVING`)
  * Ortak Tablo İfadeleri (CTEs)
  * Alt Sorgular (Subqueries)
  * Koşullu Mantık ile Segmentasyon (`CASE WHEN`)
  * Analitik Pencere Fonksiyonları (`RANK()`, `PARTITION BY`)

## 📂 Proje Yapısı
* `data/`: Kullanılan ham veri setini içerir (.csv formatında).
* `sql_scripts/`: Veri analizi ve içgörü çıkarımı için yazılan SQL sorgularını barındırır.
* `README.md`: Projenin genel işleyişi ve elde edilen sonuçların belgelendiği doküman.

## 📊 İş Soruları ve Analizler

### 1. En yüksek ortalama bilet fiyatına sahip havayolu hangisidir?
Farklı havayolu şirketlerinin genel fiyatlandırma stratejileri incelenmiş; `GROUP BY` ve aggregate (kümeleme) fonksiyonları kullanılarak sektördeki en "premium" (pahalı) havayolu şirketleri tespit edilmiştir.

### 2. Küresel ortalamanın üzerindeki premium uçuşlar hangileridir?
**Alt Sorgular (Subqueries)** kullanılarak, satılan tüm biletlerin genel ortalama fiyatı hesaplanmış ve sadece bu ortalamanın çok daha üzerinde satılan özel rotalar ve uçuşlar filtrelenmiştir.

### 3. Uçuş mesafesi fiyatları nasıl etkilemektedir?
Özel bir **CTE** bloğu içerisinde `CASE WHEN` mantığı kurgulanarak uçuşlar üç ana kategoriye ayrılmıştır: 'Kısa Mesafe' (<= 4000 km), 'Orta Mesafe' (4001 - 8000 km) ve 'Uzun Mesafe' (> 8000 km). Ardından bu segmentlerin kendi içindeki ortalama fiyatları karşılaştırılmıştır.

### 4. Her bir uçuş sınıfındaki en pahalı ilk 3 bilet hangileridir?
**Pencere Fonksiyonları (Window Functions)** (`RANK() OVER PARTITION BY`) kullanılarak, genel veri seti yerine doğrudan sınıfların (Economy, Business, First) kendi içindeki fiyat rekabeti incelenmiş ve her sınıfın mutlak en yüksek fiyatlı biletleri sıralanmıştır.

## 💡 Temel İçgörüler (Key Insights)
* **Pazarın Premium Liderleri:** Şirketlerin ortalama bilet satış fiyatları incelendiğinde, **Saudia** küresel pazarın en pahalı havayolu olarak öne çıkmaktadır. Onu 202.697 $ortalama ile Emirates ve 201.158$ ortalama ile Turkish Airlines takip etmektedir. En uygun fiyatlı ortalamayı ise 125.948 $ ile Etihad sunmaktadır.
* **Mesafe ve Fiyat Çarpanı İlişkisi:** Veriler, mesafe arttıkça fiyatların neredeyse katlanarak arttığını kanıtlıyor. Kısa mesafe uçuşların ortalama maliyeti **76.175 $** iken, orta mesafede bu rakam **183.269 $**'a çıkmaktadır. 8.000 km üzerindeki 'Uzun Mesafe' uçuşların ortalaması ise **303.367 $** ile kısa mesafenin yaklaşık 4 katına ulaşmaktadır.
* **Devasa Fiyat Uçurumu:** Veri setindeki en ucuz bilet **1.857 $** iken, mutlak en pahalı bilet (Qatar Airways - First Class, London -> Mumbai) **885.269 $** gibi çarpıcı bir rakama ulaşarak havacılık sektöründeki devasa müşteri segmenti farkını gözler önüne sermiştir.
* **Sınıf İçi Zirveler:** Pencere fonksiyonu (Window Function) analizine göre; Economy sınıfının en pahalı biletini Etihad (247.236 $), Business sınıfının en pahalı biletini Saudia (513.378 $) satmıştır.

***

**Berkay**
*Veri Analisti Adayı | Yönetim Bilişim Sistemleri Öğrencisi*
