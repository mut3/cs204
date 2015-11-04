CREATE TABLE tblOrders
(
	pmkOrderDate date NOT NULL,
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
-- write a single select statement that calculates, for each item with two or more orders, the average number of days between two consecutive orders.
SELECT pmkItemNo, AVG (timeTaken) AS avg_interval
FROM tblOrders
JOIN (
	SELECT pmkItemNo AS refItemNo, pmkOrderDate AS refOrderDate, DIFFDATE (nextDate, pmkOrderDate) AS timeTaken
	FROM tblOrders tblOrds
	JOIN (
		SELECT TOP 1 pmkOrderDate
		FROM tblOrders
		WHERE pmkOrderDate > tblOrds.pmkOrderDate
		AND fldItemName = tblOrds.fldItemName
		ORDER BY pmkOrderDate
	)
)
ON pmkItemNo = refItemNo 
AND pmkOrderDate = refOrderDate
GROUP BY pmkItemNo;

-- maybe use CASE?
-- write out logic of this query and then try implementing




DROP TABLE tblOrders;