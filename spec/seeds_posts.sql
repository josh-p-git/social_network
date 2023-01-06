TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email, username) VALUES('email@email.com', 'username1');
INSERT INTO users (email, username) VALUES('email2@email.com', 'username2');
INSERT INTO posts (title, content, views, user_id) VALUES('firstpost', 'mycontent', 3, 1);
INSERT INTO posts (title, content, views, user_id) VALUES('secondpost', 'alsomycontent', 5, 1);