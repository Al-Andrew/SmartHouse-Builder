CREATE TABLE [products] (
  [id] int PRIMARY KEY,
  [category_id] int,
  [name] nvarchar(255),
  [price] float,
  [rating] float,
  [forum_link] nvarchar(255)
)
GO

CREATE TABLE [wishlists] (
  [id] int PRIMARY KEY,
  [user_id] int,
  [create_date] date,
  [name] nvarchar(255)
)
GO

CREATE TABLE [wishlist_items] (
  [product_id] int,
  [wishlist_id] int
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [description] nvarchar(255)
)
GO

CREATE TABLE [suppliers] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [supplier_items] (
  [supplier_id] int,
  [product_id] int
)
GO

ALTER TABLE [products] ADD FOREIGN KEY ([category_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [wishlist_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [wishlist_items] ADD FOREIGN KEY ([wishlist_id]) REFERENCES [wishlists] ([id])
GO

ALTER TABLE [supplier_items] ADD FOREIGN KEY ([supplier_id]) REFERENCES [suppliers] ([id])
GO

ALTER TABLE [supplier_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO
