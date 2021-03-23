With FKs as (SELECT TABLE_NAME, COLUMN_NAME AS NumColsFK
FROM ALL_CONS_COLUMNS
WHERE OWNER = 'PARRANDEROS' AND constraint_name like '%FK%'),
nn as (select c.table_name, c.column_name as NumColsNoNull
from all_tab_columns c
where owner = 'PARRANDEROS' and c.column_name not in (select column_name from all_cons_columns))

SELECT c.TABLE_NAME as NombreTabla, count(fks.numcolsfk) as NumColsFk, count(column_name) as NumColumnas, count(nn.numcolsnonull) as NumCollsNull
from all_tab_columns c
full outer join FKs on fks.table_name = c.table_name
full outer join nn on nn.table_name = c.table_name
where c.owner = 'PARRANDEROS'
group by c.table_name;

