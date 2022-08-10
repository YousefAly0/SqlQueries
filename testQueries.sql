USE Do2romStage23112021;


select DATEDIFF(DAY,'07-04-2020','05-17-2020')
select * from ph.ph_product_Price_hunter phProduct where DATEDIFF(DAY,'07-25-2022', phProduct.php_updated_date) < 30;

select type_EnName from Item_Type where type_id = 10200165

select prd.ep_arabicName,pl2.pl_name AS Brand ,cat3.type,cat2.type,cat1.type,price.markpr_current_price,price.markpr_market_id 
from excelproducts prd
inner join productLines pl3 on pl3.pl_id=prd.ep_productLine
inner join productLines pl2 on pl2.pl_id =pl3.pl_parent
inner join Item_Type cat3 on cat3.type_id=pl3.pl_prim_type --id of itemType level 3
inner join Item_Type cat2 on cat2.type_id=cat3.Type_Parent
inner join Item_Type cat1 on cat1.type_id=cat2.Type_Parent
inner join market_products_prices price on price.markpr_pr_id=prd.ep_id
inner join Market market on price.markpr_market_id=market.market_id
inner join excelproducts_images img on img.ep_img_epid=prd.ep_id and img.ep_img_primary=1 and img.ep_img_size=63
where (prd.ep_disable_pr_inapp = 0 or prd.ep_disable_pr_inapp is null)


select  * from ph.ph_product_Price_hunter