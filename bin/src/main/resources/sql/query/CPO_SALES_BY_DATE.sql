SELECT ASON, ? AS MTD_PERIOD, SALE_YEAR_MONTH, B.SALES_MO_CLOSE_DAY, CNT, QTY
FROM
	(SELECT ASON, SALE_YEAR_MONTH, COUNT(*) CNT, SUM(QTY) QTY
	FROM $SCHEMA$RETAIL_CPO_SALES_MTD X,
		$SCHEMA$DEALERS Y
	WHERE TRANSACTION_TYPE = 'CPO'
	AND   ASON = ? 
	AND X.DLR_CD = Y.DLR_CD
	{AND DEALERS:Y}
	GROUP BY ASON, SALE_YEAR_MONTH) A,
	(SELECT DISTINCT 
		SALES_YR_MO_ID, 
		SALES_MO_CLOSE_DAY 
	FROM $SCHEMA$DATEMASTER) B
WHERE A.SALE_YEAR_MONTH = B.SALES_YR_MO_ID	
