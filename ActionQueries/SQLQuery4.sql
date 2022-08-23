SELECT  mph_ep_id,mph_market_id,mph_updated_by , MAX(mph_updated_date) AS MaxDate
									FROM ph.ph_multiple_price_in_price_hunter
								 GROUP BY mph_ep_id,mph_market_id,mph_updated_by
								 ORDER BY mph_ep_id