SELECT DISTINCT Count(*) OVER() AS TotalCount, prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
                            , null AS ActionVerified  ,rankTable.rank 
                            FROM excelproducts prd
                            INNER JOIN  (VALUES (7637716,0),(7637708,1),(7637710,2),(7637804,3),(7637877,4),(7639554,5),(7639561,6),(7639563,7),(7623105,8),(7623106,9),(7635818,10),(7635819,11),(7637723,12),(7637823,13),(7637834,14),(7637840,15),(7637856,16),(7637894,17),(7637900,18),(7623108,19),(7635826,20),(7635856,21),(7637604,22),(7637718,23),(7637826,24),(7637829,25),(7637844,26),(7637882,27),(7637904,28),(7639546,29),(7641536,30),(7635822,31),(7635841,32),(7637576,33),(7637806,34),(7637851,35),(7639555,36),(7641533,37),(7641534,38),(7641535,39),(7626655,40),(8647187,41),(7635829,42),(7635833,43),(7635834,44),(7635858,45),(7637755,46),(7637811,47),(7637861,48),(7644046,49),(7644047,50),(7635838,51),(7635860,52),(7637568,53),(7637748,54),(7637910,55),(7637914,56),(7643363,57),(7637906,58),(7626652,59),(7626686,60),(7643362,61),(7626653,62),(7637511,63)) AS rankTable(id, rank) ON prd.ep_id = rankTable.id
                            INNER JOIN productLines pl3 ON pl3.pl_id  = prd.ep_productLine 
                            INNER JOIN productLines pl2 ON pl2.pl_id = pl3.pl_parent
                            INNER JOIN Item_Type cat3 ON cat3.type_id = pl3.pl_prim_type
                            INNER JOIN Item_type cat2 ON cat2.type_id = cat3.Type_Parent
                            INNER JOIN Item_type cat1 ON cat1.type_id = cat2.Type_Parent
                            LEFT JOIN market_products_prices price ON price.markpr_pr_id = prd.ep_id
                            INNER JOIN Market market ON  (market.market_id = price.markpr_market_id 
                            INNER JOIN excelproducts_images img ON img.ep_img_epid = prd.ep_id and img.ep_img_primary = 1
                                and img.ep_img_size = 63
                           
                            LEFT JOIN Item_Type secCat3 ON secCat3.type_id = pl3.pl_sec_type 
                            LEFT JOIN Item_Type secCat2 ON secCat2.type_id = secCat3.Type_Parent 
                            LEFT JOIN Item_Type secCat1 ON secCat1.type_id = secCat2.Type_Parent 
                             
                              
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL) AND market.market_id = 1 

 ORDER BY rankTable.rank
OFFSET 0 ROWS
                                    FETCH NEXT 10000 ROWS ONLY;