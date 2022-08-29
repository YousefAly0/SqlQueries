SELECT DISTINCT  prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
                            , multiplePrice.mph_verified AS ActionVerified, multiplePrice.mph_location_id AS ActionLocation
                             ,rankTable.rank 
                            FROM excelproducts prd
                            INNER JOIN  (VALUES (12047462,0),(7625559,1),(7623015,2),(7623016,3),(7623017,4),(7623126,5),(7623201,6),(7623208,7),(7623449,8),(7623450,9),(7623507,10),(7623249,11),(7623211,12),(12046612,13),(7623603,14),(7623604,15),(7623608,16),(7623611,17),(7623615,18),(7623616,19),(7623617,20),(7623953,21),(7623960,22),(7623961,23),(7623965,24),(7623972,25),(7623988,26),(7624003,27),(7625513,28),(7625563,29),(7625576,30),(7623008,31),(7623012,32),(7623023,33),(7623028,34),(7623031,35),(7623032,36),(7623035,37),(7623042,38),(7623044,39),(7623045,40),(7623047,41),(7623050,42),(7623052,43),(7623053,44),(7623056,45),(7623059,46),(7623062,47),(7623064,48),(7623065,49),(7623066,50),(7623081,51),(7623086,52),(7623093,53),(7623094,54),(7623101,55),(7623105,56),(7623106,57),(7623124,58),(7623128,59),(7623131,60),(7623139,61),(7623140,62),(7623179,63),(7623183,64),(7623246,65),(7623298,66),(7623299,67),(7623300,68),(7623301,69),(7623322,70),(7623323,71),(7623331,72),(7623332,73),(7623333,74),(7623334,75),(7623336,76),(7623400,77),(7623413,78),(7623434,79),(7623444,80),(7623445,81),(7623454,82),(7623465,83),(7623466,84),(7623470,85),(7623471,86),(7623473,87),(7623478,88),(7623501,89),(7623504,90),(7623625,91),(7623036,92),(7623609,93),(7623435,94),(7623952,95),(7623621,96),(7623297,97),(12046613,98),(12046626,99),(7623605,100),(7623606,101),(7623612,102),(7623613,103),(7623618,104),(7623619,105),(7623624,106),(7623955,107),(7623956,108),(7623959,109),(7623970,110),(7623986,111),(7623996,112),(7625565,113),(7625568,114),(7623006,115),(7623007,116),(7623010,117),(7623054,118),(7623058,119),(7623060,120),(7623079,121),(7623095,122),(7623099,123),(7623108,124),(7623130,125),(7623175,126),(7623177,127),(7623185,128),(7623190,129),(7623191,130),(7623193,131),(7623195,132),(7623199,133),(7623206,134),(7623239,135),(7623244,136),(7623253,137),(7623255,138),(7623258,139),(7623261,140),(7623262,141),(7623265,142),(7623267,143),(7623269,144),(7623284,145),(7623289,146),(7623290,147),(7623310,148),(7623311,149),(7623313,150),(7623315,151),(7623317,152),(7623319,153),(7623320,154),(7623321,155),(7623402,156),(7623408,157),(7623415,158),(7623416,159),(7623417,160),(7623418,161),(7623421,162),(7623428,163),(7623429,164),(7623433,165),(7623441,166),(7623447,167),(7623448,168),(7623451,169),(7623452,170),(7623456,171),(7623460,172),(7623461,173),(7623464,174),(7623468,175),(7623482,176),(7623499,177),(7623982,178),(7623390,179),(12046616,180),(7623055,181),(7623057,182),(12046620,183),(12046727,184),(7623607,185),(7623620,186),(7623957,187),(7623958,188),(7625495,189),(7625497,190),(7625566,191),(7630024,192),(7623063,193),(7623196,194),(7623222,195),(7623227,196),(7623229,197),(7623236,198),(7623241,199),(7623263,200),(7623271,201),(7623278,202),(7623283,203),(7623291,204),(7623292,205),(7623293,206),(7623294,207),(7623295,208),(7623316,209),(7623318,210),(7623328,211),(7623345,212),(7623348,213),(7623353,214),(7623355,215),(7623357,216),(7623360,217),(7623361,218),(7623362,219),(7623379,220),(7623380,221),(7623382,222),(7623384,223),(7623385,224),(7623386,225),(7623387,226),(7623430,227),(7623431,228),(7623508,229),(7623512,230),(7623513,231),(7623516,232),(7623517,233),(7623383,234),(7623359,235),(7623511,236),(7623968,237),(7623215,238),(12047463,239),(12046624,240),(7625504,241),(7643919,242),(7643922,243),(7643923,244),(7643925,245),(7643926,246),(7643927,247),(12046618,248),(12046627,249),(7623595,250),(7624317,251),(7625532,252),(7623018,253),(7623020,254),(7623021,255),(7623174,256),(7623182,257),(7623220,258),(7623224,259),(7623226,260),(7623228,261),(7623285,262),(7623288,263),(7623510,264),(7625551,265),(7624318,266),(7623143,267),(7623145,268),(7623592,269),(7623593,270),(7623594,271),(7624319,272),(7623597,273),(7623602,274),(7624321,275),(7623596,276),(7624322,277),(7623600,278),(7623601,279)) AS rankTable(id, rank) ON prd.ep_id = rankTable.id
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
							SELECT  mph_ep_id,mph_market_id,mph_updated_by , MAX(mph_updated_date) AS MaxDate, mph_location_id
									FROM ph.ph_multiple_price_in_price_hunter
								 GROUP BY mph_ep_id,mph_market_id,mph_updated_by, mph_location_id
								 ) tm 
								 ON  prd.ep_id	 = tm.mph_ep_id 
									        AND  tm.mph_updated_by = 23106
											--AND tm.mph_location_id = 51
                            LEFT JOIN ph.ph_multiple_price_in_price_hunter multiplePrice ON multiplePrice.mph_ep_id = prd.ep_id	
								                 AND (multiplePrice.mph_created_by = 23106 OR multiplePrice.mph_updated_by = 23106)
                                                 AND multiplePrice.mph_updated_date = tm.MaxDate 
												 --AND multiplePrice.mph_location_id = 51
                            INNER JOIN Market market ON  (market.market_id = price.markpr_market_id OR market.market_id = multiplePrice.mph_market_id)
                            LEFT JOIN ph.ph_brand_assigned_user assignedBrand ON assignedBrand.bas_brand_id = pl2.pl_id								
							              LEFT JOIN ph.ph_item_type_assigned_user assignedItemType ON assignedItemType.itas_type_id = cat3.type_id
							              LEFT JOIN ph.ph_market_assigned_user assignedMarket ON assignedMarket.mas_market_id = market.market_id 
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL) AND market.market_id = 1 AND( assignedBrand.bas_assigned_user_id = 23106
			                                        OR assignedItemType.itas_assigned_user_id = 23106
			                                        OR assignedMarket.mas_assigned_w_user_id = 23106)

 ORDER BY rankTable.rank
OFFSET 0 ROWS
                                    FETCH NEXT 1000 ROWS ONLY;