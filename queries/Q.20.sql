--20. Which country has the 5th highest no of paintings?

SELECT country, COUNT(*) AS total_paintings
FROM museum m
JOIN work w ON m.museum_id = w.museum_id
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_paintings DESC
LIMIT 1 OFFSET 4; -- Fetches the 5th highest country
