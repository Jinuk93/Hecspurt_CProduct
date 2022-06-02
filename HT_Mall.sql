Create table HT_User (
  Userid VARCHAR2(15) NOT NULL,
  pwd VARCHAR2(15) NOT NULL,
  Uname VARCHAR2(15) NOT NULL,
  tell VARCHAR2(15),
  email VARCHAR2(20),
  address VARCHAR2(100),
  power VARCHAR2(1) DEFAULT 'U',
  constraint user_id_pk PRIMARY KEY(userID)  
  );

  CREATE SEQUENCE product_id_seq START WITH 1;
  Create Table HT_Product(
    proId NUMBER DEFAULT product_id_seq.nextval NOT NULL,
    pname VARCHAR2(50) NOT NULL,
    unitPrice NUMBER NOT NULL,
    stock NUMBER NOT NULL,
    category VARCHAR2(30) NOT NULL,
    content VARCHAR2(500),
    regDate date default SYSdate NOT NULL,
    updateDate date default sysdate  NOT NULL,
    userid VARCHAR2(15),
    constraint product_uid_pk PRIMARY KEY (proID),
    constraint product_uid_fk FOREIGN KEY(userid) REFERENCES HT_USER(userid)ON DELETE CASCADE
  );

  
  CREATE SEQUENCE review_id_seq START WITH 1;
  CREATE TABLE HT_Review(
    rid NUMBER default review_id_seq.nextval NOT NULL,
    userId VARCHAR2(15) NOT NULL,
    proID NUMBER NOT NULL,
    rScore Number(10,0) NOT NULL,
    content VARCHAR2(500) NOT NULL,
    regDate date default SYSdate NOT NULL,
    updateDate date default sysdate  NOT NULL,
    constraint review_id_pk PRIMARY KEY(rid),
    constraint review_uid_fk FOREIGN KEY(userid)REFERENCES HT_USER(userId) ON DELETE SET NULL,
    constraint review_pid_fk FOREIGN KEY(proID) REFERENCES HT_Product(proID) ON DELETE CASCADE
  );
  
  CREATE SEQUENCE cart_id_Seq START WITH 1;
  CREATE TABLE HT_CART (
    cid NUMBER DEFAULT cart_id_seq.nextval NOT NULL,
    UserID VARCHAR2(15) NOT NULL,
    ProID NUMBER NOT NULL,
    amount NUMBER NOT NULL,
    constraint cart_id_pk PRIMARY KEY(cid),
    constraint cart_uid_fk FOREIGN KEY(userid)REFERENCES HT_USER(userId) ON DELETE CASCADE,
    constraint cart_pid_fk FOREIGN KEY(proID) REFERENCES HT_Product(proID) ON DELETE SET NULL
  );
  
  
  CREATE SEQUENCE shipment_id_Seq START WITH 1;
  CREATE TABLE HT_Shipment(
    sid NUMBER DEFAULT shipment_id_seq.nextval NOT NULL,
    UserID VARCHAR2(15) NOT NULL,
    cid NUMBER NOT NULL,
    reciever VARCHAR2(15) NOT NULL,
    sAddress VARCHAR2(100) NOT NULL,
    sTell VARCHAR2(100) ,
    sEmail VARCHAR2(20),
    pDate date DEFAULT sysdate NOT NULL,
    sDate date Default sysdate NOT NULL,
    constraint shipment_id_pk PRIMARY KEY(sid),
    constraint shipment_uid_fk FOREIGN KEY(userid)REFERENCES HT_USER(userId) ON DELETE CASCADE,
    constraint shipment_cid_fk FOREIGN KEY(cID) REFERENCES HT_Cart(cid) ON DELETE CASCADE
  );
  Insert INTO ht_user (userID,pwd,uName,power ) VALUES('admin1','0000','admin1','A');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트1',500,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트2',5000,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트3',200,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트4',900,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트5',800,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트6',1000,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트7',10000,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트8',2500,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트9',6500,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트10',5500,99,'shirt','admin1');
INSERT INTO ht_PRODUCT(Pname,UNITPRICE,STOCK,CATEGORY,userID) VALUES('테스트11',7500,99,'shirt','admin1');




drop table tbl_attach;
CREATE TABLE tbl_attach(
       uuid varchar2(100) NOT NULL,
       uploadPath varchar2(200) NOT NULL,
       fileName varchar2(100) NOT NULL,
       fileType char(1) DEFAULT'I',
       proID number(10,0)
       );
   ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach PRIMARY KEY(uuid);
   ALTER TABLE tbl_attach ADD CONSTRAINT fk_board_attach FOREIGN KEY(proID) REFERENCES HT_PRODUCT(proID);
  
    DROP TABLE HT_Product;
    DROP TABLE HT_USER;

    alter table ht_product add ImageName varchar(255);