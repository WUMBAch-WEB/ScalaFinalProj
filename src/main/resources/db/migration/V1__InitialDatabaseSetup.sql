CREATE TABLE USERS (
  ID         BIGSERIAL PRIMARY KEY,
  USER_NAME  VARCHAR NOT NULL UNIQUE,
  FIRST_NAME VARCHAR NOT NULL,
  LAST_NAME  VARCHAR NOT NULL,
  PHONE      VARCHAR NOT NULL,
  PASSWORD   VARCHAR NOT NULL
);

CREATE TABLE CARS (
  ID            BIGSERIAL PRIMARY KEY,
  MODEL         VARCHAR NOT NULL,
  CAR_NUMBER    VARCHAR NOT NULL UNIQUE,
  OWNER_ID      INT8 NOT NULL REFERENCES USERS (ID) ON DELETE CASCADE
);

CREATE TABLE MANUFACTORY (
  ID         BIGSERIAL PRIMARY KEY,
  NAME       VARCHAR NOT NULL UNIQUE,
  STATUS     VARCHAR NOT NULL
);

CREATE TABLE ORDERS (
  ID                BIGSERIAL PRIMARY KEY,
  PRICE             INT NOT NULL,
  MANUFACTORY_ID    INT8 NOT NULL,
  CAR_ID            INT8 NOT NULL,
  ORDER_DATE        VARCHAR NULL,
  COMPLETE          BOOLEAN NOT NULL
);