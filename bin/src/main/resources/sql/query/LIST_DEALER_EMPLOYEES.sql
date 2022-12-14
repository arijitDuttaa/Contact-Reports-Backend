SELECT 	DISTINCT A.PRSN_ID_CD, A.STATUS_CD, A.PRSN_TYPE_CD, A.FRST_NM, A.MIDL_NM, A.LAST_NM, ' ' JOB_CD, B.LOCTN_CD, ' ' USERID, ' ' EMAIL_ADDR, 
		' ' RGN_CD, ' ' ZONE_CD, ' ' DISTRICT_CD, ' ' TYPE_CD, ' ' JOB_TITLE_TX
		FROM 	$SCHEMA$BTC03020 A,
				$SCHEMA$BTC03050 B,
				$SCHEMA$BTC03110 C,
				$SCHEMA$BTC03010 D
		WHERE   A.PRSN_ID_CD = B.PRSN_ID_CD
		AND 	A.PRSN_ID_CD = C.PRSN_ID_CD
		AND 	D.JOB_CD = B.JOB_CD
		AND		PRSN_TYPE_CD = 'D'
		AND 	C.END_DT = '0001-01-01'
		AND 	B.LOCTN_CD = ?
