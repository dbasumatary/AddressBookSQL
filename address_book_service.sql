Address Book System

UC1: Create an Address Book Service Database.

mysql> CREATE DATABASE Address_Book_Service;
Query OK, 1 row affected (0.08 sec)

mysql> SHOW DATABASES;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| emp                  |
| information_schema   |
| jdbcappdemo          |
| mysql                |
| payroll_service      |
| performance_schema   |
| practice             |
| rfp                  |
| rfp255               |
| sakila               |
| sys                  |
| world                |
+----------------------+
13 rows in set (0.13 sec)

mysql> USE address_book_service;
Database changed

*******************************************************************************************************************************

UC2: Create a Address Book table with given attributes.

mysql> CREATE TABLE address_book(first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, address VARCHAR(150) NOT NULL, city VARCHAR(50) NOT NULL,
    -> state VARCHAR(50) NOT NULL, zip INT(10) NOT NULL, phone_num INT(15) NOT NULL, email VARCHAR(50) NOT NULL);
Query OK, 0 rows affected, 2 warnings (0.22 sec)

mysql> DESCRIBE address_book;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| first_name | varchar(50)  | NO   |     | NULL    |       |
| last_name  | varchar(50)  | NO   |     | NULL    |       |
| address    | varchar(150) | NO   |     | NULL    |       |
| city       | varchar(50)  | NO   |     | NULL    |       |
| state      | varchar(50)  | NO   |     | NULL    |       |
| zip        | int          | NO   |     | NULL    |       |
| phone_num  | int          | NO   |     | NULL    |       |
| email      | varchar(50)  | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.04 sec)

*********************************************************************************************************************************

UC3: Insert new contacts into the address_book table.

mysql> INSERT INTO address_book (first_name, last_name, address, city, state ,zip, phone_num, email)
    -> VALUES("Harry", "Potter", "Hogwarts", "London", "England", 123456, 9365726, "hpotter@ggg.com");
Query OK, 1 row affected (0.10 sec)

mysql> INSERT INTO address_book (first_name, last_name, address, city, state ,zip, phone_num, email)
    -> VALUES("Jon", "Snow", "Dragonstone", "Winterfell", "Westeros", 654321, 7840349, "jon.snow@ddd.com");
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO address_book (first_name, last_name, address, city, state ,zip, phone_num, email)
    -> VALUES("Eren", "Yeager", "Marley", "Shiganshina", "Eldia", 654789, 1786482, "eren.yeager@mmm.com");
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| first_name | last_name | address     | city        | state    | zip    | phone_num | email               |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| Harry      | Potter    | Hogwarts    | London      | England  | 123456 |   9365726 | hpotter@ggg.com     |
| Jon        | Snow      | Dragonstone | Winterfell  | Westeros | 654321 |   7840349 | jon.snow@ddd.com    |
| Eren       | Yeager    | Marley      | Shiganshina | Eldia    | 654789 |   1786482 | eren.yeager@mmm.com |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
3 rows in set (0.00 sec)

****************************************************************************************************************************

UC4: Edit existing contact person using their first_name only.

mysql> UPDATE address_book SET last_name="Targaryen" WHERE first_name="Jon";
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| first_name | last_name | address     | city        | state    | zip    | phone_num | email               |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| Harry      | Potter    | Hogwarts    | London      | England  | 123456 |   9365726 | hpotter@ggg.com     |
| Jon        | Targaryen | Dragonstone | Winterfell  | Westeros | 654321 |   7840349 | jon.snow@ddd.com    |
| Eren       | Yeager    | Marley      | Shiganshina | Eldia    | 654789 |   1786482 | eren.yeager@mmm.com |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO address_book (first_name, last_name, address, city, state ,zip, phone_num, email)
    -> VALUES("Bran", "Stark", "Raven", "Winterfell", "Westeros", 654321, 7649203, "bran.stark@rrr.com");
Query OK, 1 row affected (0.12 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| first_name | last_name | address     | city        | state    | zip    | phone_num | email               |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
| Harry      | Potter    | Hogwarts    | London      | England  | 123456 |   9365726 | hpotter@ggg.com     |
| Jon        | Targaryen | Dragonstone | Winterfell  | Westeros | 654321 |   7840349 | jon.snow@ddd.com    |
| Eren       | Yeager    | Marley      | Shiganshina | Eldia    | 654789 |   1786482 | eren.yeager@mmm.com |
| Bran       | Stark     | Raven       | Winterfell  | Westeros | 654321 |   7649203 | bran.stark@rrr.com  |
+------------+-----------+-------------+-------------+----------+--------+-----------+---------------------+
4 rows in set (0.00 sec)

*************************************************************************************************************************

UC5: Delete a person using person name.

mysql> DELETE FROM address_book WHERE first_name="Eren";
Query OK, 1 row affected (0.07 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| Harry      | Potter    | Hogwarts    | London     | England  | 123456 |   9365726 | hpotter@ggg.com    |
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   |
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
3 rows in set (0.00 sec)

*************************************************************************************************************************

UC6: Retrieve person belonging to a city or state from the address book;

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| Harry      | Potter    | Hogwarts    | London     | England  | 123456 |   9365726 | hpotter@ggg.com    |
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   |
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE state="England";
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
| first_name | last_name | address  | city   | state   | zip    | phone_num | email           |
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
| Harry      | Potter    | Hogwarts | London | England | 123456 |   9365726 | hpotter@ggg.com |
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE state="Westeros";
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   |
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
2 rows in set (0.00 sec)

**********************************************************************************************************************

UC7: Understand the size of address book by city or state.

mysql> SELECT COUNT(*) FROM address_book WHERE city="London";
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.02 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE city="Winterfell";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE state="England";
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE state="Westeros";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

*******************************************************************************************************************

UC8: Retrieve entries sorted alphabetically by person name for a given city.

mysql> SELECT * FROM address_book WHERE city="London" ORDER BY first_name;
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
| first_name | last_name | address  | city   | state   | zip    | phone_num | email           |
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
| Harry      | Potter    | Hogwarts | London | England | 123456 |   9365726 | hpotter@ggg.com |
+------------+-----------+----------+--------+---------+--------+-----------+-----------------+
1 row in set (0.03 sec)

mysql> SELECT * FROM address_book WHERE city="Winterfell" ORDER BY first_name;
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com |
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+
2 rows in set (0.00 sec)

******************************************************************************************************************

UC9: Identify each address book with name and type

mysql> ALTER TABLE address_book ADD type VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE address_book ADD name VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE address_book SET type = "profession" where first_name = "Harry";
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book SET type = "profession" where first_name = "Jon";
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book SET type = "family" where first_name = "Bran";
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              | type       | name |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+
| Harry      | Potter    | Hogwarts    | London     | England  | 123456 |   9365726 | hpotter@ggg.com    | profession |      |
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   | profession |      |
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com | family     |      |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+
3 rows in set (0.00 sec)

***********************************************************************************************************************************

UC10: Get number of contact persons ie. count by type.

mysql> SELECT COUNT(*) FROM address_book WHERE type="profession";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE type="family";
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

***********************************************************************************************************************************

UC11: Ability to add person to both friend and family.

mysql> ALTER TABLE address_book ADD friend VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.22 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE address_book ADD family VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  UPDATE address_book SET family = "Starks" where first_name = "Jon";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  UPDATE address_book SET family = "Starks" where first_name = "Bran";
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  UPDATE address_book SET friend = "Ron" where first_name = "Harry";
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+--------+--------+
| first_name | last_name | address     | city       | state    | zip    | phone_num | email              | type       | name | friend | family |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+--------+--------+
| Harry      | Potter    | Hogwarts    | London     | England  | 123456 |   9365726 | hpotter@ggg.com    | profession |      | Ron    |        |
| Jon        | Targaryen | Dragonstone | Winterfell | Westeros | 654321 |   7840349 | jon.snow@ddd.com   | profession |      |        | Starks |
| Bran       | Stark     | Raven       | Winterfell | Westeros | 654321 |   7649203 | bran.stark@rrr.com | family     |      |        | Starks |
+------------+-----------+-------------+------------+----------+--------+-----------+--------------------+------------+------+--------+--------+
3 rows in set (0.00 sec)

mysql>