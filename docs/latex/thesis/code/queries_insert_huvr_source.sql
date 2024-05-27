-- los datos del string jdbc de la base de datos no se muestran al completo por confidencialidad

INSERT INTO webapi.source (source_id, source_name, source_key, source_connection, source_dialect) 
SELECT 3, 'S31 Registry HUVR', 'S31HUVR', ' jdbc:postgresql://servidor:5432/omop_oncologia?user=usuario&password=contrasea', 'postgresql';

INSERT INTO webapi.source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority) 
SELECT nextval('webapi.source_daimon_sequence'), 3, 0, 'omop', 1
FROM webapi.source
WHERE source_key = 'S31HUVR';

INSERT INTO webapi.source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority) 
SELECT nextval('webapi.source_daimon_sequence'), 3, 2, 'result', 0
FROM webapi.source
WHERE source_key = 'S31HUVR';