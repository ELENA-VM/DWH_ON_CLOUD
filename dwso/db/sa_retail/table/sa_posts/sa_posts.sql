DROP TABLE IF EXISTS sa_posts;

CREATE TABLE sa_posts
(
  POST_ID  VARCHAR(4000),
  POST_NAME  VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);