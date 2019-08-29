USE adlister_db;

DROP TABLE IF EXISTS cat_ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(250),
    address VarChar(250),
    photo VarChar(350),
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE categories (
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     category VARCHAR(100) NOT NULL,
     PRIMARY KEY (id)
);

CREATE TABLE cat_ads (
     ad_id INT UNSIGNED NOT NULL,
     category_id INT UNSIGNED NOT NULL,
     FOREIGN KEY (ad_id) REFERENCES ads(id)
         ON DELETE CASCADE,
     FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

INSERT INTO categories(category)
VALUES ('Appliances'),
       ('Automotive'),
       ('Clothes'),
       ('Electronics'),
       ('Furniture'),
       ('General'),
       ('Jewelry'),
       ('Tools'),
       ('Toys');

insert into ads(title, description, user_id)
Values ('old bed', 'old bed i never slept in', 1),
       ( '2015 mustang gt', 'awesome car my ex totally didn''t destroy', 1),
       ('xbox', 'my video games', 1),
       ('shiny toy gun', 'a toy i never used growing up', 1);

# CREATE TABLE profile (
#      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#      profile_id INT UNSIGNED NOT NULL,
#
#      PRIMARY KEY(id),
#      FOREIGN KEY (profile_id) REFERENCES users(id)
#         ON DELETE CASCADE
# );


