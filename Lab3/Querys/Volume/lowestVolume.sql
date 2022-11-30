SELECT  "dates", "volume"
FROM public."Volume"
WHERE "volume" = (SELECT MIN("volume") FROM public."Volume")