-- write your queries here
-- Joins both tables to show every column and record that appears regardless of if there is no owner_id
SELECT * FROM owners o
FULL JOIN vehicles v
ON v.owner_id = o.id;

-- Shows name of owners and their vehicle counts
SELECT o.first_name, o.last_name, COUNT(v.owner_id) FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY (first_name, last_name)
ORDER BY first_name;

-- Shows name of owners and displays average of prices greater than $10,000 from owners with more than 1 car
SELECT o.first_name, o.last_name, ROUND(AVG(price)), COUNT(owner_id)
FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY (o.first_name, o.last_name)
HAVING ROUND(AVG(price)) > 10000 AND COUNT(owner_id) > 1
ORDER BY o.first_name DESC;