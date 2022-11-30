INSERT INTO public."Open_Close" ("dates", "open", "close", "adj close")
SELECT "dates", "open", "close", "adj close" FROM public."appledata";