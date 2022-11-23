MERGE INTO  $SCHEMA$DEALERS AS DLR 
USING (
	SELECT
		APPT_DT,
		CITY_NM,
		CNTRY_CD,
		CNTY_CD,
		DBA_NM,
		DISTRICT_CD,
		DLR_CD,
		DLR_INACTV_DT,
		FACILITY_TYPE,
		MDA_CD,
		NXT_DLR_CD,
		PREV_DLR_CD,
		RGN_CD,
		SOA_CD,
		SOA_NM,
		ST_CD,
		STATUS_CD,
		STATUS_DT,
		SVC_ONLY_DT,
		SVC_ONLY_FL,
		TERM_DT,
		TIME_ZONE_CD,
		USED_CAR_FL,
		W_UPDT_DT,
		ZIP1_CD,
		ZIP2_CD,
		ZONE_CD,
		RGN_NM
	FROM
		$SCHEMA$DEALERS_STAGE
	) AS STG
ON (DLR.DLR_CD = STG.DLR_CD)
WHEN MATCHED THEN 
	UPDATE SET 
		DLR.APPT_DT = STG.APPT_DT,
		DLR.CITY_NM = STG.CITY_NM,
		DLR.CNTRY_CD = STG.CNTRY_CD,
		DLR.CNTY_CD = STG.CNTY_CD,
		DLR.DBA_NM = STG.DBA_NM,
		DLR.DISTRICT_CD = STG.DISTRICT_CD,
		DLR.DLR_INACTV_DT = STG.DLR_INACTV_DT,
		DLR.FACILITY_TYPE = STG.FACILITY_TYPE,
		DLR.MDA_CD = STG.MDA_CD,
		DLR.NXT_DLR_CD = STG.NXT_DLR_CD,
		DLR.PREV_DLR_CD = STG.PREV_DLR_CD,
		DLR.RGN_CD = STG.RGN_CD,
		DLR.SOA_CD = STG.SOA_CD,
		DLR.SOA_NM = STG.SOA_NM,
		DLR.ST_CD = STG.ST_CD,
		DLR.STATUS_CD = STG.STATUS_CD,
		DLR.STATUS_DT = STG.STATUS_DT,
		DLR.SVC_ONLY_DT = STG.SVC_ONLY_DT,
		DLR.SVC_ONLY_FL = STG.SVC_ONLY_FL,
		DLR.TERM_DT = STG.TERM_DT,
		DLR.TIME_ZONE_CD = STG.TIME_ZONE_CD,
		DLR.USED_CAR_FL = STG.USED_CAR_FL,
		DLR.W_UPDT_DT = STG.W_UPDT_DT,
		DLR.ZIP1_CD = STG.ZIP1_CD,
		DLR.ZIP2_CD = STG.ZIP2_CD,
		DLR.ZONE_CD = STG.ZONE_CD,
		DLR.RGN_NM = STG.RGN_NM
WHEN NOT MATCHED THEN 
	INSERT 
		(	
		APPT_DT,
		CITY_NM,
		CNTRY_CD,
		CNTY_CD,
		DBA_NM,
		DISTRICT_CD,
		DLR_CD,
		DLR_INACTV_DT,
		FACILITY_TYPE,
		MDA_CD,
		NXT_DLR_CD,
		PREV_DLR_CD,
		RGN_CD,
		SOA_CD,
		SOA_NM,
		ST_CD,
		STATUS_CD,
		STATUS_DT,
		SVC_ONLY_DT,
		SVC_ONLY_FL,
		TERM_DT,
		TIME_ZONE_CD,
		USED_CAR_FL,
		W_UPDT_DT,
		ZIP1_CD,
		ZIP2_CD,
		ZONE_CD,
		RGN_NM
		)
	VALUES (
		STG.APPT_DT,
		STG.CITY_NM,
		STG.CNTRY_CD,
		STG.CNTY_CD,
		STG.DBA_NM,
		STG.DISTRICT_CD,
		STG.DLR_CD,
		STG.DLR_INACTV_DT,
		STG.FACILITY_TYPE,
		STG.MDA_CD,
		STG.NXT_DLR_CD,
		STG.PREV_DLR_CD,
		STG.RGN_CD,
		STG.SOA_CD,
		STG.SOA_NM,
		STG.ST_CD,
		STG.STATUS_CD,
		STG.STATUS_DT,
		STG.SVC_ONLY_DT,
		STG.SVC_ONLY_FL,
		STG.TERM_DT,
		STG.TIME_ZONE_CD,
		STG.USED_CAR_FL,
		STG.W_UPDT_DT,
		STG.ZIP1_CD,
		STG.ZIP2_CD,
		STG.ZONE_CD,
		STG.RGN_NM
		) 

	