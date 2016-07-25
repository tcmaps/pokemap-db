-- version info
CREATE TABLE config
(
version varchar(3),
);

-- map cells
CREATE TABLE cells
(
cell_id BIGINT, -- s2sphere format cell id, uint64
skip BIT(1), -- skip scanning this cell?
complete_scan BIT(1), -- cell fully traversed each 15min time quadrant?
content BIT(8), -- has (reserved);gyms;pokestops;spawns?
last_scan TIMESTAMP, -- last scan/update time of this data
);

CREATE TABLE forts -- pokestops and gyms
(
cell_id BIGINT, -- cell id containing this fort
fort_id VARCHAR(64), -- fort id
pos_s2 BIGINT, -- s2 level 30 cell id for single value position storage
pos_lat DOUBLE, -- wgs84 latitude coordinate stored in iee754 standard
pos_long DOUBLE, -- wgs84 longtitude coordinate stored in iee754 standard
fort_type BIT(1), -- gym or pokestop?
fort_description BLOB, -- (optional) fort description text
fort_image BLOB, -- (optional) fort image, base64 encoded
last_scan TIMESTAMP, -- last scan/update time of this data
);

CREATE TABLE spawns -- spawn points
(
cell_id BIGINT, -- cell id containing this fort
spawnpoint_id VARCHAR(64), -- spawn point id
pos_s2 BIGINT, -- level 30 cell id for single value position storage
pos_lat DOUBLE, -- wgs84 latitude coordinate stored in iee754 standard
pos_long DOUBLE, -- wgs84 longtitude coordinate stored in iee754 standard
last_scan TIMESTAMP, -- last scan/update time of this data
);
