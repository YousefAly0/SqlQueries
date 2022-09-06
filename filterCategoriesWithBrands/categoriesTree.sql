SELECT [t].[type_id], [t].[type], [t].[type_EnName], [t].[type_image], [t].[type_order], [t].[Type_Parent], [t0].[type_id], [t0].[type], [t0].[type_EnName], [t0].[type_image], [t0].[type_order], [t0].[Type_Parent], [t0].[type_id0], [t0].[type0], [t0].[type_EnName0], [t0].[type_image0], [t0].[type_order0], [t0].[Type_Parent0]
      FROM (
          SELECT TOP(1) [i].[type_id], [i].[type], [i].[type_EnName], [i].[type_image], [i].[type_order], [i].[Type_Parent]
          FROM [Item_Type] AS [i]
          WHERE [i].[type_id] = 10200010
      ) AS [t]
      LEFT JOIN (
          SELECT [i0].[type_id], [i0].[type], [i0].[type_EnName], [i0].[type_image], [i0].[type_order], [i0].[Type_Parent], [i1].[type_id] AS [type_id0], [i1].[type] AS [type0], [i1].[type_EnName] AS [type_EnName0], [i1].[type_image] AS [type_image0], [i1].[type_order] AS [type_order0], [i1].[Type_Parent] AS [Type_Parent0]
          FROM [Item_Type] AS [i0]
          LEFT JOIN [Item_Type] AS [i1] ON [i0].[type_id] = [i1].[Type_Parent]
      ) AS [t0] ON [t].[type_id] = [t0].[Type_Parent]
      ORDER BY [t].[type_id], [t0].[type_id], [t0].[type_id0]

	   SELECT [t].[type_id], [t].[type], [t].[type_EnName], [t].[type_image], [t].[type_order], [t].[Type_Parent], [t0].[type_id], [t0].[type], [t0].[type_EnName], [t0].[type_image], [t0].[type_order], [t0].[Type_Parent], [t0].[type_id0], [t0].[type0], [t0].[type_EnName0], [t0].[type_image0], [t0].[type_order0], [t0].[Type_Parent0]
      FROM (
          SELECT TOP(1) [i].[type_id], [i].[type], [i].[type_EnName], [i].[type_image], [i].[type_order], [i].[Type_Parent]
          FROM [Item_Type] AS [i]
          WHERE [i].[type_id] = 10200010
      ) AS [t]
      LEFT JOIN (
          SELECT [i0].[type_id], [i0].[type], [i0].[type_EnName], [i0].[type_image], [i0].[type_order], [i0].[Type_Parent], [i1].[type_id] AS [type_id0], [i1].[type] AS [type0], [i1].[type_EnName] AS [type_EnName0], [i1].[type_image] AS [type_image0], [i1].[type_order] AS [type_order0], [i1].[Type_Parent] AS [Type_Parent0]
          FROM [Item_Type] AS [i0]
          LEFT JOIN [Item_Type] AS [i1] ON [i0].[type_id] = [i1].[Type_Parent]
      ) AS [t0] ON [t].[type_id] = [t0].[Type_Parent]
      ORDER BY [t].[type_id], [t0].[type_id], [t0].[type_id0]



	  SELECT [t].[type_id], [t].[type], [t0].[type_id], [t0].[type], [t0].[type_id0], [t0].[type0]
      FROM (
          SELECT TOP(1) [i].[type_id], [i].[type]
          FROM [Item_Type] AS [i]
          WHERE [i].[type_id] = 10200010
      ) AS [t]
      LEFT JOIN (
          SELECT [i0].[type_id], [i0].[type], [i1].[type_id] AS [type_id0], [i1].[type] AS [type0], [i0].[Type_Parent]
          FROM [Item_Type] AS [i0]
          LEFT JOIN [Item_Type] AS [i1] ON [i0].[type_id] = [i1].[Type_Parent]
      ) AS [t0] ON [t].[type_id] = [t0].[Type_Parent]
      ORDER BY [t].[type_id], [t0].[type_id], [t0].[type_id0]

