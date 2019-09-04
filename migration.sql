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

# CREATE TABLE categories (
#      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#      category VARCHAR(100) NOT NULL,
#      PRIMARY KEY (id)
# );

CREATE TABLE cat_ads (
     ad_id INT UNSIGNED NOT NULL,
     category VARCHAR(150) NOT NULL,
     FOREIGN KEY (ad_id) REFERENCES ads(id)
         ON DELETE CASCADE
#      FOREIGN KEY (category_id) REFERENCES categories(id)
#         ON DELETE CASCADE
);
INSERT into users(username,email,password,full_name,address)
Values ('Kyle','kyle@codeup.com','$2a$10$Np9uN3PKPI10iYO1Yv.de.vHgWaJ/VunlS.uAV9eD0d7A044Uj8V2','Kyle Maulsby', 'Somewhere Texas'),
       ('aimbotic','joey@codeup.com','$2a$10$u5N9kGeAOSiqvFl9YdedC','Joey Gonzalez','Somewhere Texas'),
       ('Lam','lam@codeup.com','$2a$10$mZuOLtJvrUWrJkvsgDr8Q.KYlnDRg3wclg6v703Xd78w3r.RrCoZi','Lam Nguyen','Somewhere');

# INSERT INTO categories(category)
# VALUES ('Appliances'),
#        ('Automotive'),
#        ('Clothes'),
#        ('Electronics'),
#        ('Furniture'),
#        ('General'),
#        ('Jewelry'),
#        ('Tools'),
#        ('Toys');
insert into ads(title, description, user_id)
Values ('old bed', 'old bed i never slept in', 1),
       ('2015 mustang gt', 'awesome car my ex totally didn''t destroy', 1),
       ('xbox', 'my video games', 1),
       ('shiny toy gun', 'a toy i never used growing up', 1),
       ('Gold chain','14K cuban link for the low', 1),
       ('Chainsaw','prop from texas chainsaw massacre', 2),
       ('L desk','old but still works like a champ', 2),
       ('2012 fiat','works good but no AC', 2),
       ('24inch BenQ Monitor','almost brand new, 1080p 60hz', 2),
       ('glass martini set','got it for my birthday but never used it', 2),
       ('Dog cage for sale','no rust and big enough for two dogs', 3),
       ('Wedding ring','white gold with a vvs1 caret diamond', 3),
       ('2019 488 Pista Spider','500 miles with track pack. $500K', 3),
       ('Buzz lightyear action figure','old but new', 3),
       ('Gucci Jacket','new but old', 3);

insert into cat_ads(ad_id, category)
values (1,'Furniture'),
       (2,'General'),
       (3,'Electronics'),
       (4,'Toys'),
       (5,'Jewelry'),
       (6,'General'),
       (7,'Furniture'),
       (8,'Automotive'),
       (9,'Electronic'),
       (10,'General'),
       (11,'General'),
       (12,'Jewelry'),
       (13,'Automotic'),
       (14,'Tools'),
       (15,'Cloths');





# CREATE TABLE profile (
#      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#      profile_id INT UNSIGNED NOT NULL,
#
#      PRIMARY KEY(id),
#      FOREIGN KEY (profile_id) REFERENCES users(id)
#         ON DELETE CASCADE
# );

# UPDATE users SET photo = 'https://cdn.filestackcontent.com/qQ9XKFSQ0O6J0iRxPWpn'  where id = 1;

