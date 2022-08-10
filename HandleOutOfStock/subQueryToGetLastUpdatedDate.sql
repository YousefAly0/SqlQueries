SELECT * FROM market_products_prices
WHERE markpr_pr_id = 7623106

SELECT multiplePrice.* FROM ph.ph_multiple_price_in_price_hunter multiplePrice
	INNER JOIN (
		  SELECT  mph_ep_id,mph_market_id,mph_updated_by , MAX(mph_updated_date) AS MaxDate
			 FROM ph.ph_multiple_price_in_price_hunter
			 GROUP BY mph_ep_id,mph_market_id,mph_updated_by 	) 
			 tm ON multiplePrice.mph_ep_id = tm.mph_ep_id AND multiplePrice.mph_updated_date = tm.MaxDate and tm.mph_market_id= multiplePrice.mph_market_id
			 and tm.mph_updated_by= multiplePrice.mph_updated_by
		
			 WHERE (multiplePrice.mph_ep_id = 7623018 OR multiplePrice.mph_ep_id = 7623106)  AND ( multiplePrice.mph_updated_by = 23026)


SELECT * FROM ph.ph_multiple_price_in_price_hunter
WHERE mph_ep_id = 7623106


SELECT * FROM ph.ph_multiple_price_in_price_hunter
WHERE mph_ep_id = 7623018

SELECT * FROM market_products_prices
WHERE markpr_pr_id = 7623018



select * from ph.ph_multiple_price_in_price_hunter
where  mph_ep_id =7623106 and mph_updated_by =23026

select 