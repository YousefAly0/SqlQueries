USE [Do2romStage23112021]
GO

INSERT INTO [ph].[ph_market_assigned_user]
           ([mas_assigned_w_user_id]
           ,[mas_admin_w_user_id]
           ,[mas_market_id])
     VALUES
           (<mas_assigned_w_user_id, bigint,>
           ,<mas_admin_w_user_id, bigint,>
           ,<mas_market_id, int,>)
GO

