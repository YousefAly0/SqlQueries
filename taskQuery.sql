USE Do2romStage23112021;


--SELECT prd.ep_arabicName AS name , pl2.pl_name AS brand , price.markpr_current_price AS price,
--cat3.type AS catLevel3, cat2.type AS catLevel2, cat1.type AS catLevel1, market.market_name,
--img.ep_img_path AS image, secCat3.type AS secondaryCategory3, secCat2.type, secCat1.type,
--phProduct.php_id, phProduct.php_updated_date, pl2.pl_id

SELECT  prd.ep_id, prd.ep_arabicName, prd.ep_englishName, price.markpr_current_price, img.ep_img_path, 
market.market_id, market.market_name, market.market_name_en, market.market_small_image_url, market.market_small_image_En_url
FROM excelproducts prd
INNER JOIN  (VALUES (5,1), --dynamic
					(44,2),
					(443,3),
					(333,4)) AS rankTable(id, rank) ON prd.ep_id = rankTable.id
INNER JOIN productLines pl3 ON pl3.pl_id  = prd.ep_productLine 
INNER JOIN productLines pl2 ON pl2.pl_id = pl3.pl_parent
INNER JOIN Item_Type cat3 ON cat3.type_id = pl3.pl_prim_type
INNER JOIN Item_type cat2 ON cat2.type_id = cat3.Type_Parent
INNER JOIN Item_type cat1 ON cat1.type_id = cat2.Type_Parent
INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id 
INNER JOIN Market market ON market.market_id = price.markpr_market_id
INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id and img.ep_img_primary = 1 -- make enum
INNER JOIN ph.ph_product_Price_hunter phProduct ON phProduct.php_ep_id = prd.ep_id 
	--and phProduct.php_ep_id IS NOT NULL
	and DATEDIFF(DAY, phProduct.php_updated_date, '07-25-2022') < 30 --dynamic
LEFT JOIN Item_Type secCat3 ON secCat3.type_id = pl3.pl_sec_type 
LEFT JOIN Item_Type secCat2 ON secCat2.type_id = secCat3.Type_Parent 
LEFT JOIN Item_Type secCat1 ON secCat1.type_id = secCat2.Type_Parent 
WHERE 1 = 1
	AND market.market_id = 50 --dynamic
	AND pl2.pl_id IN (1400602, 1400996, 1400381)	--dynamic
	AND (cat3.type_id IN (1,2)
		 OR cat2.type_id IN (1,2)
		 OR cat1.type_id IN (1,2)
		 OR secCat3.type_id IN (1,2) --dynamic
		 OR secCat2.type_id IN (1,2) 
		 OR secCat1.type_id IN (1,2) )
	AND prd.ep_Barcode = '62255133211' --dynamic

	
ORDER BY rankTable.rank
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;











