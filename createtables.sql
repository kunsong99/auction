
CREATE TABLE admins(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(20),
    psw_hs VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    mobile varchar(20)
);

SELECT * FROM admins;
DROP TABLE admins;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(20),
    psw_hs VARCHAR(100)
);
SELECT * FROM users;

CREATE TABLE user_names(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users("id") ON DELETE NO ACTION,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
SELECT * FROM user_names;
DROP TABLE IF EXISTS user_names;

SELECT *
FROM users
JOIN user_names ON users.id = user_names.user_id;

DROP TABLE users CASCADE ;


CREATE TABLE emails(
    id SERIAL PRIMARY KEY ,
    user_id INT REFERENCES users("id") ON DELETE NO ACTION,
    email VARCHAR(100)
);

CREATE TABLE mobiles(
    id SERIAL PRIMARY KEY ,
    user_id INT REFERENCES users("id") ON DELETE NO ACTION,
    mobile VARCHAR(100)
);

CREATE TABLE companies(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    organization_number VARCHAR(50)
);

CREATE TABLE user_x_company(
    id SERIAL PRIMARY KEY ,
    user_id INT REFERENCES users ("id") ON DELETE NO ACTION,
    company_id INT REFERENCES companies("id") ON DELETE NO ACTION
);

CREATE TABLE addresses(
    id SERIAL PRIMARY KEY,
    street_address VARCHAR(100),
    city VARCHAR(50),
    postnr VARCHAR(20)
);
DROP TABLE addresses;


CREATE TABLE user_x_address(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users("id") ON DELETE NO ACTION,
    address_id INT REFERENCES addresses("id") ON DELETE NO ACTION
);



CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    auction_days int
);


CREATE TABLE document_types(
    id SERIAL PRIMARY KEY,
    type VARCHAR(50)
);


CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES users("id") ON DELETE NO ACTION,
    name VARCHAR(50),
    category_id INT REFERENCES categories("id") ON DELETE NO ACTION,
    quantity DECIMAL,
    unit VARCHAR(10),
    country_of_origin VARCHAR(50),
    description TEXT,
    created_date DATE,
    created_time Time
);


CREATE TABLE documents(
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products("id") ON DELETE NO ACTION,
    type_id INT REFERENCES document_types("id") ON DELETE NO ACTION,
    url VARCHAR
);
drop table documents;


CREATE TABLE auctions(
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products("id") ON DELETE NO ACTION,
    "start_price(SEK)" DECIMAL,
    start_date DATE
);
DROP TABLE auctions;


----


CREATE TABLE bids(
    id INT PRIMARY KEY,
    auction_id INT REFERENCES auctions("id") ON DELETE NO ACTION,
    bidder_id INT REFERENCES users("id") ON DELETE NO ACTION,
    bid_amount DECIMAL,
    bid_date DATE,
    bid_time Time
);



SELECT bidder_id, COUNT(*)
FROM bids
GROUP BY bidder_id;

SELECT *
FROM bids
order by bid_date,bid_time;



DROP TABLE feedbacks;
CREATE TABLE feedbacks(
    id INT PRIMARY KEY,
    auction_id INT REFERENCES auctions("id"),
    commenttime_by_bidwinner TIMESTAMP,
    comment_to_seller TEXT,
    rating_tO_seller DECIMAL,
    comment_to_product TEXT,
    rating_to_product DECIMAL,
    comment_time_by_seller TIMESTAMP,
    comment_to_bidwinner TEXT,
    rating_to_bidwinner DECIMAL
);

CREATE TABLE conversations(
    id SERIAL PRIMARY KEY
);

---ALTER TABLE conversations SERIAL=1000;

CREATE TABLE messages (
    id SERIAL PRIMARY KEY ,
    conversation_id INT REFERENCES conversations("id") ON DELETE NO ACTION,
    sender_id INT REFERENCES users("id") ON DELETE NO ACTION,
    send_time TIMESTAMP,
    msg TEXT
);




