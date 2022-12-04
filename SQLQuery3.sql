SELECT SubTotal, TaxAmt, SubTotal + TaxAmt as 'a+b' ,SubTotal - TaxAmt as 'a-b',SubTotal / TaxAmt as 'a/b'
FROM Purchasing.PurchaseOrderHeader
where TaxAmt>0 and SubTotal - TaxAmt >500;
