SELECT public."High_Low"."dates", "open", "high","low","close","adj close","volume"
FROM public."High_Low"
INNER JOIN public."Open_Close" ON public."High_Low"."dates"=public."Open_Close"."dates"
INNER JOIN public."Volume" ON public."High_Low"."dates"=public."Volume"."dates"