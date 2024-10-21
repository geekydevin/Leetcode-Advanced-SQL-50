<h2><a href="https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges">1420. Find the Start and End Number of Continuous Ranges</a></h2><h3>Medium</h3><hr><p>Table: <code>Logs</code></p>

<pre>
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| log_id        | int     |
+---------------+---------+
log_id is the column of unique values for this table.
Each row of this table contains the ID in a log Table.
</pre>

<p>&nbsp;</p>

<p>Write a solution to find the start and end number of continuous ranges in the table <code>Logs</code>.</p>

<p>Return the result table ordered by <code>start_id</code>.</p>

<p>The result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> 
Logs table:
+------------+
| log_id     |
+------------+
| 1          |
| 2          |
| 3          |
| 7          |
| 8          |
| 10         |
+------------+
<strong>Output:</strong> 
+------------+--------------+
| start_id   | end_id       |
+------------+--------------+
| 1          | 3            |
| 7          | 8            |
| 10         | 10           |
+------------+--------------+
<strong>Explanation:</strong> 
The result table should contain all ranges in table Logs.
From 1 to 3 is contained in the table.
From 4 to 6 is missing in the table
From 7 to 8 is contained in the table.
Number 9 is missing from the table.
Number 10 is contained in the table.
</pre>
