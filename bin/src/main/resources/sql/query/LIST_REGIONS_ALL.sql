SELECT DISTINCT d.RGN_CD, d.RGN_NM
FROM $SCHEMA$DEALERS d 
WHERE COALESCE(d.RGN_NM, '') <> ''
{AND DEALERS:d}
ORDER BY 2