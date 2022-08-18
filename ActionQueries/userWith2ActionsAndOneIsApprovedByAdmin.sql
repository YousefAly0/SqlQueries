/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [mph_id]
      ,[mph_market_id]
      ,[mph_ep_id]
      ,[mph_location_id]
      ,[mph_created_by]
      ,[mph_updated_by]
      ,[mph_created_date]
      ,[mph_updated_date]
      ,[mph_price]
      ,[mph_Status]
      ,[mph_ph_id]
      ,[mph_verified]
      ,[ActionType]
      ,[mph_ActionType]
      ,[mph_IsDisc]
  FROM [Do2romStage23112021].[ph].[ph_multiple_price_in_price_hunter]

  WHERE mph_updated_by = 23026 
  --AND mph_ep_id = 
  --7623179
  --7623108