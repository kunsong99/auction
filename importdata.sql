--INSERT INTO products VALUES (1, 'Ekologiska gurkor',1,100,'kg','Crisp and fresh organic cucumbers.','2024-03-10');


\copy admins FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/admins.csv' DELIMITER ';' CSV HEADER;

\copy users FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/users.csv' DELIMITER ';' CSV HEADER;
\copy user_names FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/user_names.csv' DELIMITER ',' CSV HEADER;

\copy mobiles FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/mobiles.csv' DELIMITER ',' CSV HEADER;
\copy emails FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/emails.csv' DELIMITER ',' CSV HEADER;

\copy companies FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/companies.csv' DELIMITER ',' CSV HEADER;
\copy user_x_company FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/user_x_company.csv' DELIMITER ',' CSV HEADER;

\copy user_x_address FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/user_x_address.csv' DELIMITER ',' CSV HEADER;

\copy categories FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/categories.csv' DELIMITER ',' CSV HEADER;

\copy document_types FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/document_types.csv' DELIMITER ',' CSV HEADER;

\copy products FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/products.csv' DELIMITER ',' CSV HEADER;

\copy documents FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/documents.csv' DELIMITER ',' CSV HEADER;

\copy auctions FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/auctions.csv' DELIMITER ',' CSV HEADER;

\copy bids FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/bids.csv' DELIMITER ',' CSV HEADER;

\copy feedbacks FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/feedbacks.csv' DELIMITER ',' CSV HEADER;

\copy conversations FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/conversations.csv' DELIMITER ',' CSV HEADER;

\copy messages FROM '/Users/dsk/Nutstore Files/Nutstore/05DM24/DAD30/auction/messages.csv' DELIMITER ',' CSV HEADER;




-----addresses
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (1, 'upproret 75E', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (2, 'toarp 37', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (3, 'upproret 33', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (4, 'supgränd 66F', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (5, 'solhem', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (6, 'stcityorget 55', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (7, 'storgatan 57A', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (8, 'kungstorget 49', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (9, 'upproret 42', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (10, 'toarp 2', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (11, 'nattgränd 4', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (12, 'nattgränd 39', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (13, 'upproret 1', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (14, 'ullstorp 72E', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (15, 'slutet 19B', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (16, 'bo 47', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (17, 'spagettiupploppet 32C', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (18, 'toarp 57', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (19, 'storgatan 8', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (20, 'toarp 9D', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (21, 'upproret 11', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (22, 'byvägen 2', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (23, 'storgatan 24', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (24, 'byvägen 17F', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (25, 'upproret 65D', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (26, 'falsterbogatan 12', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (27, 'trädgårdsgatan 9', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (28, 'solhem', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (29, 'diagonalen 50', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (30, 'supgränd 37F', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (31, 'bo 40', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (32, 'alabastergränd 70B', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (33, 'bo 47', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (34, 'storgatan 39', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (35, 'diagonalen 69F', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (36, 'toarp 49', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (37, 'spagettiupploppet 29', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (38, 'byvägen 73B', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (39, 'narvavägen 52', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (40, 'diagonalen 16', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (41, 'kungstorget 70', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (42, 'trädgårdsgatan 59', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (43, 'supgränd 43E', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (44, 'slutet 30', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (45, 'kungstorget 15C', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (46, 'storgatan 67', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (47, 'spagettiupploppet 64', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (48, 'ullstorp 7', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (49, 'slutet 9F', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (50, 'kungstorget 7B', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (51, 'narvavägen 24', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (52, 'narvavägen 70E', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (53, 'alabastergränd 31', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (54, 'trädgårdsgatan 19', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (55, 'solhem 72C', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (56, 'narvavägen 67', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (57, 'toarp 35D', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (58, 'supgränd 13', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (59, 'kungstorget 1', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (60, 'falsterbogatan 29E', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (61, 'trädgårdsgatan 70', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (62, 'falsterbogatan 56', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (63, 'stcityorget 57A', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (64, 'bo 41', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (65, 'bo 32', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (66, 'upproret 28', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (67, 'supgränd 20', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (68, 'diagonalen 75', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (69, 'kungstorget 15', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (70, 'diagonalen 44', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (71, 'spagettiupploppet 65C', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (72, 'falsterbogatan 55', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (73, 'bo 67', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (74, 'alabastergränd 34', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (75, 'solhem', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (76, 'solhem', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (77, 'narvavägen 29', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (78, 'supgränd 53', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (79, 'toarp 68D', 'Sjöbo', '27500');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (80, 'stcityorget 44', 'Helsingborg', '25000');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (81, 'upproret 45', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (82, 'toarp 49', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (83, 'kungstorget 52', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (84, 'storgatan 52', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (85, 'trädgårdsgatan 28', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (86, 'toarp 33', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (87, 'falsterbogatan 51', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (88, 'storgatan 47', 'Tomelilla', '27300');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (89, 'ullstorp 18D', 'Degeberga', '21230');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (90, 'ullstorp 65', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (91, 'storgatan 6', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (92, 'alabastergränd 15', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (93, 'toarp 39', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (94, 'stcityorget 14C', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (95, 'bo 65', 'Svedala', '23041');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (96, 'slutet 45B', 'Skurup', '27400');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (97, 'byvägen 28', 'Malmö', '22050');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (98, 'spagettiupploppet 8', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (99, 'falsterbogatan 30', 'Lund', '22100');
-- INSERT INTO addresses (id, street_address, city, postnr) VALUES (100, 'byvägen 10', 'Sjöbo', '27500');
