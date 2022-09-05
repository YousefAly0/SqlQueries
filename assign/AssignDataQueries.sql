
--Get brands
SELECT * 
FROM productLines
WHERE pl_parent IS NOT NULL AND pl_prim_type IS NULL

--Get Categories
SELECT *
FROM Item_Type

--Get Markets with locations
SELECT *
FROM MarketLocation location
INNER JOIN Market market on location.market_id = market.market_id
ORDER BY location.market_id

