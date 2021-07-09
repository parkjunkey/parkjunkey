
--# SP Recompile
CREATE Procedure Get_OrderID_OrderQty
	@ProdictID INT
WITH RECOMPILE
AS
SELECT		SalesOrderDetailID
			, OrderQty
FROM		Sales.SalesOrderDetail WITH (NOLOCK)
WHERE		ProductID = @ProdictID	