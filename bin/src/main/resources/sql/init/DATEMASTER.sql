SELECT
	CAL_DATE,
	CAL_YR,
	CAL_MO,
	CAL_YR_MO_ID,
	CAL_MO_NAME,
	CAL_MO_NAME_YR,
	CAL_YR_WK,
	CAL_MO_WK,
	CAL_WK_DAY,
	CAL_WK_DAY_NAME,
	CAL_MO_DAY,
	CAL_MO_FIRST_DAY,
	CAL_MO_LAST_DAY,
	SALES_HOLIDAY_OBSERVED_FLAG,
	SALES_HOLIDAY_ACTUAL_FLAG,
	SALES_CLOSE_DAY_FLAG,
	SALES_YR,
	SALES_MO,
	SALES_YR_MO_ID,
	SALES_MO_NAME,
	SALES_MO_NAME_YR,
	SALES_MO_DAY,
	SALES_MO_TOTAL_DAYS,
	SALES_MO_WK,
	SALES_MO_SELL_DAY,
	SALES_MO_TOTAL_SELL_DAYS,
	SALES_OPEN_DAY_FLAG,
	SALES_MO_OPEN_DAY,
	SALES_MO_CLOSE_DAY,
	SALES_MO_RELEASE_DAY,
	FIS_YR,
	FIS_YR_QTR_NAME,
	FIS_QTR,
	FIS_YR_QTR_ID,
	FIS_YR_FIRST_DAY_FLAG,
	FIS_YR_LAST_DAY_FLAG,
	FIS_QTR_FIRST_DAY_FLAG,
	FIS_QTR_LAST_DAY_FLAG,
	FIS_YR_FIRST_DAY,
	FIS_YR_LAST_DAY,
	FIS_QTR_FIRST_DAY,
	FIS_QTR_LAST_DAY,
	SALES_FIS_YR,
	SALES_FIS_YR_QTR_NAME,
	SALES_FIS_QTR,
	SALES_FIS_YR_QTR_ID,
	SALES_FIS_YR_FIRST_DAY_FLAG,
	SALES_FIS_YR_LAST_DAY_FLAG,
	SALES_FIS_YR_FIRST_DAY,
	SALES_FIS_YR_LAST_DAY,
	SALES_FIS_QTR_FIRST_DAY_FLAG,
	SALES_FIS_QTR_LAST_DAY_FLAG,
	SALES_FIS_QTR_FIRST_DAY,
	SALES_FIS_QTR_LAST_DAY,
	FIS_YR_MAZDA_ID,
	SALES_FIS_YR_MAZDA_ID,
	VALIDATION_FLAG,
	CALENDAR_DATE,
	BUSINESS_MONTH_NUM,
	BUSINESS_YEAR_NUM,
	YEAR_VALUE,
	BUSINESS_MONTH_FIRST_DT,
	PARTS_SALES_HOLIDAY_FLAG,
	PARTS_BUSINESS_DAY,
	PARTS_BUSINESS_DAY_NUMBER,
	SALES_PREV_YR_DT_KEY,
	SALES_PREV_MO_DT_KEY,
	SALES_PREV_YR_SELL_DAY_KEY,
	SALES_PREV_MO_SELL_DAY_KEY
FROM
	$SCHEMA$DATEMASTER;
