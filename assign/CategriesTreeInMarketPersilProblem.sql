SELECT [i].[type_id], [i].[type], CASE
          WHEN [i0].[itimg_image_url] IS NOT NULL AND (([i0].[itimg_image_url] <> N'') OR [i0].[itimg_image_url] IS NULL) THEN CAST(1 AS bit)
          ELSE CAST(0 AS bit)
      END,  COALESCE([i0].[itimg_image_url], N''), [i0].[itimg_type_id], [t0].[type_id], [t0].[type], [t0].[Id], [t0].[Name]
      FROM [Item_Type] AS [i]
      LEFT JOIN [ItemType_Image] AS [i0] ON [i].[type_id] = [i0].[itimg_type_id]
      LEFT JOIN (
          SELECT [i1].[type_id], [i1].[type], [t].[Id], [t].[Name], [i1].[Type_Parent]
          FROM [Item_Type] AS [i1]
          LEFT JOIN (
              SELECT [i2].[type_id] AS [Id], [i2].[type] AS [Name], [i2].[Type_Parent]
              FROM [Item_Type] AS [i2]
              WHERE EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p]
                  WHERE ([i2].[type_id] = [p].[pl_prim_type]) AND ([p].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint)) AND EXISTS (
                      SELECT 1
                      FROM [excelproducts] AS [e]
                      WHERE ((([e].[ep_disable_pr_inapp] <> CAST(1 AS tinyint)) OR [e].[ep_disable_pr_inapp] IS NULL) AND ([p].[pl_id] = [e].[ep_productLine])) AND EXISTS (
                          SELECT 1
                          FROM [market_products_prices] AS [m]
                          WHERE ([e].[ep_id] = [m].[markpr_pr_id]) AND ([m].[markpr_market_id] = 1)))))
          ) AS [t] ON [i1].[type_id] = [t].[Type_Parent]
          WHERE EXISTS (
              SELECT 1
              FROM [Item_Type] AS [i3]
              WHERE ([i1].[type_id] = [i3].[Type_Parent]) AND EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p0]
                  WHERE ([i3].[type_id] = [p0].[pl_prim_type]) AND ([p0].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint)) AND EXISTS (
                      SELECT 1
                      FROM [excelproducts] AS [e0]
                      WHERE ((([e0].[ep_disable_pr_inapp] <> CAST(1 AS tinyint)) OR [e0].[ep_disable_pr_inapp] IS NULL) AND ([p0].[pl_id] = [e0].[ep_productLine])) AND EXISTS (
                          SELECT 1
                          FROM [market_products_prices] AS [m0]
                          WHERE ([e0].[ep_id] = [m0].[markpr_pr_id]) AND ([m0].[markpr_market_id] = 1))))))
      ) AS [t0] ON [i].[type_id] = [t0].[Type_Parent]
      WHERE EXISTS (
          SELECT 1
          FROM [Item_Type] AS [i4]
          WHERE ([i].[type_id] = [i4].[Type_Parent]) AND EXISTS (
              SELECT 1
              FROM [Item_Type] AS [i5]
              WHERE ([i4].[type_id] = [i5].[Type_Parent]) AND EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p1]
                  WHERE ([i5].[type_id] = [p1].[pl_prim_type]) AND ([p1].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint)) AND EXISTS (
                      SELECT 1
                      FROM [excelproducts] AS [e1]
                      WHERE ((([e1].[ep_disable_pr_inapp] <> CAST(1 AS tinyint)) OR [e1].[ep_disable_pr_inapp] IS NULL) AND ([p1].[pl_id] = [e1].[ep_productLine])) AND EXISTS (
                          SELECT 1
                          FROM [market_products_prices] AS [m1]
                          WHERE ([e1].[ep_id] = [m1].[markpr_pr_id]) AND ([m1].[markpr_market_id] =1)))))))
      ORDER BY [i].[type_id], [i0].[itimg_type_id], [t0].[type_id], [t0].[Id]