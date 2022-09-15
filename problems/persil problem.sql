select * from MarketLocation order by market_id

select * from market_products_prices price 
inner join  excelproducts prd on prd.ep_id = price.markpr_pr_id
inner join productLines pl3 on pl3.pl_id = prd.ep_productLine
inner join productLines pl2 on pl2.pl_id = pl3.pl_parent


where markpr_market_id= 13

select * from Item_Type where type LIKE N'%تنظيف%'