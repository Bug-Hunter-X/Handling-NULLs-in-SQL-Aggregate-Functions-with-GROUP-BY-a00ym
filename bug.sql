In SQL, a common but subtle error arises when using aggregate functions (like SUM, AVG, COUNT) in conjunction with GROUP BY without properly handling NULL values.  Consider this example:

```sql
SELECT category, SUM(price) AS total_price
FROM products
GROUP BY category;
```

If some `price` values are NULL, the `SUM()` function will effectively ignore them. This might lead to inaccurate results if you intended to include NULL prices as zero or handle them differently. For instance, if some products lack a price, your `total_price` for those categories will be understated.