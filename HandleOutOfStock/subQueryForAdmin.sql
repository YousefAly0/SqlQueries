
SELECT DISTINCT Count(*) OVER() AS TotalCount, prd.ep_id AS EpId, prd.ep_arabicName AS EpArabicName, prd.ep_englishName AS EpEnglishName, price.markpr_current_price AS Price, img.ep_img_path AS EpImageUrl, 
                            market.market_id AS MarketId, market.market_name AS MarketName, market.market_name_en AS MarketNameEn, market.market_small_image_url AS MarketSmallImageUrl, market.market_small_image_En_url AS MarketSmallImageEnUrl
                            , multiplePrice.mph_verified AS ActionVerified  ,rankTable.rank 
                            FROM excelproducts prd
                            INNER JOIN  (VALUES (7625559,0),(7623015,1),(7623016,2),(7623017,3),(7623126,4),(7623201,5),(7623208,6),(7623449,7),(7623450,8),(7623507,9),(7623249,10),(7623211,11),(12046612,12),(12047462,13),(7623603,14),(7623604,15),(7623608,16),(7623611,17),(7623615,18),(7623616,19),(7623617,20),(7623953,21),(7623960,22),(7623961,23),(7623965,24),(7623972,25),(7623988,26),(7624003,27),(7625513,28),(7625563,29),(7625576,30),(7623008,31),(7623012,32),(7623023,33),(7623028,34),(7623031,35),(7623032,36),(7623035,37),(7623042,38),(7623044,39),(7623045,40),(7623047,41),(7623050,42),(7623052,43),(7623053,44),(7623056,45),(7623059,46),(7623062,47),(7623064,48),(7623065,49),(7623066,50),(7623081,51),(7623086,52),(7623093,53),(7623094,54),(7623101,55),(7623105,56),(7623106,57),(7623124,58),(7623128,59),(7623131,60),(7623139,61),(7623140,62),(7623179,63),(7623183,64),(7623246,65),(7623297,66),(7623298,67),(7623299,68),(7623300,69),(7623301,70),(7623322,71),(7623323,72),(7623331,73),(7623332,74),(7623333,75),(7623334,76),(7623336,77),(7623400,78),(7623413,79),(7623434,80),(7623444,81),(7623445,82),(7623454,83),(7623465,84),(7623466,85),(7623470,86),(7623471,87),(7623473,88),(7623478,89),(7623501,90),(7623504,91),(7623625,92),(7623036,93),(7623609,94),(7623435,95),(7623952,96),(7623621,97),(7623605,98),(7623606,99),(7623612,100),(7623613,101),(7623618,102),(7623619,103),(7623624,104),(7623955,105),(7623956,106),(7623959,107),(7623970,108),(7623986,109),(7623996,110),(7625565,111),(7625568,112),(7623006,113),(7623007,114),(7623010,115),(7623054,116),(7623058,117),(7623060,118),(7623079,119),(7623095,120),(7623099,121),(7623108,122),(7623130,123),(7623175,124),(7623177,125),(7623185,126),(7623190,127),(7623191,128),(7623193,129),(7623195,130),(7623199,131),(7623206,132),(7623239,133),(7623244,134),(7623253,135),(7623255,136),(7623258,137),(7623261,138),(7623262,139),(7623265,140),(7623267,141),(7623269,142),(7623284,143),(7623289,144),(7623290,145),(7623310,146),(7623311,147),(7623313,148),(7623315,149),(7623317,150),(7623319,151),(7623320,152),(7623321,153),(7623402,154),(7623408,155),(7623415,156),(7623416,157),(7623417,158),(7623418,159),(7623421,160),(7623428,161),(7623429,162),(7623433,163),(7623441,164),(7623447,165),(7623448,166),(7623451,167),(7623452,168),(7623456,169),(7623460,170),(7623461,171),(7623464,172),(7623468,173),(7623482,174),(7623499,175),(7623982,176),(7623390,177),(12046616,178),(7623055,179),(7623057,180),(12046613,181),(12046626,182),(7623607,183),(7623620,184),(7623957,185),(7623958,186),(7625495,187),(7625497,188),(7625504,189),(7625566,190),(7630024,191),(7623063,192),(7623196,193),(7623222,194),(7623227,195),(7623229,196),(7623236,197),(7623241,198),(7623263,199),(7623271,200),(7623278,201),(7623283,202),(7623291,203),(7623292,204),(7623293,205),(7623294,206),(7623295,207),(7623316,208),(7623318,209),(7623328,210),(7623345,211),(7623348,212),(7623353,213),(7623355,214),(7623357,215),(7623360,216),(7623361,217),(7623362,218),(7623379,219),(7623380,220),(7623382,221),(7623384,222),(7623385,223),(7623386,224),(7623387,225),(7623430,226),(7623431,227),(7623508,228),(7623512,229),(7623513,230),(7623516,231),(7623517,232),(7623383,233),(7623359,234),(7623511,235),(7623968,236),(7623215,237),(12047463,238),(12046620,239),(12046624,240),(12046727,241),(7623595,242),(7624317,243),(7625532,244),(7623018,245),(7623020,246),(7623021,247),(7623174,248),(7623182,249),(7623220,250),(7623224,251),(7623226,252),(7623228,253),(7623285,254),(7623288,255),(7623510,256),(7625551,257),(7643919,258),(7643922,259),(7643923,260),(7643925,261),(7643926,262),(7643927,263),(12046618,264),(12046627,265),(7624318,266),(7623143,267),(7623145,268),(7623592,269),(7623593,270),(7623594,271),(7624319,272),(7623597,273),(7623602,274),(7624321,275),(7623596,276),(7624322,277),(7623600,278),(7623601,279)) AS rankTable(id, rank) ON prd.ep_id = rankTable.id
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
								                 AND ( multiplePrice.mph_updated_by = 23026) 
												 AND multiplePrice.mph_updated_date = tm.MaxDate
									 and tm.mph_updated_by= multiplePrice.mph_updated_by and tm.mph_market_id= multiplePrice.mph_market_id 
				

                            INNER JOIN Market market ON  (market.market_id = price.markpr_market_id OR market.market_id = multiplePrice.mph_market_id)
                            LEFT JOIN ph.ph_brand_assigned_user assignedBrand ON assignedBrand.bas_brand_id = pl2.pl_id								
							LEFT JOIN ph.ph_item_type_assigned_user assignedItemType ON assignedItemType.itas_type_id = cat3.type_id
						 LEFT JOIN ph.ph_market_assigned_user assignedMarket ON assignedMarket.mas_market_id = market.market_id 
WHERE 1=1 AND (prd.ep_disable_pr_inapp = 0 OR prd.ep_disable_pr_inapp IS NULL) AND market.market_id = 1 AND( assignedBrand.bas_assigned_user_id = 23026
			                                        OR assignedItemType.itas_assigned_user_id = 23026
			                                        OR assignedMarket.mas_assigned_w_user_id = 23026)

 ORDER BY rankTable.rank
OFFSET 0 ROWS
                                    FETCH NEXT 100 ROWS ONLY;



									