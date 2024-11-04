-- (i) EXPLAIN output of any query of your choice that involves the “postalCode” of the “customers” relation in the WHERE clause and that does not use any index to retrieve its results.
EXPLAIN SELECT * FROM customers WHERE postalCode BETWEEN '100' AND '2000' ORDER BY postalCode ASC;

-- OUTPUT FOR 1
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
|  1 | SIMPLE      | customers | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   14 |    11.11 | Using where; Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
1 row in set, 1 warning (0.01 sec)

-- (ii) Code to create a B+ Tree index on the column “postalCode” in the table “customers”.
CREATE INDEX idx_postalcode_desc ON customers (postalCode DESC);

-- (iii) EXPLAIN output of the same query showing that it is using the created index to retrieve the results.
EXPLAIN SELECT * FROM customers WHERE postalCode BETWEEN '100' AND '2000' ORDER BY  postalCode DESC;
-- OUTPUT FOR 3
+----+-------------+-----------+------------+------+---------------------+------+---------+------+------+----------+-----------------------------+
| id | select_type | table     | partitions | type | possible_keys       | key  | key_len | ref  | rows | filtered | Extra
 |
+----+-------------+-----------+------------+------+---------------------+------+---------+------+------+----------+-----------------------------+
|  1 | SIMPLE      | customers | NULL       | ALL  | idx_postalcode_desc | NULL | NULL    | NULL |   14 |   100.00 | Using where; Using filesort |
+----+-------------+-----------+------------+------+---------------------+------+---------+------+------+----------+-----------------------------+
1 row in set, 1 warning (0.00 sec)

-- done
