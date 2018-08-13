--Dados OD do Metrô de São Paulo (2007)
--Cria pontos para os destinos [que se localizam na geometria do TERRITORIO]
--e categoriza o modo principal [modoprin] com a sua descrição.

DROP TABLE qlayer;
SELECT ST_makepoint(co_d_x, co_d_y), modoprin, CASE modoprin
			WHEN  01 THEN 'Ônibus Município S.Paulo'
			WHEN  02 THEN 'Ônibus Outros Municípios'
			WHEN  03 THEN 'Ônibus Metropolitano'
			WHEN  04 THEN 'Ônibus Fretado'
			WHEN  05 THEN 'Escolar'
			WHEN  06 THEN 'Dirigindo Automóvel'
			WHEN  07 THEN 'Passageiro de Automóvel'
			WHEN  08 THEN 'Táxi'
			WHEN  09 THEN 'Microônibus/Van Município de S.Paulo'
			WHEN  10 THEN 'Microônibus/Van Outros Município'
			WHEN  11 THEN 'Microônibus/Van Metropolitano'
			WHEN  12 THEN 'Metrô'
			WHEN  13 THEN 'Trem'
			WHEN  14 THEN 'Moto'
			WHEN  15 THEN 'Bicicleta'
			WHEN  16 THEN 'A Pé'
			WHEN  17 THEN 'Outros'
			END AS CATEGORIA
INTO qlayer
FROM "OD_2007_db"
WHERE ST_intersects(ST_SetSRID(ST_makepoint(co_d_x, co_d_y),31923), ST_SetSRID((select geom from territorio),31923))
