--Jose Melo
--DBA 120
--10/26/2025
--Lab10_Jojo_Functions

--Question 1:
SELECT stand_name, upper(stand_name) AS STAND_UPPER, lower(stand_name) AS STAND_LOWER, initcap (stand_name) AS STAND_TITLE
FROM stand_user;


--Question 2:
SELECT user_name, catchphrase, length(catchphrase) AS PHRASE_LENGTH
FROM stand_user 
ORDER BY PHRASE_LENGTH DESC;

--Question 3:
SELECT stand_name, SUBSTR (stand_name,1, 8) AS STAND_SHORT
FROM stand_user;

--Question 4:
SELECT stand_name, instr (stand_name, 'World' ) as WORLD_POSITION
FROM stand_user;

--Question 5:
SELECT user_name, lpad (power, 8, '*') AS Power_bar
FROM stand_user;

--Question 6:
SELECT 
 user_name,
 power, 
 ROUND(power, 2) AS rounder_power,
 TRUNC(power, 2) AS truncated_power,
 MOD (power, 300) AS power_mod_300
FROM stand_user;

--Question 7:
SELECT user_name, nvl(TO_CHAR(precision), 'Unknown') AS Precision_Status
FROM stand_user;

--Question 8:
SELECT user_name, debut_date, NEXT_DAY(ADD_MONTHS(debut_date, 6), 'MONDAY') AS Training_Review
FROM stand_user;

--Question 9:  
SELECT user_name, ROUND(MONTHS_BETWEEN(SYSDATE, debut_date)) AS Months_Since_debut
FROM stand_user
ORDER BY debut_date; --Output exactly as shown in screenshot provided

SELECT user_name, ROUND(MONTHS_BETWEEN(SYSDATE, debut_date)) AS Months_Since_debut
FROM stand_user
ORDER BY debut_date DESC; --Output based on what order the question asked.

--Question 10:
SELECT user_name, stand_name,
    user_name
    || ' wields '
    || stand_name
    || ' with power '
    || TO_CHAR (power, 'FM99,999')
    || ', but dreams of '
    || TO_CHAR(power * 3, 'FM99,999')
    || '.' AS dream_statement
FROM stand_user;

--Question 11:
SELECT *
FROM stand_user
WHERE REGEXP_LIKE(stand_name, 'world', 'i');

--Question 12:
SELECT user_name, stand_name, SOUNDEX(stand_name) AS sound_code
FROM stand_user;