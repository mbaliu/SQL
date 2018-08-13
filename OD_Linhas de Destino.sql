DROP table qlayer;
SELECT ST_SetSRID(ST_makeline(
--			ST_makepoint(co_dom_x, co_dom_y), 
			ST_makepoint((SELECT AVG(co_o_x) AS geom
							FROM "OD_2007_db", territorio
							WHERE ST_intersects(ST_SetSRID(ST_makepoint(co_o_x, co_o_y),31923), ST_SetSRID(territorio.geom,31923))
							GROUP BY ST_intersects(ST_SetSRID(ST_makepoint(co_o_x, co_o_y),31923), ST_SetSRID(territorio.geom,31923))), (SELECT AVG(co_o_y) AS geom
							FROM "OD_2007_db", territorio
							WHERE ST_intersects(ST_SetSRID(ST_makepoint(co_o_x, co_o_y),31923), ST_SetSRID(territorio.geom,31923))
							GROUP BY ST_intersects(ST_SetSRID(ST_makepoint(co_o_x, co_o_y),31923), ST_SetSRID(territorio.geom,31923)))),
			ST_makepoint(co_d_x, co_d_y)),22523) AS geom, 
			-- inserir agrupamento dos destinos
			-- e retornar a quantificação
			 0 AS zona_o, zona_d, id_ordem
INTO qlayer
FROM "OD_2007_db", territorio
WHERE ST_intersects(ST_SetSRID(ST_makepoint(co_o_x, co_o_y),31923), ST_SetSRID(territorio.geom,31923))
