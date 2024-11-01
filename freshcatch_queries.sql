--1. As an admin, i can see how many users we have in the system
SELECT COUNT(*)
FROM users;
-- There's 83 users in the system.




--2. som administratör kan jag se hur många användare som har flera e-postmeddelanden, mobiler, företag eller adresser registrerade i systemet
SELECT COUNT(*) as mobiles_amount,mobiles.user_id
FROM mobiles
GROUP BY user_id
having COUNT(*) > 1;

SELECT COUNT(*) as emails_amount,emails.user_id
FROM emails
GROUP BY user_id
having COUNT(*) > 1;

SELECT COUNT(*) as companies_amount,user_x_company.user_id
FROM user_x_company
GROUP BY user_id
having COUNT(*) > 1;

SELECT COUNT(*) as addresses_amount,user_x_address.user_id
FROM user_x_address
GROUP BY user_id
having COUNT(*) > 1;
-- There's 7 users has multiple mobiles, 8 people has multiple emails, 5 people has multiple addresses amd none has multiple companies registered in the system






--3. Som admin kan jag se om någon jobbar för samma företag
SELECT count(user_id),company_id
FROM user_x_company
GROUP BY company_id
HAVING COUNT(user_id)>1;
-- än så länge jobbar ingen på samma företag





--4, as an admin, I can see the user profile list
---------------------------------------------mobile
DROP VIEW IF EXISTS user_mobiles;
CREATE VIEW user_mobiles AS
WITH mobileperuser AS(
SELECT users.id, mobiles.mobile, ROW_NUMBER() OVER (PARTITION BY users.id)
FROM users
JOIN mobiles ON users.id = mobiles.user_id
)
SELECT id, string_agg(mobile,'; ') AS mobiles
FROM mobileperuser
GROUP BY id
ORDER BY id;
---------------------------------------------email
DROP VIEW IF EXISTS user_emails;
CREATE VIEW user_emails AS
WITH emailperuser AS(
SELECT users.id, email, ROW_NUMBER() OVER (PARTITION BY users.id ORDER BY emails.id)
FROM users
JOIN emails ON users.id = emails.user_id
)
SELECT id, string_agg(email,'; ') AS emails
FROM emailperuser
GROUP BY id
ORDER BY id;

---------------------------------------------company
DROP VIEW IF EXISTS user_company;
CREATE VIEW user_company AS
SELECT users.id, user_name,
       companies.name AS company,companies.organization_number
FROM users
LEFT JOIN user_x_company ON users.id = user_x_company.user_id
LEFT JOIN companies ON companies.id = user_x_company.company_id;

---------------------------------------------address
DROP VIEW IF EXISTS user_addresses;
CREATE VIEW user_addresses AS
WITH addressperuser AS(
    WITH sub AS
    (SELECT user_id,
           concat(street_address,', ', city,', ', postnr) AS address
    FROM users
    JOIN user_x_address ON users.id = user_x_address.user_id
    LEFT JOIN addresses ON addresses.id = user_x_address.address_id)
SELECT users.id,address, ROW_NUMBER() OVER (PARTITION BY users.id)
FROM users
JOIN sub ON users.id = sub.user_id
)
SELECT id, string_agg(address,'; ') AS address
FROM addressperuser
GROUP BY id
ORDER BY id;

---------------------------------------------user_profiles
DROP VIEW IF EXISTS user_list;
CREATE VIEW user_list AS
SELECT users.id,users.user_name,first_name,last_name,
       mobiles,emails,company,organization_number,address
FROM users
LEFT JOIN user_names ON users.id = user_names.user_id
LEFT JOIN user_mobiles ON users.id = user_mobiles.id
LEFT JOIN user_emails ON users.id = user_emails.id
LEFT JOIN user_company ON users.id = user_company.id
LEFT JOIN user_addresses ON users.id = user_addresses.id
ORDER BY users.id;


--5. Som admin, Jag kan se användare i systemet som inte har en registrerad e-post eller mobiltelefon
SELECT *
FROM user_list
WHERE mobiles IS NULL OR emails IS NULL;
-- There's 3 people with no mobiles in the system.





--6. as an admin, I can see all the auctions
DROP VIEW IF EXISTS auction_list_details;
CREATE VIEW auction_list_details AS
SELECT auctions.id AS auction_id,
       user_list.id AS seller_id, CONCAT(user_list.first_name,' ',user_list.last_name) AS seller,
       product_id,products.name AS product, concat(products.quantity,' ',products.unit) as quantity,
       category_id, categories.name AS category_name,
       auctions."start_price(SEK)" AS "start_price(SEK)",
       auctions.start_date AS auction_start,auctions.start_date + categories.auction_days AS auction_end,
        CASE
            WHEN auctions.start_date > CURRENT_DATE THEN 'upcoming'
            WHEN auctions.start_date + categories.auction_days < CURRENT_DATE THEN 'closed'
            WHEN auctions.start_date + categories.auction_days >= CURRENT_DATE THEN 'ongoing'
            ELSE 'opps...'
        END AS status
FROM auctions
JOIN products ON auctions.product_id = products.id
JOIN categories ON products.category_id = categories.id
JOIN user_list ON products.seller_id = user_list.id
ORDER BY auction_id;

DROP VIEW IF EXISTS auction_list;
CREATE VIEW auction_list AS
SELECT auction_id, seller,
       product,quantity,category_name,"start_price(SEK)",auction_start,auction_end,status
FROM auction_list_details
ORDER BY auction_id;





--7.Som användare vill jag kunna se en lista över alla tillgängliga auktioner så att jag kan välja vilka jag vill delta i.
SELECT *
FROM auction_list
WHERE auction_list.status = 'ongoing';





--8. as admin, I can see the bidding summary for all auctions
DROP VIEW IF EXISTS auction_summary;
CREATE VIEW auction_summary AS
SELECT bids.auction_id,auction_list_details.status,
       auction_list_details.seller_id,auction_list_details.seller,
       auction_list_details.product_id,auction_list_details.product,
       auction_list_details.category_id,auction_list_details.category_name,
       auction_list_details."start_price(SEK)",
       auction_list_details.auction_start,auction_list_details.auction_end,
       sub.count_of_bids, sub."highest_bid(SEK)",bids.bidder_id AS winner_id,
       CONCAT(user_list.first_name,' ',user_list.last_name) AS winner
FROM bids
JOIN (SELECT auction_id,COUNT(*) AS count_of_bids,MAX(bid_amount) AS "highest_bid(SEK)"
    FROM bids
    GROUP BY auction_id) AS sub
    ON sub.auction_id = bids.auction_id AND bids.bid_amount = sub."highest_bid(SEK)"
JOIN user_list ON bids.bidder_id = user_list.id
JOIN auction_list_details ON bids.auction_id = auction_list_details.auction_id
ORDER BY bids.auction_id;





--9 som köpare kan jag se budgivningsstatus för auktionen jag är intresserad av
SELECT bidder_id,bid_amount,bid_date,bid_time
FROM bids
WHERE auction_id = 6;





--10. Som köpare kan jag se auktioner i en viss kategori
SELECT *
FROM auction_list
WHERE category_name = 'seafood';





--11. som admin kan jag se hur många bud det finns per auktion i genomsnitt?
SELECT avg(count_of_bids) AS counts_of_bids_per_auction
FROM auction_summary
WHERE status = 'closed';





--12. Som admin kan jag se vilken auktion som fick flest bud
WITH sub AS
(SELECT MAX(count_of_bids) AS max
FROM auction_summary)
SELECT *
FROM auction_summary
JOIN sub ON count_of_bids = sub.max;
--Auktion 1 fick 9 bud och var den auktion som fick flest bud





-- Som admin kan jag fatta en list med användare som är både säljare och budgivare
SELECT seller_id,seller
FROM auction_list_details, bids
WHERE seller_id = bids.bidder_id;
--user_id = 16, Grace Lee,has been both a seller and a bidder





--13. Som köpare kan jag se säljarens snittbetyg
DROP VIEW IF EXISTS ratings;
CREATE VIEW ratings AS
SELECT feedbacks.auction_id, seller_id,rating_to_seller,winner_id,rating_to_bidwinner
FROM feedbacks, auction_summary
WHERE feedbacks.auction_id = auction_summary.auction_id;


SELECT seller_id,AVG(rating_to_seller)
FROM ratings
WHERE seller_id = 14
GROUP BY seller_id;
--Det genomsnittliga betyget som säljare 14 får är 4.75.





--14. Som säljare kan jag se köparens snittbetyg
SELECT winner_id,AVG(rating_to_bidwinner)
FROM ratings
WHERE winner_id = 16
GROUP BY winner_id;
--Det genomsnittliga betyget som säljare 16 får är 4.8.






--15. Som ADMIN kan jag se alla säljares och alla köpares snittbetyg
SELECT AVG(rating_to_seller) AS avg_rating_to_seller,
       AVG(rating_to_bidwinner) AS avg_rating_to_buyer
FROM ratings;
--Det genomsnittliga betyget som alla säljare får är 4.42, som alla köpare får är 4.56








--as an admin, I can sign up a new account
INSERT INTO admins values (11,'AliciaG','%^&*F3@Jkl74',
                           'Alicia','Green',
                           'Alicia.Green@freshcatch.com','+46809616794');

SELECT *
FROM admins
WHERE  first_name = 'Alicia';


DELETE
FROM admins
WHERE  first_name = 'Alicia';






--as an user, I can update my product information
UPDATE products
SET quantity = 100
WHERE seller_id = 51 and name = 'Shrimp';

SELECT *
FROM products
WHERE seller_id = 51 and name = 'Shrimp';



-- as a user, I can delete my address info
SELECT *
FROM user_x_address
WHERE user_id = 93;
---86,93,86

SELECT *
FROM addresses
WHERE id = 86;
---86,toarp 33,Lund,22100


DELETE FROM user_x_address
WHERE user_id = 93;

DELETE FROM addresses
WHERE id NOT IN (SELECT address_id FROM user_x_address);



INSERT INTO addresses VALUES (86,'toarp 33','Lund','22100');
INSERT INTO user_x_address  VALUES (86,93,86);