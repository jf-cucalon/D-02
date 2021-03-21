alter session set current_schema=parranderos;
SELECT TABLE_NAME as NombreTabla ,DATA_TYPE as TipoDeDato, COUNT(*)as NumColsTipoDato, AVG(AVG_COL_LEN) as PromedioLongitudCol
FROM ALL_TAB_COLUMNS 
WHERE OWNER = 'PARRANDEROS' 
group by TABLE_NAME, DATA_TYPE
ORDER BY TABLE_NAME;
