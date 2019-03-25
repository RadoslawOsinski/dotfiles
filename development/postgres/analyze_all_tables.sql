DO $$
DECLARE
    i record;
BEGIN
    FOR i IN SELECT distinct table_name FROM information_schema.tables WHERE table_schema = 'public'
        LOOP
            RAISE NOTICE 'Refresh tabeli %', i.table_name;
            EXECUTE 'analyse public."' || i.table_name || '"';
        END LOOP;
END;
$$
