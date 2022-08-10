 USE Do2romStage23112021;
 SELECT Count(*) OVER() AS TotalCount, prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
							, cat3.type_id
                            FROM excelproducts prd                           
                            INNER JOIN productLines pl3 ON pl3.pl_id  = prd.ep_productLine 
                            INNER JOIN productLines pl2 ON pl2.pl_id = pl3.pl_parent
                            INNER JOIN Item_Type cat3 ON cat3.type_id = pl3.pl_prim_type
                            INNER JOIN Item_type cat2 ON cat2.type_id = cat3.Type_Parent
                            INNER JOIN Item_type cat1 ON cat1.type_id = cat2.Type_Parent
                            INNER JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
                            INNER JOIN Market market ON market.market_id = price.markpr_market_id
                             INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id and img.ep_img_primary = 1
                                and img.ep_img_size = 63
                            
                            LEFT JOIN Item_Type secCat3 ON secCat3.type_id = pl3.pl_sec_type 
                            LEFT JOIN Item_Type secCat2 ON secCat2.type_id = secCat3.Type_Parent 
                            LEFT JOIN Item_Type secCat1 ON secCat1.type_id = secCat2.Type_Parent 
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL)  AND market.market_id = 50 

 ORDER BY prd.ep_id
OFFSET 0 ROWS
                                    FETCH NEXT 50 ROWS ONLY;