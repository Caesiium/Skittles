CREATE TABLE supermarkets (
	supermarket_id SERIAL PRIMARY KEY,
	supermarket_name VARCHAR(255)
);


CREATE TABLE groceries (
	grocery_id SERIAL PRIMARY KEY, 
	grocery_name VARCHAR(255) NOT NULL, 
	grocery_price DECIMAL NOT NULL, 
	supermarket_id INT NOT NULL, 
	grocery_type VARCHAR(50), 
	FOREIGN KEY (supermarket_id) REFERENCES 		supermarkets(supermarket_id)
);

CREATE TABLE users (
	user_id SERIAL NOT NULL PRIMARY KEY, 
	user_name VARCHAR(255) NOT NULL, 
	user_email VARCHAR(255) NOT NULL, 
	user_password VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY, 
	supermarket_id INT NOT NULL, 
	total_price DECIMAL, 
	order_made DATE NOT NULL DEFAULT CURRENT_DATE, 
	FOREIGN KEY (supermarket_id) REFERENCES supermarkets(supermarket_id)
);

CREATE TABLE users_in_order (
	user_in_order_id SERIAL PRIMARY KEY, 
	order_id INT NOT NULL, 
	user_id INT NOT NULL, 
	FOREIGN KEY (order_id) REFERENCES orders(order_id), 
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items_in_order(
	item_in_order_id SERIAL PRIMARY KEY, 
	order_id INT NOT NULL, 
	user_id INT NOT NULL, 
	grocery_id INT NOT NULL, 
	quantity INT NOT NULL, 
	price DECIMAL NOT NULL, 
	total_price DECIMAL GENERATED ALWAYS AS(price * quantity)
STORED, 
	FOREIGN KEY (order_id) REFERENCES orders(order_id), 
	FOREIGN KEY (user_id) REFERENCES users(user_id), 
	FOREIGN KEY (grocery_id) REFERENCES groceries(grocery_id)
);






