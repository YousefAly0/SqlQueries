/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ep_id]
      ,[ep_Barcode]
      ,[ep_englishName]
      ,[ep_price]
      ,[ep_arabicName]
      ,[ep_supp_id]
      ,[ep_Item_Type]
      ,[ep_product]
      ,[ep_size]
      ,[ep_status]
      ,[ep_Item_id]
      ,[ep_market]
      ,[ep_category]
      ,[ep_brand_en]
      ,[ep_has_similerproducts]
      ,[ep_productLine]
      ,[ep_description]
      ,[ep_numberOfUnites]
      ,[ep_isOffer]
      ,[ep_isBundle]
      ,[ep_parentID]
      ,[ep_offer_quantity]
      ,[ep_disable_pr_inapp]
	  , market.market_id
	  , price.markpr_current_price
  FROM [Do2romStage23112021].[dbo].[excelproducts] prd
  inner join market_products_prices price on price.markpr_pr_id = prd.ep_id
  inner join Market market on market.market_id = price.markpr_market_id
   /*
   ep_id	market_id 	  markpr_current_price
	7623021		10	        22.25
	7623021		11	        20.95
	7623021		33	        23.45
	7623021		13	        19.99
   */