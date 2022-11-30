SELECT  "dates","close"
FROM public."Open_Close"
WHERE "close" = (SELECT MAX("close") FROM public."Open_Close");