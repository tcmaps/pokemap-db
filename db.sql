-- version info
CREATE TABLE config
(
version varchar(3) DEFAULT '1.0'
);

-- map cells
CREATE TABLE cells
(
cell_id BIGINT UNSIGNED, -- s2sphere format cell id, uint64
skip BOOLEAN DEFAULT 0, -- skip scanning this cell?
complete_scan BOOLEAN DEFAULT 0, -- cell fully traversed each 15min time quadrant?
content BIT(8), -- has (reserved);gyms;pokestops;spawns?
last_scan TIMESTAMP -- last scan/update time of this data
);

CREATE TABLE forts -- pokestops and gyms
(
cell_id BIGINT UNSIGNED, -- cell id containing this fort
fort_id VARCHAR(64), -- fort id
pos_s2 BIGINT UNSIGNED, -- s2 level 30 cell id as single value coordinate
pos_lat DOUBLE, -- wgs84 latitude coordinate stored in iee754 standard
pos_long DOUBLE, -- wgs84 longtitude coordinate stored in iee754 standard
fort_enabled BOOLEAN, -- is fort enabled?
fort_type TINYINT UNSIGNED, -- gym or pokestop?
fort_description TEXT, -- (optional) fort description text
fort_image BLOB, -- (optional) fort image, base64 encoded
fort_sponsor TINYTEXT, -- (optional) fort sponsor? (not used yet)
fort_last_modified TIMESTAMP, -- (optional) some internal modify time
last_scan TIMESTAMP -- last scan/update time of this data
);

CREATE TABLE spawns -- spawn points
(
cell_id BIGINT UNSIGNED , -- cell id containing this fort
spawn_id VARCHAR(64) DEFAULT '0', -- spawn point id
pos_s2 BIGINT UNSIGNED , -- s2 level 30 cell id as single value coordinate
pos_lat DOUBLE, -- wgs84 latitude coordinate stored in iee754 standard
pos_long DOUBLE, -- wgs84 longtitude coordinate stored in iee754 standard
static_spawner SMALLINT UNSIGNED , -- is this spawn spawning always the same pokemon? 0 if not
spawn_time_base TIME DEFAULT 0,
spawn_time_offset TIME DEFAULT 0,
spawn_time_dur TIME DEFAULT 0,
last_scan TIMESTAMP -- last scan/update time of this data
);
