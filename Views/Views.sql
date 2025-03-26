CREATE VIEW top_artists AS

SELECT a.artist_id, a.full_name, COUNT(w.work_id) AS total_paintings
FROM artist a
JOIN work w ON a.artist_id = w.artist_id
GROUP BY a.artist_id, a.full_name
ORDER BY total_paintings DESC
LIMIT 5;

-- View 2: Top 5 Museums with Most Paintings
CREATE VIEW top_museums AS

SELECT m.museum_id, m.museum_name, COUNT(w.work_id) AS total_paintings
FROM museum m
JOIN work w ON m.museum_id = w.museum_id
GROUP BY m.museum_id, m.museum_name
ORDER BY total_paintings DESC
LIMIT 5;

-- View 3: Most Expensive and Least Expensive Painting with Artist & Museum Details
CREATE VIEW painting_price_extremes AS

SELECT w.title, a.full_name AS artist_name, w.sale_price, m.museum_name, m.city
FROM work w
JOIN artist a ON w.artist_id = a.artist_id
JOIN museum m ON w.museum_id = m.museum_id
WHERE w.sale_price = (SELECT MAX(sale_price) FROM work)
   OR w.sale_price = (SELECT MIN(sale_price) FROM work);

-- View 4: Most Popular Painting Styles
CREATE VIEW popular_styles AS

SELECT style, COUNT(*) AS total_paintings
FROM work
WHERE style IS NOT NULL
GROUP BY style
ORDER BY total_paintings DESC;

-- View 5: Artists with Paintings in Multiple Countries
CREATE VIEW multi_country_artists AS

SELECT a.artist_id, a.full_name, COUNT(DISTINCT m.country) AS total_countries
FROM artist a
JOIN work w ON a.artist_id = w.artist_id
JOIN museum m ON w.museum_id = m.museum_id
GROUP BY a.artist_id, a.full_name
HAVING COUNT(DISTINCT m.country) > 1;

--View for Most Expensive and Least Expensive Paintings --
CREATE VIEW expensive_cheap_paintings AS
WITH ranked_paintings AS (
    SELECT w.work_id, w.title, w.sale_price, 
           a.full_name AS artist_name, 
           m.museum_name, m.city, 
           RANK() OVER (ORDER BY w.sale_price DESC) AS most_expensive_rank,
           RANK() OVER (ORDER BY w.sale_price ASC) AS least_expensive_rank
    FROM work w
    JOIN artist a ON w.artist_id = a.artist_id
    JOIN museum m ON w.museum_id = m.museum_id
)
SELECT work_id, title, sale_price, artist_name, museum_name, city
FROM ranked_paintings
WHERE most_expensive_rank = 1 OR least_expensive_rank = 1;


View for Artists Displayed in Multiple Countries
CREATE VIEW artists_in_multiple_countries AS
SELECT w.artist_id, a.full_name, STRING_AGG(DISTINCT m.country, ', ') AS countries_displayed
FROM work w
JOIN artist a ON w.artist_id = a.artist_id
JOIN museum m ON w.museum_id = m.museum_id
GROUP BY w.artist_id, a.full_name
HAVING COUNT(DISTINCT m.country) > 1;

