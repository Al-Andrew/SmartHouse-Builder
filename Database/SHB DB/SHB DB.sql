CREATE TABLE `user` (
  `id` int PRIMARY KEY,
  `username` varchar2,
  `password` varchar2,
  `email` varchar2
);

CREATE TABLE `post` (
  `id` int PRIMARY KEY,
  `id_user` int,
  `type` varchar2,
  `title` varchar2,
  `posted_date` date,
  `content` clob
);

CREATE TABLE `comment` (
  `id` int PRIMARY KEY,
  `id_user` int,
  `id_post` int,
  `content` clob,
  `posted_date` date,
  `number_reacts` int
);

CREATE TABLE `post_setup` (
  `id` int PRIMARY KEY,
  `id_setup` int
);

CREATE TABLE `setup` (
  `id` int PRIMARY KEY,
  `name` varchar2,
  `path` varchar2,
  `user_id` int
);

CREATE TABLE `tag` (
  `id` int PRIMARY KEY,
  `id_post` int,
  `name_tag` varchar2
);

CREATE TABLE `post_item_review` (
  `id` int PRIMARY KEY,
  `id_item` int
);

CREATE TABLE `favorite` (
  `id_post` int,
  `id_user` int,
  PRIMARY KEY (`id_post`, `id_user`)
);

CREATE TABLE `report` (
  `id` int PRIMARY KEY,
  `id_post` int,
  `title` varchar2,
  `motivation` varchar2,
  `date` date
);

CREATE TABLE `products` (
  `id` int PRIMARY KEY,
  `category_id` int,
  `name` varchar(255),
  `price` float,
  `rating` float,
  `forum_link` varchar(255)
);

CREATE TABLE `wishlists` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `create_date` date,
  `name` varchar(255)
);

CREATE TABLE `wishlist_items` (
  `product_id` int,
  `wishlist_id` int
);

CREATE TABLE `categories` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `suppliers` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `supplier_items` (
  `supplier_id` int,
  `product_id` int
);

ALTER TABLE `post` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `setup` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `post_setup` ADD FOREIGN KEY (`id`) REFERENCES `post` (`id`);

ALTER TABLE `post_setup` ADD FOREIGN KEY (`id_setup`) REFERENCES `setup` (`id`);

ALTER TABLE `tag` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `post_item_review` ADD FOREIGN KEY (`id_item`) REFERENCES `products` (`id`);

ALTER TABLE `post_item_review` ADD FOREIGN KEY (`id`) REFERENCES `post` (`id`);

ALTER TABLE `favorite` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `favorite` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `report` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `wishlists` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `wishlist_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `wishlist_items` ADD FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`id`);

ALTER TABLE `supplier_items` ADD FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

ALTER TABLE `supplier_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
