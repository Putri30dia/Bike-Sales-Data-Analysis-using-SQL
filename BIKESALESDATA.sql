select 
		ord.order_id,
		CONCAT(cus.first_name,' ',cus.last_name) AS 'customers',
		cus.city,
		cus.state,
		ord.order_date,
		SUM(ite.quantity) AS 'total_units',
		SUM(ite.quantity * ite.list_price) AS 'revenue',
		pro.product_name,
		cat.category_name,
		bra.brand_name,
		sto.store_name,
		concat(sta.first_name,' ',sta.last_name) AS 'sales_rep'
from
		sales.orders ord
join	sales.customers cus
ON		ord.customer_id = cus.customer_id 
join	sales.order_items ite
ON		ord.order_id = ite.order_id
join	production.products pro
ON		ite.product_id = pro.product_id
join	production.categories cat
ON		pro.category_id = cat.category_id
join	production.brands bra
ON		bra.brand_id = pro.brand_id
join	sales.stores sto
ON		sto.store_id = ord.store_id
join	sales.staffs sta
ON		ord.staff_id = sta.staff_id

Group BY
		ord.order_id,
		CONCAT(cus.first_name,' ',cus.last_name),
		cus.city,
		cus.state,
		ord.order_date,
		pro.product_name,
		cat.category_name,
		bra.brand_name,
		sto.store_name,
		concat(sta.first_name,' ',sta.last_name)