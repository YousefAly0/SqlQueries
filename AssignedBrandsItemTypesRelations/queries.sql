/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [bas_assigned_user_id]
      ,[bas_admin_user_id]
      ,[bas_brand_id]
  FROM [Do2romStage23112021].[ph].[ph_brand_assigned_user]
  WHERE bas_assigned_user_id = 23026

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [mas_assigned_w_user_id]
      ,[mas_admin_w_user_id]
      ,[mas_market_id]
  FROM [Do2romStage23112021].[ph].[ph_market_assigned_user]
  WHERE mas_assigned_w_user_id= 23026


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [itas_assigned_user_id]
      ,[itas_admin_user_id]
      ,[itas_type_id]
  FROM [Do2romStage23112021].[ph].[ph_item_type_assigned_user]
  WHERE itas_assigned_user_id = 23026


  SELECT pl_id, pl_name
  FROM productLines
  WHERE pl_id = 1400149 OR pl_id = 1400154 OR pl_id = 1400156

  SELECT type_id, type 
  FROM Item_Type
  WHERE type_id = 10200142


  
  
  --Morsi solution

  /** Script for SelectTopNRows command from SSMS  **/ SELECT TOP (1000) [mas_assigned_w_user_id]  
  ,[mas_admin_w_user_id], [mas_market_id]   
  FROM [Do2romStage23112021].[ph].[ph_market_assigned_user] 
  select * from ph.ph_brand_assigned_user b 
  inner join ph.ph_market_assigned_user m  on mas_assigned_w_user_id = mas_admin_w_user_id  where bas_assigned_user_id = 22995
