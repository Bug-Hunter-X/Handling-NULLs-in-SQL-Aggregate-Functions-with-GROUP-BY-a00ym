Several approaches can correct the issue:

**1. Using COALESCE (standard SQL):**
```sql
SELECT category, SUM(COALESCE(price, 0)) AS total_price
FROM products
GROUP BY category;
```
COALESCE replaces NULL with 0.  If `price` is NULL, it will use 0 in the sum.

**2. Using ISNULL (SQL Server):**
```sql
SELECT category, SUM(ISNULL(price, 0)) AS total_price
FROM products
GROUP BY category;
```
ISNULL is the SQL Server equivalent of COALESCE. It achieves the same outcome.

**3. Using IFNULL (MySQL):**
```sql
SELECT category, SUM(IFNULL(price, 0)) AS total_price
FROM products
GROUP BY category;
```
IFNULL is MySQL's function to handle NULL values.

**4.  Filtering NULLs (if appropriate):**
If NULLs represent missing data and shouldn't be included in the sum at all, consider filtering them before aggregation:
```sql
SELECT category, SUM(price) AS total_price
FROM products
WHERE price IS NOT NULL
GROUP BY category;
```
Choose the solution that best aligns with your intended treatment of NULL values.