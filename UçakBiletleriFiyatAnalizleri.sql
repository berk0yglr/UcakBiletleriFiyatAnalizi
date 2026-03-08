use Airline_Ticket_Price

select Top 10 * 
from dbo.airline_ticket_prices_dataset 



select distinct
airline
from dbo.airline_ticket_prices_dataset 


select 
 MAX(price_USD) as yüksek_fiyat
,MIN(price_USD) as düsük_fiyat
from dbo.airline_ticket_prices_dataset

select
  CAST(AVG(price_USD)AS INT) as ortalama
,Airline as Þirket
from dbo.airline_ticket_prices_dataset
group by Airline
order by ortalama desc


select *
from dbo.airline_ticket_prices_dataset
where  price_USD>(Select AVG(price_USD) as ortalama from dbo.airline_ticket_prices_dataset )

WITH Mesafe_Kategorileri AS(
	select  
		price_USD,
		case 
			when  Distance_km <=4000 then 'Kýsa Mesafe'
			when Distance_km >4000 and Distance_km <=8000 then 'Orta Mesafe'
			when Distance_km >8000 then 'Uzun Mesafe'
		END AS Mesafe_Turu
	from dbo.airline_ticket_prices_dataset 
)
SELECT 
    Mesafe_Turu,
    COUNT(*) AS Toplam_Ucus_Sayisi,
    CAST(AVG(price_USD) AS INT) AS Ortalama_Fiyat
FROM Mesafe_Kategorileri
GROUP BY Mesafe_Turu
ORDER BY Ortalama_Fiyat DESC;


WITH Bilet_Siralamasi AS (
 Select 
   Airline
  ,Class
  ,Origin
  ,Destination
  ,Price_USD
  ,Rank() OVER(PARTITION BY Class ORDER BY Price_USD desc) as Sira
from dbo.airline_ticket_prices_dataset
)

Select *  
from Bilet_Siralamasi
where Sira <=3