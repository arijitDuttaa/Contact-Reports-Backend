SELECT DISTINCT d.ZONE_CD
FROM $SCHEMA$DEALERS d 
WHERE d.STATUS_CD = 'A'
{AND DEALERS:d}
