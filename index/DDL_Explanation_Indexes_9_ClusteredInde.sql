/* ÍNDICE AGRUPADO */
-- Un índice agrupado es la propia tabla. Fuerza que se ordenen todas la filas de la tabla según este índice
-- Cada tabla tiene un único índice agrupado

-- En las tablas InnoDB optimiza las consultas de SELECT, INSERT, UPDATE y DELETE

-- En una tabla InnoDB se considera la PK como el índice agrupado
-- Si no existe un PK definida, se cogerá el primer índice UNIQUE cuyas columnas (todas) tomen valores NOT NULL
-- Si no existe un índice UNIQUE cuyas columanas tomen valores NOT NULL, se crea un índice agrupado escondido llamado GEN_CLUST_INDEX

-- Cada tabla InnoDB tiene un único índice agrupado

-- Habrá clustered index (índice agrupado) y non-clustered indexes (índices no agrupados)

-- En las tablas InnoDB, cada registro de un índice secundario contiene el valor de la columna PK para dicha fila
-- así como las columnas especificadas como índices no agrupados. MySQL utiliza el valor de la PK para hacer búsquedas 
-- en el índice agrupado. Por esa razón, interesa tener una PK corta. 