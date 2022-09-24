SELECT DISTINCT customer_id, COUNT(*) AS [Number of Duplcates]
FROM customer_data
GROUP BY customer_id;

WITH CTE AS
(
SELECT *,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS RN
FROM customer_data
)

DELETE FROM CTE WHERE RN<>1

SELECT * FROM customer_data;