CREATE TABLE `user` (
  `id` int PRIMARY KEY
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
  `id` int PRIMARY KEY
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

CREATE TABLE `item` (
  `id` int PRIMARY KEY
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

ALTER TABLE `post` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `post_setup` ADD FOREIGN KEY (`id`) REFERENCES `post` (`id`);

ALTER TABLE `post_setup` ADD FOREIGN KEY (`id_setup`) REFERENCES `setup` (`id`);

ALTER TABLE `tag` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `post_item_review` ADD FOREIGN KEY (`id_item`) REFERENCES `item` (`id`);

ALTER TABLE `post_item_review` ADD FOREIGN KEY (`id`) REFERENCES `post` (`id`);

ALTER TABLE `favorite` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

ALTER TABLE `favorite` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `report` ADD FOREIGN KEY (`id_post`) REFERENCES `post` (`id`);

