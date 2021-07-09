
--물건 출고일자 내 고객ID, 주문수량 검색 프로시저

CREATE PROCEDURE USP_GetCustomerShipDates(

@ShipDateStart DATETIME ,

@ShipDateEnd DATETIME)

AS

SELECT CustomerID ,

     SalesOrderNumber

FROM Sales.SalesOrderHeader

WHERE ShipDate BETWEEN @ShipDateStart AND @ShipDateEnd

