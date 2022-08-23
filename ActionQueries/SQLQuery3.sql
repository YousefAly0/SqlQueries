SELECT DISTINCT  prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
                            , multiplePrice.mph_verified AS ActionVerified 
                            FROM excelproducts prd
                            
                            INNER JOIN productLines pl3 ON pl3.pl_id  = prd.ep_productLine 
                            INNER JOIN productLines pl2 ON pl2.pl_id = pl3.pl_parent
                            INNER JOIN Item_Type cat3 ON cat3.type_id = pl3.pl_prim_type
                            INNER JOIN Item_type cat2 ON cat2.type_id = cat3.Type_Parent
                            INNER JOIN Item_type cat1 ON cat1.type_id = cat2.Type_Parent
                            LEFT JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id    
							                AND price.markpr_market_id = 1                            
                            INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id and img.ep_img_primary = 1
                                and img.ep_img_size = 63                                                           
                            LEFT JOIN Item_Type secCat3 ON secCat3.type_id = pl3.pl_sec_type 
                            LEFT JOIN Item_Type secCat2 ON secCat2.type_id = secCat3.Type_Parent 
                            LEFT JOIN Item_Type secCat1 ON secCat1.type_id = secCat2.Type_Parent
                            LEFT JOIN ( 
							SELECT  mph_ep_id,mph_market_id,mph_updated_by , MAX(mph_updated_date) AS MaxDate
									FROM ph.ph_multiple_price_in_price_hunter
								 GROUP BY mph_ep_id,mph_market_id,mph_updated_by
								 ) tm 
								 ON  prd.ep_id	 = tm.mph_ep_id 
									        AND  tm.mph_updated_by = 23026
                            LEFT JOIN ph.ph_multiple_price_in_price_hunter multiplePrice ON multiplePrice.mph_ep_id = prd.ep_id	
								                 AND (multiplePrice.mph_created_by = 23026 OR multiplePrice.mph_updated_by = 23026)
                                                 AND multiplePrice.mph_updated_date = tm.MaxDate
                            INNER JOIN Market market ON  (market.market_id = price.markpr_market_id OR market.market_id = multiplePrice.mph_market_id)
                            LEFT JOIN ph.ph_brand_assigned_user assignedBrand ON assignedBrand.bas_brand_id = pl2.pl_id								
							              LEFT JOIN ph.ph_item_type_assigned_user assignedItemType ON assignedItemType.itas_type_id = cat3.type_id
							              LEFT JOIN ph.ph_market_assigned_user assignedMarket ON assignedMarket.mas_market_id = market.market_id 
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL) AND market.market_id = 1 AND( assignedBrand.bas_assigned_user_id = 23026
			                                        OR assignedItemType.itas_assigned_user_id = 23026
			                                        OR assignedMarket.mas_assigned_w_user_id = 23026)

 ORDER BY prd.ep_id
OFFSET 0 ROWS
                                    FETCH NEXT 5000 ROWS ONLY;