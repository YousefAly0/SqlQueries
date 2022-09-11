 SELECT [i].[type_id], [i].[type], [t0].[type_id], [t0].[type], [t0].[Id], [t0].[Name]
      FROM [Item_Type] AS [i]
      LEFT JOIN (
          SELECT [i0].[type_id], [i0].[type], [t].[Id], [t].[Name], [i0].[Type_Parent]
          FROM [Item_Type] AS [i0]
          LEFT JOIN (
              SELECT [i1].[type_id] AS [Id], [i1].[type] AS [Name], [i1].[Type_Parent]
              FROM [Item_Type] AS [i1]
              WHERE EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p]
                  WHERE ([i1].[type_id] = [p].[pl_prim_type]) AND [p].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint)))
          ) AS [t] ON [i0].[type_id] = [t].[Type_Parent]
          WHERE EXISTS (
              SELECT 1
              FROM [Item_Type] AS [i2]
              WHERE ([i0].[type_id] = [i2].[Type_Parent]) AND EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p0]
                  WHERE ([i2].[type_id] = [p0].[pl_prim_type]) AND [p0].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint))))
      ) AS [t0] ON [i].[type_id] = [t0].[Type_Parent]
      WHERE EXISTS (
          SELECT 1
          FROM [Item_Type] AS [i3]
          WHERE ([i].[type_id] = [i3].[Type_Parent]) AND EXISTS (
              SELECT 1
              FROM [Item_Type] AS [i4]
              WHERE ([i3].[type_id] = [i4].[Type_Parent]) AND EXISTS (
                  SELECT 1
                  FROM [productLines] AS [p1]
                  WHERE ([i4].[type_id] = [p1].[pl_prim_type]) AND [p1].[pl_parent] IN (CAST(1400329 AS bigint), CAST(1400296 AS bigint), CAST(1400147 AS bigint)))))
      ORDER BY [i].[type_id], [t0].[type_id], [t0].[Id]
