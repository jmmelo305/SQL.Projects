-- Jose Melo
-- 11 / 5 / 2025


--Question 1: 
SELECT mob_name
FROM fortress1
WHERE spawns = (
    SELECT MAX(SPAWNS)
    FROM fortress1
);


--Question 2:
SELECT mob_name
FROM fortress1
WHERE spawns >ANY  (
    SELECT spawns
    FROM fortress2
);


--Question 3:
SELECT mob_name, biome_id 
FROM fortress1
WHERE (mob_name, biome_id) =ANY (
    SELECT mob_name, biome_id
    FROM fortress2
);


--Question 4: -- USED AI for pseudocode
SELECT
    f.mob_name,
    f.biome_id,
    f.spawns,
    AVG(f.spawns) OVER (PARTITION BY f.biome_id) AS avg_spawns,
    CASE
        WHEN f.spawns > AVG(f.spawns) OVER (PARTITION BY f.biome_id) THEN 'Above Average'
        WHEN f.spawns < AVG(f.spawns) OVER (PARTITION BY f.biome_id) THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS status
FROM
    FORTRESS1 f
ORDER BY
    f.biome_id, f.spawns;


--Question 5: -- USED AI for pseudocode
SELECT mob_name, biome_id, spawns
FROM FORTRESS1 f
WHERE f.spawns > (
    SELECT AVG(biome_avg) 
    FROM (
        SELECT AVG(spawns) AS biome_avg
        FROM FORTRESS1
        GROUP BY biome_id
    )
);


--Question 6: 
WITH biome_summary AS (
    SELECT 
        b.biome_id,
        b.biome_name,
        (SELECT AVG(f1.spawns) 
         FROM fortress1 f1 
         WHERE f1.biome_id = b.biome_id) AS f1_avg,
        (SELECT AVG(f2.spawns) 
         FROM fortress2 f2 
         WHERE f2.biome_id = b.biome_id) AS f2_avg
    FROM biomes b
)
SELECT *
FROM biome_summary
ORDER BY biome_id;


--Question 7:
INSERT INTO fortress1 (mob_name, biome_id, spawns, last_seen)
SELECT f2.mob_name, f2.biome_id, f2.spawns, f2.last_seen
FROM fortress2 f2
WHERE NOT EXISTS (
    SELECT 1
    FROM fortress1 f1
    WHERE f1.mob_name = f2.mob_name
      AND f1.biome_id = f2.biome_id
);


--Question 8:
MERGE INTO fortress1 f1
USING fortress2 f2
ON (f1.mob_name = f2.mob_name AND f1.biome_id = f2.biome_id)
WHEN MATCHED THEN
    UPDATE SET 
        f1.spawns = f2.spawns,
        f1.last_seen = f2.last_seen
WHEN NOT MATCHED THEN
    INSERT (mob_name, biome_id, spawns, last_seen)
    VALUES (f2.mob_name, f2.biome_id, f2.spawns, f2.last_seen);

