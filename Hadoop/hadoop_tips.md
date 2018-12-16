* COUNT(var) only count the not null value of var, doesn't give you the count of each category in var. Also, if var is a boolean, COUNT only count the number of TRUE, FALSEs would be dropped.

* ORDER BY should be after GROUP BY.

* Statistics in Hive:
  * AVG(var) gives the mean of a numeric column.
  * For mode, we can only count the frequency of the original column and order by the frequency number to get the mode of the column.
  * For median, we can use the percentile function, but be careful about the data type: SELECT percentile(**cast(var as BIGINT)**, 0.5) FROM table;
