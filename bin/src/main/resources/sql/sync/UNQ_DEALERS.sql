SELECT
	DLR_CD,
	DBA_NM,
	STATUS_CD,
	STATUS_DT,
	RGN_CD,
	CITY_NM,
	ZIP1_CD,
	CNTY_CD,
	ST_CD,
	MDA_CD,
	SOA_NM,
	APPT_DT,
	TERM_DT,
	PREV_DLR_CD,
	NXT_DLR_CD,
	TIME_ZONE_CD,
	SOA_CD,
	USED_CAR_FL,
	CNTRY_CD,
	ZIP2_CD,
	DLR_INACTV_DT,
	SVC_ONLY_FL,
	SVC_ONLY_DT,
	MDA_NM,
	LAT,
	LON,
	ZONE_CD,
	DISTRICT_CD,
	DEALERSTRTEND,
	DEALEREFFEND,
	FACILITY_TYPE,
	SHOWROOM_TYPE,
	RGN_NM,
	DEALERSHIP_FLAG,
	W_UPDT_DT
FROM
	EDW_RPT.SQRT_EDW_DEALER_MASTER_V A
WHERE
	A.RGN_CD IN ('GU', 'MW', 'NE', 'PA')
AND
	A.DISTRICT_CD  <> '99'
AND
	A.ZONE_CD  <> '99'
AND
	A.STATUS_CD  = 'A'
AND 
	W_UPDT_DT > TO_DATE(?, 'YYYY-MM-DD')
AND
	TO_DATE(A.DEALEREFFEND) = (
	SELECT
		MAX(TO_DATE(DEALEREFFEND))
	FROM
		EDW_RPT.SQRT_EDW_DEALER_MASTER_V B
	WHERE
		B.DLR_CD = A.DLR_CD)