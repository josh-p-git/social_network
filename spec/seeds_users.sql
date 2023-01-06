TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email, username) VALUES('email@email.com', 'username1');
INSERT INTO users (email, username) VALUES('email2@email.com', 'username2');