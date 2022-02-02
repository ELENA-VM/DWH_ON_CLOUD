DROP TABLE If EXISTS sa_books;

CREATE TABLE sa_books
(
  BOOK_ID VARCHAR(4000),
  ISBN VARCHAR(4000),
  PUBLISHER VARCHAR(4000),
  BOOK_TITLE VARCHAR(4000),
  BOOK_AUTHOR VARCHAR(4000),
  YEAR_OF_PUBLICATION VARCHAR(4000),
  AUTHOR_ID VARCHAR(4000),
  CATEGORY_ID VARCHAR(4000),
  CATEGORY VARCHAR(4000),
  SUB_CATEGORY_ID VARCHAR(4000),
  SUB_CATEGORY VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);