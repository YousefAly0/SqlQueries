
--Products that have price and image and allowed to diplay

--in stock
SELECT DISTINCT prd.ep_id AS Id, prd.ep_arabicName AS Name, prd.ep_Barcode AS Gtin 
FROM excelproducts prd
INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id                                
INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
WHERE  (prd.ep_disable_pr_inapp  <> 1 OR prd.ep_disable_pr_inapp IS NULL) AND ep_Barcode IS NULL 
	

-- out of stock
SELECT DISTINCT prd.ep_id AS Id, prd.ep_arabicName AS Name, prd.ep_Barcode AS Gtin 
FROM excelproducts prd
INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id                                
--INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
WHERE  (prd.ep_disable_pr_inapp  <> 1 OR prd.ep_disable_pr_inapp IS NULL) AND ep_Barcode IS NULL 
	AND prd.ep_id NOT IN( SELECT markpr_pr_id
		FROM market_products_prices)


--Products that have price and image and not allowed to diplay

--in stock
SELECT DISTINCT prd.ep_id AS Id, prd.ep_arabicName AS Name, prd.ep_Barcode AS Gtin 
FROM excelproducts prd
INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id                                
INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
WHERE  (prd.ep_disable_pr_inapp  = 1 OR prd.ep_disable_pr_inapp IS not NULL) AND ep_Barcode IS NULL 
	

-- out of stock
SELECT DISTINCT prd.ep_id AS Id, prd.ep_arabicName AS Name, prd.ep_Barcode AS Gtin 
FROM excelproducts prd
INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id                                
--INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
WHERE  prd.ep_disable_pr_inapp  = 1  AND ep_Barcode IS NULL 
	AND prd.ep_id NOT IN( SELECT markpr_pr_id
		FROM market_products_prices)

