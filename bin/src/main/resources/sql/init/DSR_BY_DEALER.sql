SELECT DLR_CD, 
	TO_NUMBER(TO_CHAR(ADD_MONTHS(?, -1), 'YYYYMM')) FROM_MMYY,
	TO_NUMBER(TO_CHAR(ADD_MONTHS(?, -3), 'YYYYMM')) TO_MMYY, 
	TO_NUMBER(TO_CHAR(?, 'YYYYMM')) EFF_YYMM, 
	COUNT(*) CNT, 
	SUM(QTY) TQTY, 
	SUM(SALES_MO_TOTAL_SELL_DAYS) TSALE_DAYS,
	CAST(SUM(QTY) AS DOUBLE) / CAST(SUM(SALES_MO_TOTAL_SELL_DAYS) AS DOUBLE) DSR
FROM $SCHEMA$FLAT_RETAIL_CPO_SALES_MONTH
WHERE SALES_YYMM BETWEEN TO_NUMBER(TO_CHAR(ADD_MONTHS(?, -3), 'YYYYMM'))
	AND  TO_NUMBER(TO_CHAR(ADD_MONTHS(?, -1), 'YYYYMM'))
GROUP BY DLR_CD
