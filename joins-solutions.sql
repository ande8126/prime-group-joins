--1. Get all customers and their addresses.

SELECT *
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--2. Get all orders and their line items (orders, quantity and product).

SELECT *
FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;

--3. Which warehouses have cheetos?

SELECT "products".description, "warehouse".id AS "warehouse"
FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

--4. Which warehouses have diet pepsi?

SELECT "products".description, "warehouse".id AS "warehouse"
FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT COUNT(*), "customers".first_name AS "customers"
FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "orders", "customers";

--6. How many customers do we have?

SELECT COUNT(*) FROM "customers";

--7. How many products do we carry

SELECT SUM("warehouse_product".on_hand) 
FROM "warehouse_product";

--8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM("warehouse_product".on_hand), "products".description
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;
















