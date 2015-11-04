CREATE TABLE tblOrders
(
	pmkOrderDate varchar(255) NOT NULL,
	pmkItemNo int NOT NULL,
	fldItemName varchar(255),
	fldQuantity int,
	PRIMARY KEY(pmkOrderDate, pmkItemNo)
);

INSERT INTO tblOrders VALUES ('01-Nov-2011', 1, 'Axle',  10);
INSERT INTO tblOrders VALUES ('01-Nov-2011', 2, 'Rotor', 20);
INSERT INTO tblOrders VALUES ('01-Nov-2011', 3, 'Shaft',  5);

INSERT INTO tblOrders VALUES ('02-Nov-2011', 1, 'Axle',  30);
INSERT INTO tblOrders VALUES ('02-Nov-2011', 3, 'Shaft',  5);

INSERT INTO tblOrders VALUES ('03-Nov-2011', 3, 'Shaft',  5);

INSERT INTO tblOrders VALUES ('04-Nov-2011', 3, 'Shaft',  5);

INSERT INTO tblOrders VALUES ('05-Nov-2011', 3, 'Shaft',  5);
INSERT INTO tblOrders VALUES ('05-Nov-2011', 4, 'Rim',    4);

INSERT INTO tblOrders VALUES ('06-Nov-2011', 3, 'Shaft',  5);

INSERT INTO tblOrders VALUES ('07-Nov-2011', 3, 'Shaft',  5);
INSERT INTO tblOrders VALUES ('07-Nov-2011', 1, 'Axle',  15);

INSERT INTO tblOrders VALUES ('08-Nov-2011', 2, 'Rotor', 10);

-- query here

DROP TABLE tblOrders;