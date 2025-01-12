/*
Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing 
them to browse menus, place orders, and get meals delivered to their doorsteps.

Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, 
each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping 
error and return the proper pairing of order ID and item.

If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, if the last 
item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.

In the results, return the correct pairs of order IDs and items.

This one was hard AF LMAO, not gonna lie. Could not do it by myself sadly.
*/

SELECT 
  o.order_id,
  CASE 
    WHEN o.order_id % 2 != 0 AND order_id < (SELECT COUNT(*) FROM orders)
    THEN (SELECT item FROM orders WHERE order_id=o.order_id+1)
    WHEN o.order_id % 2 = 0
    THEN (SELECT item FROM orders WHERE order_id=o.order_id-1)
    ELSE (SELECT item FROM orders WHERE order_id = (SELECT COUNT(*) FROM orders))
  END
FROM orders o
