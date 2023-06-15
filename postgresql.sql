create extension if not exists "uuid-ossp";
create type status_enum as enum ('OPEN', 'ORDERED');

create table carts (
	uuid uuid not null default uuid_generate_v4() primary key,
	user_id uuid not null,
	created_at date not null,
	updated_at date not null,
	status status_enum default 'OPEN'
);

create table cart_items (
	cart_id uuid,
	foreign key (cart_id) references carts(uuid),
	product_id uuid,
	count integer
);

insert into carts (user_id) values
	(uuid_generate_v4()),
	(uuid_generate_v4()),
	(uuid_generate_v4());

insert into cart_items (cart_id, product_id, count) values
	('cf6f1be6-e763-4511-8a3f-36e46245af2c', uuid_generate_v4(), 5),
	('a9bbdd46-693c-4bcd-aca0-92cc614df1be', uuid_generate_v4(), 10),
	('44e85316-3e59-49f5-a7b7-ceff790563fc', uuid_generate_v4(), 15),
