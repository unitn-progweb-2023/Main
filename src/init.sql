java -jar ./lib/derbyrun.jar server start

CREATE TABLE ACCOUNT (Username VARCHAR(50) PRIMARY_KEY, DataDiNascita DATE, Nome VARCHAR(50), Cognome VARCHAR(50), Email VARCHAR(50), Cellulare VARCHAR(50), Password VARCHAR(50));
CREATE TABLE DONAZIONE (Importo INT, DataDonazione DATE, Account VARCHAR(50), PRIMARY KEY(DataDonazione, Account), FOREIGN KEY(Account) REFERENCES ACCOUNT(Username));