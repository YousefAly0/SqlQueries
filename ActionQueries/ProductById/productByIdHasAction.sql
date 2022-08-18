SELECT TOP(1) [e].[ep_id] AS [Id], [e].[ep_arabicName] AS [Name], [m].[markpr_current_price] AS [Price], CASE
          WHEN ([t].[mph_verified] = CAST(0 AS tinyint)) AND [t].[mph_verified] IS NOT NULL THEN CAST(1 AS bit)
          ELSE CAST(0 AS bit)
      END AS [HasAction], [m0].[market_id] AS [Id], [m0].[market_name] AS [Name], [m0].[market_small_image_url] AS [PhotoUrl]
      FROM [excelproducts] AS [e]
      INNER JOIN [market_products_prices] AS [m] ON [e].[ep_id] = [m].[markpr_pr_id]
      INNER JOIN [Market] AS [m0] ON [m].[markpr_market_id] = [m0].[market_id]
      LEFT JOIN (
          SELECT [p].[mph_ep_id], [p].[mph_updated_date], [p].[mph_verified]
          FROM [ph].[ph_multiple_price_in_price_hunter] AS [p]
          WHERE [p].[mph_updated_by] = 23026
      ) AS [t] ON [e].[ep_id] = [t].[mph_ep_id]
      WHERE [e].[ep_id] = 7623415
      ORDER BY [t].[mph_updated_date]


	  -----------------------------------------------------

	  --[Parameters=[@__userId_0='?' (DbType = Int64), @__userId_1='?' (DbType = Int64), @__userId_2='?' (DbType = Int64), @__productId_3='?' (DbType = Int64)], CommandType='Text', CommandTimeout='30']
      SELECT [e].[ep_id] AS [Product], [t0].[bas_brand_id] AS [AssignedBrand], [t1].[itas_type_id] AS [AssignedItemType], [t2].[mas_market_id] AS [AssigedMarket]
      FROM [excelproducts] AS [e]
      INNER JOIN [market_products_prices] AS [m] ON [e].[ep_id] = [m].[markpr_pr_id]
      INNER JOIN (
          SELECT [m0].[market_id]
          FROM [Market] AS [m0]
          WHERE ([m0].[market_disable] <> CAST(1 AS tinyint)) OR [m0].[market_disable] IS NULL
      ) AS [t] ON [m].[markpr_market_id] = [t].[market_id]
      INNER JOIN [productLines] AS [p] ON [e].[ep_productLine] = [p].[pl_id]
      INNER JOIN [productLines] AS [p0] ON [p].[pl_parent] = [p0].[pl_id]
      INNER JOIN [Item_Type] AS [i] ON [p].[pl_prim_type] = [i].[type_id]
      INNER JOIN [Item_Type] AS [i0] ON [i].[Type_Parent] = [i0].[type_id]
      INNER JOIN [Item_Type] AS [i1] ON [i0].[Type_Parent] = [i1].[type_id]
      LEFT JOIN (
          SELECT [p1].[bas_brand_id]
          FROM [ph].[ph_brand_assigned_user] AS [p1]
          WHERE [p1].[bas_assigned_user_id] = 23026
      ) AS [t0] ON [p0].[pl_id] = [t0].[bas_brand_id]
      LEFT JOIN (
          SELECT [p2].[itas_type_id]
          FROM [ph].[ph_item_type_assigned_user] AS [p2]
          WHERE [p2].[itas_assigned_user_id] = 23026
      ) AS [t1] ON [i].[type_id] = [t1].[itas_type_id]
      LEFT JOIN (
          SELECT [p3].[mas_market_id]
          FROM [ph].[ph_market_assigned_user] AS [p3]
          WHERE [p3].[mas_assigned_w_user_id] = 23026
      ) AS [t2] ON [t].[market_id] = [t2].[mas_market_id]
      WHERE (([e].[ep_disable_pr_inapp] <> CAST(1 AS tinyint)) OR [e].[ep_disable_pr_inapp] IS NULL) AND ([e].[ep_id] = 7631886)