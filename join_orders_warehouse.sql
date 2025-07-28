SELECT *
FROM my-first-project-445511.warehouse_orders.orders AS orders
JOIN
my-first-project-445511.warehouse_orders.warehouse AS warehouse
ON orders. warehouse_id = warehouse.warehouse_id
