-- Active: 1731438237227@@127.0.0.1@3306@ecommerce_db
INSERT INTO categories (name, description) VALUES
('Electronics', 'Gadgets and electronic devices including smartphones, TVs, and laptops.'),
('Clothing', 'Apparel for men, women, and children including shirts, jackets, and shoes.'),
('Books', 'Printed and digital books across various genres and topics.'),
('Home Appliances', 'Appliances and gadgets for household use, like blenders and microwaves.'),
('Beauty', 'Personal care and beauty products including skincare and cosmetics.'),
('Fitness', 'Fitness and exercise equipment like yoga mats, dumbbells, and resistance bands.');


INSERT INTO products (name, description, price, stock, category_id) VALUES
('Wireless Earbuds', 'Bluetooth 5.0 wireless earbuds with noise cancellation.', 29.99, 150, 1),
('Smartphone', 'Latest model with 6.5" screen and 128GB storage.', 699.99, 45, 1),
('Laptop', 'Lightweight laptop with 15.6" display and 8GB RAM.', 899.99, 25, 1),
('4K TV', '55" 4K Ultra HD Smart TV with HDR.', 499.99, 30, 1),
('Smartwatch', 'Waterproof smartwatch with heart rate monitor.', 199.99, 75, 1),
('Denim Jacket', 'Classic blue denim jacket, unisex style.', 59.99, 200, 2),
('Graphic T-Shirt', 'Cotton t-shirt with printed design.', 19.99, 300, 2),
('Running Shoes', 'Breathable and lightweight running shoes.', 89.99, 120, 2),
('Leather Belt', 'Genuine leather belt in black and brown.', 24.99, 100, 2),
('Sweater', 'Warm wool sweater in assorted colors.', 39.99, 180, 2),
('Cookbook', 'Easy recipes for every day cooking.', 14.99, 200, 3),
('Science Fiction Novel', 'An epic space adventure novel.', 9.99, 100, 3),
('Children''s Story Book', 'Illustrated story book for children.', 12.99, 250, 3),
('Business Guide', 'A guide on starting and managing a small business.', 29.99, 70, 3),
('Self-Help Book', 'Tips for personal growth and improvement.', 17.99, 150, 3),
('Blender', 'High-speed blender for smoothies and more.', 79.99, 60, 4),
('Microwave Oven', '900W microwave with digital controls.', 149.99, 40, 4),
('Vacuum Cleaner', 'Cordless vacuum cleaner with powerful suction.', 199.99, 30, 4),
('Air Purifier', 'HEPA air purifier for cleaner indoor air.', 129.99, 80, 4),
('Coffee Maker', '12-cup coffee maker with programmable timer.', 49.99, 90, 4),
('Moisturizer', 'Hydrating face moisturizer for all skin types.', 19.99, 150, 5),
('Shampoo', 'Natural shampoo for all hair types.', 8.99, 200, 5),
('Lipstick', 'Long-lasting matte lipstick in multiple shades.', 12.99, 80, 5),
('Sunscreen', 'SPF 50 sunscreen for daily protection.', 15.99, 120, 5),
('Face Wash', 'Gentle foaming face wash.', 9.99, 140, 5),
('Yoga Mat', 'Eco-friendly yoga mat with non-slip surface.', 24.99, 150, 6),
('Dumbbell Set', 'Adjustable dumbbell set for strength training.', 79.99, 100, 6),
('Resistance Bands', 'Set of resistance bands for workouts.', 14.99, 200, 6),
('Treadmill', 'Electric treadmill with multiple speed options.', 599.99, 20, 6),
('Water Bottle', 'Stainless steel insulated water bottle.', 15.99, 250, 6);


INSERT INTO users (name, email, password, phone, address) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'password_hash_1', '123-456-7890', '123 Maple Street, Springfield, IL'),
('Bob Smith', 'bob.smith@example.com', 'password_hash_2', '234-567-8901', '456 Oak Avenue, Greenfield, CA'),
('Cathy Brown', 'cathy.brown@example.com', 'password_hash_3', '345-678-9012', '789 Pine Road, Rivertown, TX'),
('David Wilson', 'david.wilson@example.com', 'password_hash_4', '456-789-0123', '321 Cedar Blvd, Lakeview, NY'),
('Eva Adams', 'eva.adams@example.com', 'password_hash_5', '567-890-1234', '654 Birch Lane, Mountville, AZ'),
('Frank Taylor', 'frank.taylor@example.com', 'password_hash_6', '678-901-2345', '987 Walnut Drive, Bayside, FL'),
('Grace Lee', 'grace.lee@example.com', 'password_hash_7', '789-012-3456', '258 Elm Street, Sunfield, OH'),
('Henry Martinez', 'henry.martinez@example.com', 'password_hash_8', '890-123-4567', '369 Cherry Court, Westtown, GA'),
('Ivy Garcia', 'ivy.garcia@example.com', 'password_hash_9', '901-234-5678', '147 Aspen Ave, Northwood, MA'),
('Jack White', 'jack.white@example.com', 'password_hash_10', '012-345-6789', '963 Maple Circle, Eastvale, CO'),
('Karen Hall', 'karen.hall@example.com', 'password_hash_11', '123-456-7890', '789 Willow Way, Brookfield, OR'),
('Leo Clark', 'leo.clark@example.com', 'password_hash_12', '234-567-8901', '456 Juniper Blvd, Riverdale, NJ'),
('Mia Lewis', 'mia.lewis@example.com', 'password_hash_13', '345-678-9012', '123 Redwood Street, Fairview, WA'),
('Nina Robinson', 'nina.robinson@example.com', 'password_hash_14', '456-789-0123', '654 Poplar Ave, Hillside, UT'),
('Oscar Wright', 'oscar.wright@example.com', 'password_hash_15', '567-890-1234', '321 Magnolia Lane, Seaview, NV'),
('Paul Walker', 'paul.walker@example.com', 'password_hash_16', '678-901-2345', '987 Beech Rd, Midvale, MT'),
('Quinn Young', 'quinn.young@example.com', 'password_hash_17', '789-012-3456', '258 Palm Blvd, Clearfield, NE'),
('Rachel King', 'rachel.king@example.com', 'password_hash_18', '890-123-4567', '369 Fir Lane, Pleasantville, KY'),
('Sam Scott', 'sam.scott@example.com', 'password_hash_19', '901-234-5678', '147 Dogwood Drive, Brightville, SD'),
('Tina Green', 'tina.green@example.com', 'password_hash_20', '012-345-6789', '963 Hickory Circle, Sunnydale, ID');


INSERT INTO product_reviews (user_id, product_id, rating, comment) VALUES
(1, 2, 5, 'Fantastic smartphone with great features and battery life.'),
(3, 1, 4, 'Good quality earbuds, but battery life could be better.'),
(5, 3, 5, 'Perfect laptop for work and personal use. Highly recommend it!'),
(2, 4, 3, 'Decent TV but had issues with the remote control.'),
(4, 6, 4, 'Stylish denim jacket, fits well and feels durable.'),
(7, 7, 5, 'Great t-shirt with a nice design. Comfortable and affordable.'),
(6, 10, 4, 'Warm and cozy sweater, perfect for the winter season.'),
(8, 12, 5, 'Amazing science fiction novel. Couldn\'t put it down!'),
(9, 18, 3, 'Vacuum cleaner works well, but battery doesn\'t last long.'),
(10, 25, 5, 'Effective sunscreen, no greasy feeling and lasts all day.');
(11, 2, 4, 'Solid phone, but the camera quality could be improved.'),
(12, 5, 5, 'Smartwatch is amazing! Easy to use and has a lot of features.'),
(13, 8, 3, 'Good running shoes, but a bit tight around the toes.'),
(14, 9, 5, 'High-quality leather belt. Goes well with most outfits.'),
(15, 14, 2, 'The book was not as interesting as expected, found it repetitive.'),
(16, 16, 4, 'Blender is powerful, great for smoothies, but a bit noisy.'),
(17, 17, 5, 'Microwave works perfectly and heats up quickly.'),
(18, 20, 4, 'Nice coffee maker, easy to clean but takes a while to brew.'),
(19, 23, 5, 'Great lipstick, long-lasting and smooth application.'),
(20, 26, 3, 'Water bottle keeps drinks cool, but it’s a bit bulky.');

-- Sample data for `orders`
INSERT INTO orders (user_id, status, total) VALUES
(1, 'delivered', 249.98),
(2, 'shipped', 89.99),
(3, 'pending', 159.98),
(4, 'cancelled', 59.99),
(5, 'delivered', 399.99);

-- Sample data for `order_items`
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 2, 1, 249.98),
(2, 7, 1, 89.99),
(3, 4, 1, 159.98),
(4, 6, 1, 59.99),
(5, 3, 1, 399.99),
(1, 1, 1, 249.98),
(2, 8, 1, 89.99),
(3, 10, 1, 159.98),
(4, 9, 1, 59.99),
(5, 5, 1, 399.99);



INSERT INTO cart (user_id) VALUES
(1),
(2),
(3),
(4),
(5);

-- Sample data for `cart_items`
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 2, 2),
(1, 4, 1),
(2, 7, 1),
(3, 6, 3),
(4, 1, 1),
(4, 3, 2),
(5, 8, 1),
(5, 10, 1),
(2, 5, 1),
(3, 9, 2);
