WITH CTE AS (
                            SELECT DISTINCT  prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, pl2.pl_name AS brandName, pl2.pl_id AS brandId, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
                            , multiplePrice.mph_verified AS ActionVerified, multiplePrice.mph_location_id AS ActionLocation
                            , ROW_NUMBER() over (partition by prd.ep_id order by multiplePrice.mph_verified) as RowNumber
                            
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
							SELECT  mph_ep_id,mph_market_id,mph_updated_by, mph_location_id, MAX(mph_updated_date) AS MaxDate
									FROM ph.ph_multiple_price_in_price_hunter
								 GROUP BY mph_ep_id,mph_market_id,mph_updated_by, mph_location_id
								 ) tm 
								 ON  prd.ep_id	 = tm.mph_ep_id 
									        AND  tm.mph_updated_by = 23137
                                            AND tm.mph_market_id = 1
                                            AND tm.mph_location_id = 48
                            LEFT JOIN ph.ph_multiple_price_in_price_hunter multiplePrice ON multiplePrice.mph_ep_id = prd.ep_id	
								                 AND (multiplePrice.mph_created_by = 23137 OR multiplePrice.mph_updated_by = 23137)
                                                 AND multiplePrice.mph_updated_date = tm.MaxDate
                            INNER JOIN Market market ON  (market.market_id = price.markpr_market_id OR market.market_id = multiplePrice.mph_market_id)
                            LEFT JOIN ph.ph_brand_assigned_user assignedBrand ON assignedBrand.bas_brand_id = pl2.pl_id								
							              LEFT JOIN ph.ph_item_type_assigned_user assignedItemType ON assignedItemType.itas_type_id = cat3.type_id
							              LEFT JOIN ph.ph_market_assigned_user assignedMarket ON assignedMarket.mas_market_id = market.market_id 
										  LEFT JOIN ph.AssignedItemTypeBrands itemTypeBrands ON assignedItemType.itas_type_id = itemTypeBrands.ItemTypeAssignedUserItemTypeId
											AND assignedItemType.MarketId = itemTypeBrands.ItemTypeAssignedUserMarketId
											AND assignedItemType.itas_assigned_user_id = itemTypeBrands.ItemTypeAssignedUserAssignedUserId
                            
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL) AND assignedMarket.mas_market_id= 1 AND( assignedBrand.bas_assigned_user_id = 23137
			                                        OR assignedItemType.itas_assigned_user_id = 23137
			                                        OR assignedMarket.mas_assigned_w_user_id = 23137)
													
													--filters get assigned products
													AND (													
													--Assigned ItemType brands
													pl2.pl_id IN (SELECT  itemTypeBrand.BrandId
														FROM ph.AssignedItemTypeBrands itemTypeBrand
														WHERE itemTypeBrand.ItemTypeAssignedUserAssignedUserId = 23137
															AND itemTypeBrand.ItemTypeAssignedUserMarketId = 1)
															
															--assigned general brands
															OR (pl2.pl_id IN (SELECT  assignedBrands.bas_brand_id
														FROM  ph.ph_brand_assigned_user assignedBrands
														WHERE assignedBrands.bas_assigned_user_id = 23137
															AND assignedBrands.MarketId = 1) )
														
														OR( cat3.type_id IN (SELECT  assignedItemType.itas_type_id
														FROM  ph.ph_item_type_assigned_user assignedItemType
														WHERE assignedItemType.itas_assigned_user_id = 23137
															AND assignedItemType.MarketId = 1 
																	and  assignedItemType.itas_type_id not in (select assignedItemTypeBrand.ItemTypeAssignedUserItemTypeId 
																	from ph.AssignedItemTypeBrands  assignedItemTypeBrand
																	where assignedItemTypeBrand.ItemTypeAssignedUserAssignedUserId = 23137 
																		and assignedItemTypeBrand.ItemTypeAssignedUserMarketId = 1 )
																	))

															OR( cat2.type_id IN (SELECT  assignedItemType.itas_type_id
														FROM  ph.ph_item_type_assigned_user assignedItemType
														WHERE assignedItemType.itas_assigned_user_id = 23137
															AND assignedItemType.MarketId = 1))
														
															)

 ORDER BY ActionVerified desc
OFFSET 0 ROWS
                                    FETCH NEXT 5000 ROWS ONLY)
SELECT *FROM CTE WHERE RowNumber = 1;