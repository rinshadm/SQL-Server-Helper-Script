-- Read from CSV or TXT files (in CSV format).
SELECT *
FROM OPENROWSET('MSDASQL',
    'Driver={Microsoft Access Text Driver (*.txt, *.csv)}',
    'SELECT * FROM D:\CSV_FILE.csv'
);

-- Read as a single string
SELECT * FROM OPENROWSET(
   BULK 'D:\CSV_FILE.csv',
   SINGLE_CLOB
) AS DATA;


-- To Enable OPENROWSET
EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO
EXEC sp_configure 'ad hoc distributed queries', 1
RECONFIGURE
GO

-- Read from different server
SELECT a.*
FROM OPENROWSET(
    'SQLNCLI', 'Server=DB_Server;Trusted_Connection=yes;',
    'SELECT *
         FROM table_name with (NOLOCK)'
) AS a;