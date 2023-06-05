java -jar ./lib/derbyrun.jar server start
--Convenzioni type account: AM = amministratore, SI = simpatizzante, AD = aderente
CONNECT 'jdbc:derby://localhost:1527/Tum4World;create=true';
CREATE TABLE ACCOUNT (Username VARCHAR(50), DataDiNascita DATE, Nome VARCHAR(50), Cognome VARCHAR(50), Email VARCHAR(50), Cellulare VARCHAR(50), Password VARCHAR(50), Type CHAR(2), PRIMARY KEY(Username));
CREATE TABLE DONAZIONE (Importo INT, DataDonazione TIMESTAMP, Account VARCHAR(50), PRIMARY KEY(DataDonazione, Account), FOREIGN KEY(Account) REFERENCES ACCOUNT(Username));
INSERT INTO ACCOUNT VALUES ('admin', '1990-12-12', 'Admin', 'Admin', 'admin@Tum4World.org', '3342852963', '05Adm1n!', 'AM');