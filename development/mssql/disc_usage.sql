--Check MsSQL version:
SELECT @@VERSION
--Output simmiliar to:
Microsoft SQL Server 2008 R2 (RTM) - 10.50.1600.1

--Ask for disc usage:
SELECT
  (SELECT CONVERT(DECIMAL(18,2), SUM(CAST(df.size as float))*8/1024.0)
   FROM sys.database_files AS df
   WHERE df.type in ( 0, 2, 4 ) ) AS [DbSize],
  CONVERT(DECIMAL(18,2), SUM(a.total_pages)*8/1024.0) AS [SpaceUsed],
  (SELECT CONVERT(DECIMAL(18,2), SUM(CAST(df.size as float))*8/1024.0)
   FROM sys.database_files AS df
   WHERE df.type in (1, 3)) AS [LogSize]
FROM sys.partitions p join sys.allocation_units a
    on p.partition_id = a.container_id;
